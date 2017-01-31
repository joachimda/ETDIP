%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%ETDIP1 - Digital Image Processing                                     %%  
%%LAB 2                                                                 %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Close all open windows
clear, close all;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

fileName = 'pcameraman.tiff';
img = imread(fileName);

dI=double(img);
dI=dI/max(dI(:));

%%Blurring the image
M=9;
h=ones(1,M);
h=h./sum(h(:));

for r=1:size(dI,1)
    dJ(r,:)=filter(h,1,dI(r,:));
end;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

dJ=dJ+.0*randn(size(dJ));

figure
subplot(2,2,1);imshow(dI),title('Original image');
subplot(2,2,2);imshow(dJ),title('Blurred image');
