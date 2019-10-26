% read img and transform it to csv format.
% 26 Oct 2019
% 1.this function could change the format of photos 
% from jpg/bmp/png to csv/txt by matrix presenting.
% 2.for use this,you may input the dirction saving photos
% and the number of photos as batchSize.
% 3.for easily run batch,you may change the name of photos 
% as "img1.xxx","img2.xxx" and so on

% eg. i have only one photo in D:\photoData\Test1\,
% so i use it just like imgToCsv( 'D:\photoData\Test1\', 1)

function flag = imgToCsv(inputDir, batchSize)
for iterator = 1:batchSize 
% '.png' could be replaced by '.jpg','.bmp' etc and '.csv'
% could be replaced by '.txt' if you like.
imgDir = sprintf ('%s%s%d%s',inputDir,'img',iterator,'.png');
csvDir = sprintf ('%s%s%d%s',inputDir,'imgCsv',iterator,'.csv');
fp = fopen(csvDir,'w+');
[img] = imread(imgDir);
[row,col,dim] = size(img);
for k = 1:dim
    for i = 1:row
        for j = 1:col
            fprintf(fp, '%d', img(i,j,k));
            fprintf(fp,'%c',',');
        end
       fprintf(fp,'\n');
    end
    fprintf(fp,'\n');
end
flag = fclose(fp);
end