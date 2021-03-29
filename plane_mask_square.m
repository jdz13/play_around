function [Mask] = plane_mask_square(px,py,dim)
%PLANE_MASK Summary of this function goes here
%   Detailed explanation goes here

    [x,y] = meshgrid(px,py);
    Xin = le(abs(x),dim/2);
    Yin = le(abs(y),dim/2);
    Mask = Xin.*Yin;
    
end