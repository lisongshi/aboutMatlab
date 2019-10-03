pt1 = [];

TOTAL_NUM = 3000;
NUM_IN_EACH_GRID = 30;
DISTRI_GRIDSIZE = 100;

for xi = 0:9
    for yi = 0:9
        pt_temp = zeros(NUM_IN_EACH_GRID,2);
        pt_temp(:, 1) = xi * DISTRI_GRIDSIZE + rand(NUM_IN_EACH_GRID,1) * DISTRI_GRIDSIZE;
        pt_temp(:, 2) = yi * DISTRI_GRIDSIZE + rand(NUM_IN_EACH_GRID,1) * DISTRI_GRIDSIZE;
        pt1 = [pt1; pt_temp];
    end
end

%method 1 : one pair may get system errors + gross errors meantime 
% pt1 -> pt2 :add system errors by error grid whith cubic Conv in 2d
%sysError = systemError(pt1);
%pt2 = pt1 + sysError;
%pt2 -> pt3 : add gross error by rand()
%[grossErrors, corFlagError]  = grossError(pt2);
%pt3 = zeros(TOTAL_NUM,2);
%pt3(:,1) = pt2(:,1) + grossErrors(:,1);
%pt3(:,2) = pt2(:,2) + grossErrors(:,2);

%method 2 : one pair will get only one error  
[errors,corFlagError] = errorsDifferent(pt1);
pt3 = pt1 + errors;

%draw the point pt1,pt3
figure(1);
axis([0,1000,0,1000]);
plot( pt1(:,1),pt1(:,2),'b.');
hold on;
axis([0,1000,0,1000]);
plot ( pt3(:,1),pt3(:,2),'r.' );

%creat correspond point pairs
corPoints = zeros(TOTAL_NUM,4);
corPoints(:,1) = pt1(:,1);
corPoints(:,2) = pt1(:,2);
corPoints(:,3) = pt3(:,1);
corPoints(:,4) = pt3(:,2);

matSaveTxt('D:\code\C++\changeGC\data\TEST-2\100x100\GER=0.2\SE=5,GE=10,Index=1_point.txt', corPoints, '%.8f');
matSaveTxt('D:\code\C++\changeGC\data\TEST-2\100x100\GER=0.2\SE=5,GE=10,Index=1_flag.txt',corFlagError, '%d');
