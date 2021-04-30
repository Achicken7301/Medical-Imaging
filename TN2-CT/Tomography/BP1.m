% BP1.m
% TOMOGRAPHY SIMULATION BY BP ALGORITHM PROGRAMMING
% Usage : BP1(IMAGE, N)
%
% IMAGE - a picture loaded into some matric in Matlab
% N - the number of projections you want taken between 0 and 180

function BP1 = BP1(image, N)

%  Load the image into Matlab
disp('Loading Image into Matlab...');
%image; %Goi chuong trinh tao anh trong Matlab
%[image, MAP, out] = bmpread('CT1.bmp'); %Doc file BMP 16bit
%[image,MAP]=bmpread('CT1.bmp'); %Doc file BMP 8bit

%  Plot the original image on subplot #1
figure('Name','TOMOGRAPHY SIMULATION BY BP ALGORITHM PROGRAMMING','Menubar','none');
% figure(1);

%colormap(flipud(gray(256)));
colormap(gray(256));
subplot(2, 2, 1);
imagesc(image);
title('Original Picture');
disp('Plotting original image...');

%  Take the Projections of the image where 'count' is the number of
%  intervals for theta between 1 and 180.
%{
GIAI THICH HAM linspace(x1, x2, N);
Nho cong thuc tinh so hang tu x1 toi x2: (x2-x1)/distance + 1 = so hang
distance la khoang cach giua 2 so

Ham nay co nghia la tu x1 toi x2 tao ra N-1 khoang cach
%}

interval = linspace(1, 180, N);
Proj = proj(image, N);
disp('Calculating projections of the image...');
subplot(2, 2, 2);
imagesc(Proj);
title('Sinogram - Plot of unchanged projections');

% Add Noise to projections
% disp('Adding noise to each projection...');
% X = randn(144);
% for i = 1:N
%     Proj(:,i)= Proj(:,i) +(2.* X(:,i));
% end

%   Using the projections from above we can back-project the image using
%   our backprojection algorithm. 
disp('Reconstructing the image from back-projection...');
BP = backuf(Proj, interval);
subplot(223);
BP = BP(22:121,22:121);
imagesc(BP);
title('Unfiltered Back-Projected Image');

%   Using the projections from above we can now filter and back-project
%   the image using our backprojection algorithm
disp('Reconstructing the image from back-projection...');
BP = back(Proj, interval);
subplot(224);
BP = BP(22:121,22:121);
imagesc(BP);
title('Filtered Back-Projected Image');

