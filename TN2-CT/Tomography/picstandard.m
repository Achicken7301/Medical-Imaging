% picstandard.m
%
% Usage : picstandard;
%
% Here we make a picture (100X100) with various shapes

function picstandard = picture2()

picstandard = zeros(100,100);

x1 = 1:100;
y1 = 1:100;
[x,y] = meshgrid(x1,y1);

%  Rectangle on left
 picstandard(70:90, 10:20) = ones(21,11);
 picstandard(70:90, 80:90) = ones(21,11);

%  Rectangle on Right
 picstandard(30:85, 75:95) = ones(56,21);

%  Thin Horiz. Line
 picstandard(70,10:30) = ones(1,21);
 picstandard(75,10:30) = ones(1,21);
 picstandard(80,10:30) = ones(1,21);
 picstandard(85,10:30) = ones(1,21);
 picstandard(85,10:30) = ones(1,21);
 picstandard(90,10:30) = ones(1,21);

%  Circle
 p = (x-50).^2 + (y-57).^2;
 size = 250;
 picstandard(find(p<=size)) = ones(1,length(find(p<=size)));

%  Triangle
 i = 0;
 n = 30;
 picstandard(10,50) = ones(1,1);
 for i = 1:n,
     picstandard(i+10,50-i: 50+i) = ones(1,2*i+1);
 end;

  
