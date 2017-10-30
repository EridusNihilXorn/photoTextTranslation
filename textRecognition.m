cd 'D:\Tools\matlab project\'
fileInput = input('Enter image-file name.\n', 's');
typeOfContent = input('Choice type of task: "Matrix", "Text"\n', 's');
%Preprocessing of image.
I = imread(fileInput);
%I = imrotate(I, 90); % Image has to be vertical or close to it.
I = rgb2gray(I);

%Calling for OCR in Computer Vision Toolbox and writing words to file.
if (strcmp(typeOfContent,'Text'))
    results = ocr(I, 'TextLayout', 'Block');
    textFile = fopen('Words.txt','w');
    fprintf(textFile, '%s\r\n', string(results.Words));
end
if (strcmp(typeOfContent,'Matrix'))
    results = ocr(I, 'TextLayout', 'Block');
    matrixFile = fopen('Matrix.txt','w');
    rows = input('Enter amount of rows.\n');
    columns = input('Enter amount of columns.\n');
    matrix = zeros(rows, columns);
    fprintf(matrixFile, '%d\r\n%d\r\n', rows, columns);
    for i = 1:rows
        for j = 1:columns
            matrix(i, j) = str2double(string(results.Words{(i-1)*columns + j}));
            fprintf(matrixFile, '%d ', matrix(i, j));
        end
        fprintf(matrixFile, '\r\n');
    end
end


