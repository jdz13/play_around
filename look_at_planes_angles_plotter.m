ICS.CLIT_TICKLER = find (keepers.NVC >= 0.5, 1, 'last');
ICS.kweef = find(inputStr.MxB(ICS.pm,:,ICS.L) == inputStr.Bset(1,1,ICS.pm,1,ICS.L));

h = figure(105); clf; subplot(2,2,1); set(h,'WindowStyle','docked')
plot(rad2deg(inputStr.varst.theta(ICS.pind)), keepers.NVC)
xlabel 'Angle [degrees]'; ylabel 'NVC'; title 'Normalsed area in ''On''/''Off'' state'
hold on; plot(rad2deg(inputStr.varst.theta(ICS.pind(ICS.CLIT_TICKLER))), keepers.NVC(ICS.CLIT_TICKLER), 'ko','MarkerSize',10) 

subplot(2,2,4)
imagesc(inputStr.varst.Yin*1000, inputStr.varst.Zin*1000, keepers.CM(:,:,ICS.CLIT_TICKLER))
colorbar; caxis([-1,1]);
xlabel 'Y [mm]'; ylabel 'Z [mm]'; title 'Area above/below switching field'

subplot(2,2,2)
semilogy((inputStr.probe_line(ICS.pm,:) - inputStr.varst.PM(ICS.pm)/2)*100, inputStr.MxB(ICS.pm,:,ICS.L)); colorbar
hold on; semilogy((inputStr.probe_line(ICS.pm,ICS.kweef) - inputStr.varst.PM(ICS.pm)/2)*100, inputStr.MxB(ICS.pm,ICS.kweef,ICS.L), 'ko', 'MarkerSize', 10)
xlabel 'Distance from magnet surface [cm]'; ylabel 'Maximum field above sample [T]'; title 'Max field [T]'

subplot(2,2,3)
imagesc(inputStr.varst.Yin*1000, inputStr.varst.Zin*1000, keepers.Bx(:,:,ICS.CLIT_TICKLER))
colorbar
xlabel 'Y [mm]'; ylabel 'Z [mm]'; title 'Field profile at sample [T]'



l = figure(106); clf; set(l,'WindowStyle','docked'); subplot(2,2,1);
imagesc(inputStr.varst.Yin*1000, inputStr.varst.Zin*1000, keepers.Bx(:,:,ICS.CLIT_TICKLER))
xlabel 'Y [mm]'; ylabel 'Z [mm]'; title 'B_x [T]'; colorbar

subplot(2,2,2);
imagesc(inputStr.varst.Yin*1000, inputStr.varst.Zin*1000, keepers.gradY(:,:,ICS.CLIT_TICKLER)./(1e-3/25))
xlabel 'Y [mm]'; ylabel 'Z [mm]'; title '\deltaB_x/\deltaY [T/m]'; colorbar

subplot(2,2,3);
imagesc(inputStr.varst.Yin*1000, inputStr.varst.Zin*1000, keepers.gradZ(:,:,ICS.CLIT_TICKLER)./(1e-3/25))
xlabel 'Y [mm]'; ylabel 'Z [mm]'; title '\deltaB_x/\deltaZ [T/m]'; colorbar

subplot(2,2,4);
imagesc(inputStr.varst.Yin*1000, inputStr.varst.Zin*1000, keepers.gradTheta(:,:,ICS.CLIT_TICKLER))
xlabel 'Y [mm]'; ylabel 'Z [mm]'; title '\deltaB_x/\delta\theta'; colorbar



clear h l 