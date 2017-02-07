%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%ETDIP1 - Digital Image Processing                                     %%  
%%LAB 5                                                                 %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Close all open windows
clear, close all;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

A = imread('dots.bmp');
A = double(A)/255;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% Exercise 2
%%% Implement a MatLab program that counts the number 
%%% particles in the image ”dots.bmp” thats:
%%%    1. on the boundary of the image
%%%    2. overlapping
%%%    3. not overlapping 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

B = strel('arbitrary',[0 1 0; 1 1 1; 0 1 0] );

label=2;
p=min(find(A==1));
while ~isempty(p)
    X0=zeros(size(A)); X0(p)=1;
    X1=zeros(size(A));
    a=1;
    while (a)
        X1=imdilate(X0,B)&A;
        a=max(max(X0~=X1));
        X0=X1;
	end
	s=find(X0==1);
	A(s)=label;
	label=label+1;
    p=min(find(A==1));
end

pseudoColor = rand(label, 3);

A_Size=A;
b(4)=0;
Areal=zeros(1,label+1);

for k=2:label
   r=find(A==k);
   Areal(k+1)=length(r);
   if Areal(k+1)<1*69-1  
       A_Size(r)=2; b(1)=b(1)+1; 
   end;
   if 1*69-1<=Areal(k+1)&Areal(k+1)<2*69  
       A_Size(r)=3; b(2)=b(2)+1; 
   end;
   if 2*69-1<=Areal(k+1)&Areal(k+1)<3*69  
       A_Size(r)=4; b(3)=b(3)+1; 
   end;
   if 3*69-1<=Areal(k+1)
       A_Size(r)=5; b(4)=b(4)+1; 
   end;
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
figure
subplot(3,3,1);imshow(A),title('Original image');
subplot(3,3,2);imshow(A, pseudoColor);
subplot(3,3,3);hist(Areal(2:end),20); title('Areal distribution');
subplot(3,3,4);imshow(A_Size,pseudoColor);%,colormap(jet(100));
subplot(3,3,4);stem(b);title('Distribution of component size');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
