%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%ETDIP1 - Digital Image Processing                                     %%  
%%LAB 4                                                                 %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Close all open windows
clear, close all;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

I = imread('rice.tif');
dI = double(I)/255;

Icrop=imcrop(I);
dIcrop = double(Icrop)/255;

[ydIcrop,xdIcrop]=hist(dIcrop(:),100);
[ydI,xdI]=hist(dI(:),100);

T = mean(dIcrop(:)); %%Threshold
K = zeros(size(I));
s = find(dIcrop > T+0.05);
K(s) = 1;
dIcropArea = sum(K(:))

J = zeros(size(I));
r = find(dI > T +0.05);
J(r) = 1;
dJArea = sum(J(:))

figure;
subplot(2,3,1);imshow(I), title('Original image');
subplot(2,3,2);imshow(dI),title('Image casted to doubles');
subplot(2,3,3);plot(xdI,ydI),title('Histogram for original image');
subplot(2,3,4);plot(xdIcrop,ydIcrop),title('Histogram for cropped image');
subplot(2,3,5);imshow(J);title('BW image');

rice = dJArea/dIcropArea;
