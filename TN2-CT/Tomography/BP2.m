% BP2.m
% TOMOGRAPHY SIMULATION BY MATLAB COMMANDS
% Usage : BP2(IMAGE, N)
%
% IMAGE - a picture loaded into some matric in Matlab
% N - the number of projections you want taken between 0 and 180

function BP2 = BP2(image,N)

%  Load the image into Matlab
disp('Loading Image into Matlab...');
% image; %Goi chuong trinh tao anh trong Matlab
%[image,MAP,out]=bmpread('CT4.bmp'); %Doc file BMP 16bit
[image,MAP]=bmpread('CT1.bmp'); %Doc file BMP 8bit

%  Plot the original image on subplot #1
figure('Name','TOMOGRAPHY SIMULATION BY MATLAB COMMANDS','Menubar','none');
% figure(1);

%colormap(flipud(gray(256)));
colormap(gray(256));
subplot(221);
imagesc(image);
title('Original Picture');
disp('Plotting original image...');

%  Take the Projections of the image where 'count' is the number
%  of intervals for theta between 1 and 180
nn = 180/N;
theta1 = 0:nn:nn*N; [proj,xp] = radon(image,theta1);
disp('Calculating projections of the image...');
subplot(222);
imagesc(theta1,xp,proj);
title('Sinogram - Plot of unchanged projections');

%   Using the projections from above we can back-project
%   the image using our backprojection algorithm
disp('Reconstructing the image from back-projection...');
BP = iradon(proj,theta1); 
subplot(223);
imagesc(BP);
title('BP Image: Ram-Lak filter, linear interp.');

 
%  Add Noise to projections
% disp('Adding noise to each projection...');
% X = randn(145);
% for i = 1:N
%     proj(:,i)= proj(:,i) +(2.* X(:,i));
% end
 
%   Using the projections from above we can now filter and back-project
%   the image using our backprojection algorithm
 disp('Reconstructing the image from back-projection...');
 BP = iradon(proj,theta1,'spline','none'); 
 subplot(224);
 imagesc(BP);
 title('BP Image: Hamming filter, spline interp.');

