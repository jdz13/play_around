function [object] = Mumax_data_extractor()
%MUMAX_DATA_EXTRACTOR Summary of this function goes here
%   Detailed explanation goes here


[file,path] = uigetfile('*.*'); % interactively gets the filename
filename = [path,file]; % put it all back together

S = load(filename); % loads data from filename.

real = S.OOMMFData; % extract the actual B data out

rep = size(real); % find out how big it is, to locate the data in struct

usize = rep(2:4); % this is the x,y,z size


% extract the data. You have to resize as it thinks its an n-n-n-1 matrix. 
Bx = real(1,:,:,:,1);
Bx = reshape(Bx, usize); 

By = real(1,:,:,:,2); 
By = reshape(By, usize);

Bz = real(1,:,:,:,3); 
Bz = reshape(Bz, usize);

object = S;
object.Bx = Bx;
object.By = By;
object.Bz = Bz;

    % Bringing in the world definitions 

    Mdl_dtl.CellNo = size(object(1).Bx); % Finding out how many cells there are in the world in each dimension
    Mdl_dtl.gridsize = object.GridSize'; % Finding out how big each cell is in each dimension;
    Mdl_dtl.wrldSz = Mdl_dtl.gridsize.* Mdl_dtl.CellNo; % Total worldsize
    % This should be consistent for all data, so the first structure variable
    % is used (there should always be a first one!). This also holds for all of
    % the purelines below as well as the extents.  

    Mdl_dtl.extents = Mdl_dtl.wrldSz./2;

    Mdl_dtl.purelinex = linspace(-Mdl_dtl.extents(1)+Mdl_dtl.gridsize(1)/2,Mdl_dtl.extents(1)-Mdl_dtl.gridsize(1)/2,Mdl_dtl.CellNo(1));
    Mdl_dtl.pureliney = linspace(-Mdl_dtl.extents(2)+Mdl_dtl.gridsize(2)/2,Mdl_dtl.extents(2)-Mdl_dtl.gridsize(2)/2,Mdl_dtl.CellNo(2));
    Mdl_dtl.purelinez = linspace(-Mdl_dtl.extents(3)+Mdl_dtl.gridsize(3)/2,Mdl_dtl.extents(3)-Mdl_dtl.gridsize(3)/2,Mdl_dtl.CellNo(3));

    object.Mdl_dtl = Mdl_dtl;
   
fclose('all');
end

