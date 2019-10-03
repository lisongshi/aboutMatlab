
% set BATCH_SIZE as you like
BATCH_SIZE = 5;

for iterator = 1 : BATCH_SIZE
TOTAL_NUM = 3000;
NUM_IN_EACH_GRID = 30;
DISTRI_GRIDSIZE = 100;
pt1 = [];
for xi = 0:9
    for yi = 0:9
        pt_temp = zeros(NUM_IN_EACH_GRID,2);
        pt_temp(:, 1) = xi * DISTRI_GRIDSIZE + rand(NUM_IN_EACH_GRID,1) * DISTRI_GRIDSIZE;
        pt_temp(:, 2) = yi * DISTRI_GRIDSIZE + rand(NUM_IN_EACH_GRID,1) * DISTRI_GRIDSIZE;
        pt1 = [pt1; pt_temp];
    end
end

%Mthod 1 : one pairs may get systemError and grossError meantime 
% pt1 -> pt2 :add system errors by error grid whith cubic Conv in 2d
%sysError = systemError(pt1);
%pt2 = pt1 + sysError;

%pt2 -> pt3 : add gross error by rand()
%[grossErrors, corFlagError]  = grossError(pt2);
%pt3 = zeros(TOTAL_NUM,2);
%pt3(:,1) = pt2(:,1) + grossErrors(:,1);
%pt3(:,2) = pt2(:,2) + grossErrors(:,2);

%Mthod 2 : one pairs only get systemError or grossError meantime in one
%time
[twoErrors,corFlagError] = errorsDifferent(pt1);
pt3 = pt1 + twoErrors;

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

dir = 'D:\code\C++\changeGC\data\TEST-2\100x100\GER=0.2TEST\';
nameFirst = 'SE=5,GE=10,Index=';
nameLast1 = '_point.txt';
nameLast2 = '_flag.txt';
%sprintf : get the dir & name of file
strPoint = sprintf('%s%s%d%s',dir,nameFirst,iterator,nameLast1);
strFlag = sprintf('%s%s%d%s',dir,nameFirst,iterator,nameLast2);
matSaveTxt( strPoint, corPoints, '%.8f');
matSaveTxt( strFlag, corFlagError, '%d');

end