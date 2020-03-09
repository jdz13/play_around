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
imagesc(xline, yline, BAkoun(:,:,1)); polarmap
xlabel 'X'; ylabel 'Y'; title 'Xcomponent - Akoun'; colorbar

subplot(1,3,2)
imagesc(xline, yline, BAkoun(:,:,2)); polarmap
xlabel 'X'; ylabel 'Y'; title 'Ycomponent'; colorbar

subplot(1,3,3)
imagesc(xline, yline, BAkoun(:,:,3)); polarmap
xlabel 'X'; ylabel 'Y'; title 'Zcomponent'; colorbar


figure(6); clf;
subplot(1,2,1)
quiver(X,Y, Bcart(:,:,1),Bcart(:,:,2))
xlabel 'X'; ylabel 'Y'; title 'Caciagli'; colorbar
subplot(1,2,2)
quiver(X,Y, BAkoun(:,:,1),BAkoun(:,:,2))
xlabel 'X'; ylabel 'Y'; title 'Akoun'; colorbar



figure(15); clf;
subplot(1,3,1)
imagesc(xline, yline, Coord_polar(:,:,1)); polarmap
xlabel 'X'; ylabel 'Y'; title 'rho - Caciagli'; colorbar

subplot(1,3,2)
imagesc(xline, yline, Coord_polar(:,:,2)) ; polarmap
xlabel 'X'; ylabel 'Y'; title 'phi'; colorbar

subplot(1,3,3)
imagesc(xline, yline, Coord_polar(:,:,3)); polarmap
xlabel 'X'; ylabel 'Y'; title 'z'; colorbar


%%



figure(7); clf;
subplot(1,3,1)
imagesc(xline, yline, Bcart(:,:,1)); polarmap
xlabel 'X'; ylabel 'Z'; title 'Xcomponent - Caciagli'; colorbar

subplot(1,3,2)
imagesc(xline, yline, Bcart(:,:,2)); polarmap
xlabel 'X'; ylabel 'Z'; title 'Ycomponent'; colorbar

subplot(1,3,3)
imagesc(xline, yline, Bcart(:,:,3)); polarmap
xlabel 'X'; ylabel 'Z'; title 'Zcomponent'; colorbar


figure(8); clf;
subplot(1,3,1)
imagesc(xline, yline, BAkoun(:,:,1)); polarmap
xlabel 'X'; ylabel 'Z'; title 'Xcomponent - Akoun'; colorbar

subplot(1,3,2)
imagesc(xline, yline, BAkoun(:,:,2)); polarmap
xlabel 'X'; ylabel 'Z'; title 'Ycomponent'; colorbar

subplot(1,3,3)
imagesc(xline, yline, BAkoun(:,:,3)); polarmap
xlabel 'X'; ylabel 'Z'; title 'Zcomponent'; colorbar


figure(9); clf;
subplot(1,2,1)
quiver(X,Y, Bcart(:,:,1),Bcart(:,:,3))
xlabel 'X'; ylabel 'Z'; title 'Caciagli'; colorbar
subplot(1,2,2)
quiver(X,Y, BAkoun(:,:,1),BAkoun(:,:,3))
xlabel 'X'; ylabel 'Z'; title 'Akoun'; colorbar



figure(16); clf;
subplot(1,3,1)
imagesc(xline, yline, Coord_polar(:,:,1)); polarmap
xlabel 'X'; ylabel 'Z'; title 'rho - Caciagli'; colorbar

subplot(1,3,2)
imagesc(xline, yline, Coord_polar(:,:,2)) ; polarmap
xlabel 'X'; ylabel 'Z'; title 'phi'; colorbar

subplot(1,3,3)
imagesc(xline, yline, Coord_polar(:,:,3)); polarmap
xlabel 'X'; ylabel 'Z'; title 'z'; colorbar


%%



figure(10); clf;
subplot(1,3,1)
imagesc(xline, yline, Bcart(:,:,1)); polarmap
xlabel 'Y'; ylabel 'Z'; title 'Xcomponent - Caciagli'; colorbar

subplot(1,3,2)
imagesc(xline, yline, Bcart(:,:,2)); polarmap
xlabel 'Y'; ylabel 'Z'; title 'Ycomponent'; colorbar

subplot(1,3,3)
imagesc(xline, yline, Bcart(:,:,3)); polarmap
xlabel 'Y'; ylabel 'Z'; title 'Zcomponent'; colorbar


figure(11); clf;
subplot(1,3,1)
imagesc(xline, yline, BAkoun(:,:,1)); polarmap
xlabel 'Y'; ylabel 'Z'; title 'Xcomponent - Akoun'; colorbar

subplot(1,3,2)
imagesc(xline, yline, BAkoun(:,:,2)); polarmap
xlabel 'Y'; ylabel 'Z'; title 'Ycomponent'; colorbar

subplot(1,3,3)
imagesc(xline, yline, BAkoun(:,:,3)); polarmap
xlabel 'Y'; ylabel 'Z'; title 'Zcomponent'; colorbar


figure(12); clf;
subplot(1,2,1)
quiver(X,Y, Bcart(:,:,2),Bcart(:,:,3))
xlabel 'Y'; ylabel 'Z'; title 'Caciagli'; colorbar
subplot(1,2,2)
quiver(X,Y, BAkoun(:,:,2),BAkoun(:,:,3))
xlabel 'Y'; ylabel 'Z'; title 'Akoun'; colorbar


figure(17); clf;
subplot(1,3,1)
imagesc(xline, yline, Coord_polar(:,:,1)); polarmap
xlabel 'Y'; ylabel 'Z'; title 'rho - Caciagli'; colorbar

subplot(1,3,2)
imagesc(xline, yline, Coord_polar(:,:,2)) ; polarmap
xlabel 'Y'; ylabel 'Z'; title 'phi'; colorbar

subplot(1,3,3)
imagesc(xline, yline, Coord_polar(:,:,3)); polarmap
xlabel 'Y'; ylabel 'Z'; title 'z'; colorbar