%{
    This MATLAB function takes an image matrix and vector of angles and
    then finds the 1D projection (Radon transform) at each of the angles.It
    returns a matrix whose columns are the projections at each angle.

    Ham Matlab nay nhan mot "ma tran cua anh" (an image matrix) va "vector
    cua nhung goc" (vector of angles) va sau do tim projection 1D o moi
    goc. Sau do no tra ve mot ma tran ma cot la projections cua moi goc.

    TOM TAT:
    Dau vao:
    - Ma tran hinh anh IMG
    - So goc quay N
    Dau ra:
    Radon Transform tu moi "goc" cua "hinh anh". Ta duoc ma tran co cot la
    projection cua moi goc.
%}

function Projection = proj(IMG, N)

% Create a vector of values for theta
interval = linspace(1, 180, N);

% Take images and pad with zero to eliminate error
[iLength, iWidth] = size(IMG); %Lay do dai iLength va do rong iWidth cua hinh anh
iDiag = sqrt(iLength^2 + iWidth^2);
LengthPad = ceil(iDiag - iLength) + 2;
WidthPad = ceil(iDiag - iWidth) + 2;
padIMG = zeros(iLength + LengthPad, iWidth + WidthPad);

padIMG(ceil(LengthPad/2):(ceil(LengthPad/2)+iLength-1), ...
        ceil(WidthPad/2):(ceil(WidthPad/2)+iWidth-1)) = IMG;

%  Here we rotate the image N different angles of theta, and then sum the columns
%  of each of these projected images in order to build N different projections
n = length(interval);
Projection = zeros(size(padIMG,2), n);
for i = 1:n
    temp = imrotate(padIMG, 90-interval(i), 'bilinear', 'crop');
    Projection(:,i) = (sum(temp))';
end


