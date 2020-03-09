
% small piece of code so that we can get the mumax parameter space probed.
% input in this code is Bobj, but can be called anything (just make sure it
% knows).

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


%%

 % looking at the main plots to compare mumax and caciagli paper data. 

figure(4); clf;
subplot(1,3,1)
imagesc(xline, yline, Bcart(:,:,1)); polarmap
xlabel 'X'; ylabel 'Y'; title 'Xcomponent - Caciagli'; colorbar

subplot(1,3,2)
imagesc(xline, yline, Bcart(:,:,2)); polarmap
xlabel 'X'; ylabel 'Y'; title 'Ycomponent'; colorbar

subplot(1,3,3)
imagesc(xline, yline, Bcart(:,:,3)); polarmap
xlabel 'X'; ylabel 'Y'; title 'Zcomponent'; colorbar

figure(5); clf;
subplot(1,3,1)
imagesc(xline, yline, Bobj.BXx(:,:,n)'); polarmap
xlabel 'X'; ylabel 'Y'; title 'Xcomponent - Mumax'; colorbar

subplot(1,3,2)
imagesc(xline, yline, Bobj.BXy(:,:,n)'); polarmap
xlabel 'X'; ylabel 'Y'; title 'Ycomponent'; colorbar

subplot(1,3,3)

imagesc(xline, yline, Bobj.BXz(:,:,n)'); polarmap
xlabel 'X'; ylabel 'Y'; title 'Zcomponent'; colorbar

figure(6); clf;
subplot(1,2,1)
quiver(X,Y, Bcart(:,:,1),Bcart(:,:,2))
xlabel 'X'; ylabel 'Y'; title 'Caciagli'; colorbar
subplot(1,2,2)
quiver(X,Y, Bobj.BXx(:,:,n)', Bobj.BXy(:,:,n)')
xlabel 'X'; ylabel 'Y'; title 'Mumax'; colorbar

Btot = sqrt(Bcart(:,:,1).^2 + Bcart(:,:,2).^2 + Bcart(:,:,3).^2);

%%

% looking at the four mumax data sets to try and ascertain which direction
% it rotates in. 

figure(142)
subplot(4,3,1)
imagesc(xline, yline, Xunit.BXx(:,:,n)'); polarmap
xlabel 'X'; ylabel 'Y'; title 'Xcomponent - Xunit'; colorbar

subplot(4,3,2)
imagesc(xline, yline, Xunit.BXy(:,:,n)'); polarmap
xlabel 'X'; ylabel 'Y'; title 'Ycomponent'; colorbar

subplot(4,3,3)
imagesc(xline, yline, Xunit.BXz(:,:,n)'); polarmap
xlabel 'X'; ylabel 'Y'; title 'Zcomponent'; colorbar

subplot(4,3,4)
imagesc(xline, yline, X23.BXx(:,:,n)'); polarmap
xlabel 'X'; ylabel 'Y'; title 'Xcomponent - X23'; colorbar

subplot(4,3,5)
imagesc(xline, yline, X23.BXy(:,:,n)'); polarmap
xlabel 'X'; ylabel 'Y'; title 'Ycomponent'; colorbar

subplot(4,3,6)
imagesc(xline, yline, X23.BXz(:,:,n)'); polarmap
xlabel 'X'; ylabel 'Y'; title 'Zcomponent'; colorbar

subplot(4,3,7)
imagesc(xline, yline, Yunit.BXx(:,:,n)'); polarmap
xlabel 'X'; ylabel 'Y'; title 'Xcomponent - Yunit'; colorbar

subplot(4,3,8)
imagesc(xline, yline, Yunit.BXy(:,:,n)'); polarmap
xlabel 'X'; ylabel 'Y'; title 'Ycomponent'; colorbar

subplot(4,3,9)
imagesc(xline, yline, Yunit.BXz(:,:,n)'); polarmap
xlabel 'X'; ylabel 'Y'; title 'Zcomponent'; colorbar

subplot(4,3,10)
imagesc(xline, yline, X137.BXx(:,:,n)'); polarmap
xlabel 'X'; ylabel 'Y'; title 'Xcomponent - X137'; colorbar

subplot(4,3,11)
imagesc(xline, yline, X137.BXy(:,:,n)'); polarmap
xlabel 'X'; ylabel 'Y'; title 'Ycomponent'; colorbar

subplot(4,3,12)
imagesc(xline, yline, X137.BXz(:,:,n)'); polarmap
xlabel 'X'; ylabel 'Y'; title 'Zcomponent'; colorbar
figure(124)
imagesc(xline, yline, Btot); polarmap;
xlabel 'X'; ylabel 'Y'; title 'Btotal'

%%

