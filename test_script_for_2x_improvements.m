%need to bring saved variables into the workspace

clear chk

chk.SV7p1.SWres = SaveVar7p1.SWres;
chk.SV7p2.SWres = SaveVar7p2.SWres;
chk.SV7p3.SWres = SaveVar7p3.SWres;

for kl = 1:size(SaveVar7p1.SWres,1)
    
    chk.SV7p1.nSW(kl) = nnz(SaveVar7p1.SWres(kl,:));
    chk.SV7p2.nSW(kl) = nnz(SaveVar7p2.SWres(kl,:));
    chk.SV7p3.nSW(kl) = nnz(SaveVar7p3.SWres(kl,:));

end

chk.SV7p1.SWres215 = SaveVar7p1.SWres(4,215);
chk.SV7p2.SWres215 = SaveVar7p2.SWres(4,215);
chk.SV7p3.SWres215 = SaveVar7p3.SWres(4,215);


figure(222); clf
for kl = 1:size(chk.SV7p1.SWres,1)
subplot(2,2,kl)
plt1 = chk.SV7p1.SWres(kl,:);
plt2 = chk.SV7p2.SWres(kl,:);
plt3 = chk.SV7p3.SWres(kl,:);
semilogy(plt1(plt1 > 0)); hold on; semilogy(plt2(plt2 > 0)); semilogy(plt3(plt3> 0));
legend ('SV7p1', 'SV7p2', 'SV7p3')
xlabel 'Channel Number'
ylabel 'Optimum channel field [T]'
title (compose("KRV of " + num2str(SaveVar7p1.varst.KRV(kl))))
end 

clear plt1 plt2 plt3 kl

chk.diff.sz1 = [size(chk.SV7p1.SWres,2), size(chk.SV7p2.SWres,2),size(chk.SV7p3.SWres,2)];

chk.diff.msz = min(chk.diff.sz1,[],'all');

chk.diff.dif12 = chk.SV7p1.SWres(:,1:chk.diff.msz) - chk.SV7p2.SWres(:,1:chk.diff.msz);
chk.diff.dif23 = chk.SV7p2.SWres(:,1:chk.diff.msz) - chk.SV7p3.SWres(:,1:chk.diff.msz);
chk.diff.dif13 = chk.SV7p1.SWres(:,1:chk.diff.msz) - chk.SV7p3.SWres(:,1:chk.diff.msz);

figure(223); clf
for kl = 1:size(chk.SV7p1.SWres,1)
subplot(2,2,kl)
semilogy(abs(chk.diff.dif12(kl,:))); hold on ; semilogy(abs(chk.diff.dif23(kl,:))); semilogy(abs(chk.diff.dif13(kl,:)));
legend ('SV1-SV2', 'SV2-SV3', 'SV1-SV3')
xlabel 'Channel Number'
ylabel 'Difference between values [T]'
title (compose("KRV of " + num2str(SaveVar7p1.varst.KRV(kl))))
end 

clear kl 

%%



