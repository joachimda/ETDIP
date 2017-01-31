%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%ETDIP1 - Digital Image Processing                                     %%  
%%LAB 3                                                                 %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Close all open windows
clear, close all;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%Exercise 1
%%In the following exercise we’ll study sin-images and try to calculate 
%%the Fourier transform of these.We’ll study how the spectrum of an 
%%image is changed, when an image is enlarged.

%%1.1
%%Generate an 128*128-sin-image using the formula:
%%% x[m,n]=0.5*sin(2*pi*((m/M)*k)+((n/N)*l))+0.5
%%Show the image for different values of k and l. What is the meaning of
%%the values k and l?

M=128; N=128;

%%Generate the images pixel by pixel
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
k=5;l=5;
for r=0:M-1 %run M times -1
    for s=0:N-1 %run N times -1
        I1(r+1,s+1)=0.5*sin(2*pi*(((k*r)/M)+((l*s)/N)))+0.5;
    end
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
k=2;l=5;
for r=0:M-1 %run M times -1
    for s=0:N-1 %run N times -1
        I2(r+1,s+1)=0.5*sin(2*pi*(((k*r)/M)+((l*s)/N)))+0.5;
    end
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
k=5;l=2;
for r=0:M-1 %run M times -1
    for s=0:N-1 %run N times -1
        I3(r+1,s+1)=0.5*sin(2*pi*(((k*r)/M)+((l*s)/N)))+0.5;
    end
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
k=5;l=5;
x=3;y=8;
for r=0:M-1 %run M times -1
    for s=0:N-1 %run N times -1
        I4(r+1,s+1)=(0.5*sin(2*pi*(((k*r)/M)+((l*s)/N)))+0.5) + (0.5*sin(2*pi*(((x*r)/M)+((y*s)/N)))+0.5);
    end
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%1.2
%%Calculate the amplitude spectrum of an image from question 1.
%%Show the spectrum as an image
fI1 = fft2(I1);
fI1 = fftshift(fI1);
logabsfI1=log10(abs(fI1));

fI4 = fft2(I4);
fI4 = fftshift(fI4);
logabsfI4=log10(abs(fI4));

%%Plots for simple sine value
figure;
subplot(3,3,1);imshow(I1);title('Sine wave:  k=5, l=5');
subplot(3,3,2);imshow(I2);title('Sine wave:  k=2, l=5');
subplot(3,3,3);imshow(I3);title('Sine wave:  k=5, l=2');
subplot(3,3,4);imshow(I4);title('Sine waves: k=5, l=5, x=5, y=5');
subplot(3,3,5);imshow(logabsfI1/max(logabsfI1(:)));title('FFT of original');
subplot(3,3,6);imshow(logabsfI4/max(logabsfI4(:)));title('FFT of both sines');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%Enlarge an image using the methods from lab 1 and repeat 
%%question 2 for the enlarged images.

fileName = 'cameraman.jpg';
image = imread(fileName);

%%Calculate the amplitude spectrum for image
fftImage = fft2(image);
fftImage = fftshift(fftImage);
logabsImage = log10(abs(fftImage));

%%Resize the image

%%MATLAB bilinear
dI2=imresize(I1,3,'bilinear');

%%Plots for images
figure;
subplot(2,2,1);imshow(I1);title('Original image');
subplot(2,2,2);imshow(dI2);title('Resized image');


