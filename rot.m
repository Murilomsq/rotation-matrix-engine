function [x,y] = rotate(matrix, ang)
deg = deg2rad(ang);
RotMatrix = [cos(deg) -sin(deg); sin(deg) cos(deg)];
Product = RotMatrix * [matrix(1); matrix(2)]
