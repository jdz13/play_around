[Xunit.object,Xunit.BXx,Xunit.BXy,Xunit.BXz] = Mumax_data_extractor();
[Yunit.object,Yunit.BXx,Yunit.BXy,Yunit.BXz] = Mumax_data_extractor();
[X23.object,X23.BXx,X23.BXy,X23.BXz] = Mumax_data_extractor();
[X137.object,X137.BXx,X137.BXy,X137.BXz] = Mumax_data_extractor();

Bobj = Xunit;

Mdl_dtl.CellNo = size(Bobj(1).BXx); % Finding out how many cells there are in the world in each dimension
Mdl_dtl.gridsize = Bobj(1).object.GridSize'; % Finding out how big each cell is in each dimension;
Mdl_dtl.wrldSz = Mdl_dtl.gridsize.* Mdl_dtl.CellNo; % Total worldsize
% This should be consistent for all data, so the first structure variable
% is used (there should always be a first one!). This also holds for all of
% the purelines below as well as the extents.
Mdl_dtl.extents = Mdl_dtl.wrldSz./2;
Mdl_dtl.purelinex = linspace(-Mdl_dtl.extents(1)+Mdl_dtl.gridsize(1)/2,Mdl_dtl.extents(1)-Mdl_dtl.gridsize(1)/2,Mdl_dtl.CellNo(1));
Mdl_dtl.pureliney = linspace(-Mdl_dtl.extents(2)+Mdl_dtl.gridsize(2)/2,Mdl_dtl.extents(2)-Mdl_dtl.gridsize(2)/2,Mdl_dtl.CellNo(2));
Mdl_dtl.purelinez = linspace(-Mdl_dtl.extents(3)+Mdl_dtl.gridsize(3)/2,Mdl_dtl.extents(3)-Mdl_dtl.gridsize(3)/2,Mdl_dtl.CellNo(3));

