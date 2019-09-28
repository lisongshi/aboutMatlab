pt1 = [];

TOTAL_NUM = 3000;
NUM_IN_EACH_GRID = 30;
DISTRI_GRIDSIZE = 100;
ERROR_GRIDSIZE = 100;
for xi = 0:9
    for yi = 0:9
        pt_temp = zeros(NUM_IN_EACH_GRID,2);
        pt_temp(:, 1) = xi * DISTRI_GRIDSIZE + rand(NUM_IN_EACH_GRID,1) * DISTRI_GRIDSIZE;
        pt_temp(:, 2) = yi * DISTRI_GRIDSIZE + rand(NUM_IN_EACH_GRID,1) * DISTRI_GRIDSIZE;
        pt1 = [pt1; pt_temp];
    end
end

% pt1 -> pt2 :add system errors by error grid whith cubic Conv in 2d
sysError = systemError(pt1);
pt2 = pt1 + sysError;

%pt2 -> pt3 : add gross error by rand()

grossErrors = grossError(pt2);
pt3 = zeros(TOTAL_NUM,3);
pt3(:,1) = pt2(:,1) + grossErrors(:,1);
pt3(:,2) = pt2(:,2) + grossErrors(:,2);
pt3(:,3) = grossErrors(:,3);

%draw the point pt1,pt3
figure(1);
axis([0,1000,0,1000]);
plot( pt1(:,1),pt1(:,2),'b.');
hold on;
axis([0,1000,0,1000]);
plot ( pt3(:,1),pt3(:,2),'r.' );


%%check the distrubutions of errors
%testPoint = zeros(TOTAL_NUM,7);
%testPoint(:,1)= pt1(:,1);
%testPoint(:,2)= pt1(:,2);
%testPoint(:,3)= sysError(:,1);
%testPoint(:,4)= sysError(:,2);
%testPoint(:,5)= grossErrors(:,1);
%testPoint(:,6)= grossErrors(:,2);
%testPoint(:,7)= grossErrors(:,3);
%%quiver

%creat correspond point pairs
corPoints = zeros(TOTAL_NUM,4);
corPoints(:,1) = pt1(:,1);
corPoints(:,2) = pt1(:,2);
corPoints(:,3) = pt3(:,1);
corPoints(:,4) = pt3(:,2);

%creat a flag vector to sign the grossError point
flagError = grossErrors(:,3);

