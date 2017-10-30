fileInput = input('Enter image-file name.\n', 's');
%Preprocessing of image.
I = imread(fileInput);
%I = imrotate(I, 90); % Image has to be vertical or close to it.
I = rgb2gray(I);

%Calling for OCR in Computer Vision Toolbox and writing words to file.
results = ocr(I, 'TextLayout', 'Block');
textFile = fopen('Words.txt','w');
fprintf(textFile, '%s\r\n', string(results.Words));


