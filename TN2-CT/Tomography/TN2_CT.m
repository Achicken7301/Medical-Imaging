close all;
clc;
clear all;


%%
[iLength, iWidth] = size('CT1.bmp');
x = imread('CT1.bmp');
Proj = proj(x, 2);
subplot(111);

imagesc(Proj);
% imwrite(imagesc(Proj), 'Proj.jpg');

%%

[file_X, path_X] = uigetfile('.bmp');
path_X = strcat(path_X, file_X);
x = imread(path_X);
BP1(x, 1);