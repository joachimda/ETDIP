%ETDIP1 - Digital Image Processing
%LAB exercise 1
%

%Close all open windows
clear, close all;

fileName = 'pcameraman.tiff';
img = imread(fileName);

fftImg = fft(img);
fft2Img = fft2(img);
ifftImg = ifft(fftImg);

%Plot the samples
figure
subplot(2,2,1);imshow(img);title('Original sample');
subplot(2,2,2);imshow(fftImg);title('FFT sample');
subplot(2,2,3);imshow(fft2Img);title('FFT2 sample');
subplot(2,2,4);imshow(ifftImg);title('Invers FFT from FFT sample');

figure
subplot(2,2
