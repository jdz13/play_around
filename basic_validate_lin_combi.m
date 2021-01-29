
% Validating that we can use the code, checking against Mumax (single). 

% Fill in this bit - what angle is needed and corresponding Mumax file.
phiM = 137; Bobj = X137;

n = num; % plane to compare

testmat = (Bcart(:,:,1,1).*cos(phiM) + Bcart(:,:,1,2).*sin(phiM));

PCdif = (testmat - Bobj.Bx(:,:,n)')./testmat.*100;

figure(4); 
subplot(1,3,1); imagesc(xline,yline, testmat);
title 'Linear combination'; xlabel 'X'; ylabel 'Y'; colorbar
subplot(1,3,2); imagesc(xline,yline, Bobj.Bx(:,:,n)');
title 'Mumax'; xlabel 'X'; ylabel 'Y'; colorbar

subplot(1,3,3); imagesc(xline, yline, PCdif)
title 'Plotting % differnce'; xlabel 'X'; ylabel 'Y';
colorbar;  caxis([-5, 5])