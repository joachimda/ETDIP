%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%ETDIP1 - Digital Image Processing                                     %%  
%%LAB 1                                                                 %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Close all open windows
clear, close all;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Ex 1.
fileName = 'pcameraman.tiff';
img = imread(fileName);

%Determine image dimensions
whos img;

%Determine pixel range
min(img(:));
max(img(:));

%Show pixels above mean value
m = mean(img(:));
aboveMeanImg = zeros(size(img));
%lr = find(img > m); aboveMean


%Plot the image
figure
subplot(2,2,1);imshow(img);title('Original sample');
subplot(2,2,2);imshow(img(100:150,100:150,:));
title('Part of image (100,150);(100,150)');
subplot(2,2,3);hist(double(img(:)));

%%%%%%%%%% Triple the size of the image using Nearest Neighour %%%%%%%%%%%
E = 3;
imgTripled = zeros(size(img)*E);
for r = 1:size(imgTripled,2)
    for s = 1:size(imgTripled,2)
        imgTripled(r, s) = img(ceil(r/E),ceil(s/E));
    end;
end;

%Show the enlarged image
figure(6)
imshow(uint8(imgTripled));
title('Image enlarged x3 - Neares neighbour');