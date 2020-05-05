CLIT_TICKLER = find (keepers.NVC >= 0.5, 1, 'last');
kweef = find(inputStr.MxB(pm,:,L) == inputStr.Bset(1,1,pm,1,L));

h = figure(101); clf; subplot(2,2,1); set(h,'WindowStyle','docked')
plot(rad2deg(inputStr.varst.theta(pind)), keepers.NVC)
xlabel 'Angle [degrees]'; ylabel 'NVC'; title 'Normalsed area in ''On''/''Off'' state'
hold on; plot(rad2deg(inputStr.varst.theta(pind(CLIT_TICKLER))), keepers.NVC(CLIT_TICKLER), 'ko','MarkerSize',10) 

subplot(2,2,4)
imagesc(inputStr.varst.Yin*1000, inputStr.varst.Zin*1000, keepers.CM(:,:,CLIT_TICKLER))
colorbar; caxis([-1,1]);
xlabel 'Y [mm]'; ylabel 'Z [mm]'; title 'Area above/below switching field'

subplot(2,2,2)
semilogy((inputStr.probe_line(pm,:) - inputStr.varst.PM(pm)/2)*100, inputStr.MxB(pm,:,L)); colorbar
hold on; semilogy((inputStr.probe_line(pm,kweef) - inputStr.varst.PM(pm)/2)*100, inputStr.MxB(pm,kweef,L), 'ko', 'MarkerSize', 10)
xlabel 'Distance from magnet surface [cm]'; ylabel 'Maximum field above sample [T]'; title 'Max field [T]'

subplot(2,2,3)
imagesc(inputStr.varst.Yin*1000, inputStr.varst.Zin*1000, keepers.Bx(:,:,CLIT_TICKLER))
colorbar
xlabel 'Y [mm]'; ylabel 'Z [mm]'; title 'Field profile at sample [T]'



l = figure(102); clf; set(l,'WindowStyle','docked'); subplot(2,2,1);
imagesc(inputStr.varst.Yin*1000, inputStr.varst.Zin*1000, keepers.Bx(:,:,CLIT_TICKLER))
xlabel 'Y [mm]'; ylabel 'Z [mm]'; title 'B_x [T]'; colorbar

subplot(2,2,2);
imagesc(inputStr.varst.Yin*1000, inputStr.varst.Zin*1000, keepers.gradY(:,:,CLIT_TICKLER)./(1e-3/25))
xlabel 'Y [mm]'; ylabel 'Z [mm]'; title '\deltaB_x/\deltaY [T/m]'; colorbar

subplot(2,2,3);
imagesc(inputStr.varst.Yin*1000, inputStr.varst.Zin*1000, keepers.gradZ(:,:,CLIT_TICKLER)./(1e-3/25))
xlabel 'Y [mm]'; ylabel 'Z [mm]'; title '\deltaB_x/\deltaZ [T/m]'; colorbar

subplot(2,2,4);
imagesc(inputStr.varst.Yin*1000, inputStr.varst.Zin*1000, keepers.gradTheta(:,:,CLIT_TICKLER))
xlabel 'Y [mm]'; ylabel 'Z [mm]'; title '\deltaB_x/\delta\theta'; colorbar

