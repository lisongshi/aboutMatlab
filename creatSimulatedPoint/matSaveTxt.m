%not well for the 
%save ('corPoints.txt','corPoints','-ascii');
%save ('corFlagError.txt','corFlagError','-ascii');
%
%filePoint = fopen('corPoints.txt','w+');
%fprintf(filePoint, '%f', corPoints);
%fclose(filePoint);

function [flag] = matSaveTxt(fileName, Matrix, format)
fp = fopen(fileName, 'w+');
[row,col] = size(Matrix);
for i = 1 : row
    if col == 1
        fprintf( fp, format, Matrix(i, col) );
    else
        for j = 1 : col -1
            fprintf( fp, format, Matrix(i, j) );
            fprintf( fp, ' ');
        end
        fprintf( fp, format, Matrix(i, col) );
    end
    fprintf(fp, '\n');
end
flag = fclose(fp);
end