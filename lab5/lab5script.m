%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%ETDIP1 - Digital Image Processing                                     %%  
%%LAB 5                                                                 %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Close all open windows
clear, close all;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

I = imread('rice.tif');
dI = double(I)/255;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%Implement a MatLab program that counts the number of grain of rice in
%%the image ‘rice.tif’. You must count the number of grains using the 
%%morphological method described in GW pp. 645-646
%%(use 4-connectivity and 8-connectivity). You can give the different
%%connected components differentcolours, using the command colormap(’lines’)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

ICrop = imcrop(I);
dICrop = double(ICrop)/255;

[yvalsdIcrop,xvalsdIcrop] = hist(dICrop(:),100);
[yvalsdI,xvalsdI] = hist(dI(:),100);

th = mean(dICrop(:));
K = zeros(size(I));
s = find(dICrop > th + 0.05);
K(s) = 1;
dICropArea = sum(K(:));

J = zeros(size(I));
r = find(dI > th + 0.05);
J(r) = 1;
dJArea= sum(J(:));

nrOfRice = dJArea / dICropArea;

A = J;
B = strel('arbitrary',[0 1 0; 1 1 1; 0 1 0]);
label = 2;
p = find(A == 1, 1 );

 while ~isempty(p)
     X0 = zeros(size(A)); 
     X0(p)=1;
     X1 = zeros(size(A));
     a = 1;
     while(a)
         X1 = imdilate(X0, B) &A;
         a = max(max(X0~=X1));
         X0 = X1;
     end
     s = find(X0 == 1);
     A(s) = label;
     label = label + 1;
     p = find(A == 1, 1 );
 end
 
 pseudoColor = rand(256,3);
 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
figure, title('Plots')
subplot(3,3,1);imshow(I),title('Original image');
subplot(3,3,1);plot(xvalsdI,yvalsdI), title('Histogram for original image');
subplot(3,3,2);plot(xvalsdIcrop,yvalsdIcrop), title('Histogram for single grain');
subplot(3,3,3);imshow(J),title('Black/white image');
subplot(3,3,4);imshow(A, pseudoColor), title('Random colored image');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
