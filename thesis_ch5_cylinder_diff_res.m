%% Shows differences in shape between Mumax and Caciagli cylinders at various resolutions

load('C:\Users\JDZ\Documents\Thesis\Code Outputs\Chapter V\cylinder_resolution_tests_Caciagli.mat')
load('C:\Users\JDZ\Documents\Thesis\Code Outputs\Chapter V\cylinder_resolution_tests_Mumax.mat')

figure
subplot(3,2,1); imagesc(Md50.purelinex,Md50.purelinez,squeeze(BOD50(:,25,:,1,1))); polarmap; colorbar;
xlabel 'X [m]'; ylabel 'Y [m]'; title 'Caciagli, (50)^3'; axis equal; axis([-0.02,0.02,-0.02,0.02])
subplot(3,2,2); imagesc(Md50.purelinex,Md50.purelinez,squeeze(Cyl50.Bz(:,25,:))); polarmap; colorbar;
xlabel 'X [m]'; ylabel 'Y [m]'; title 'Mumax, (50)^3'; axis equal; axis([-0.02,0.02,-0.02,0.02])

subplot(3,2,3); imagesc(Md100.purelinex,Md100.purelinez,squeeze(BOD100(:,50,:,1,1))); polarmap; colorbar;
xlabel 'X [m]'; ylabel 'Y [m]'; title 'Caciagli, (100)^3'; axis equal; axis([-0.02,0.02,-0.02,0.02])
subplot(3,2,4); imagesc(Md100.purelinex,Md100.purelinez,squeeze(Cyl100.Bz(:,50,:)));polarmap; colorbar;
xlabel 'X [m]'; ylabel 'Y [m]'; title 'Mumax, (100)^3'; axis equal; axis([-0.02,0.02,-0.02,0.02])

subplot(3,2,5); imagesc(Md200.purelinex,Md200.purelinez,squeeze(BOD200(:,100,:,1,1))); polarmap; colorbar;
xlabel 'X [m]'; ylabel 'Y [m]'; title 'Caciagli, (200)^3'; axis equal; axis([-0.02,0.02,-0.02,0.02])
subplot(3,2,6); imagesc(Md200.purelinex,Md200.purelinez,squeeze(Cyl200.Bz(:,100,:))); polarmap; colorbar;
xlabel 'X [m]'; ylabel 'Y [m]'; title 'Mumax, (200)^3'; axis equal; axis([-0.02,0.02,-0.02,0.02])

%%

%% Plotter counters for the above cylinders (Mumax/Cac). 
ind50 = (1:floor((Md50.wrldSz(1) - R)./2./Md50.gridsize(1)));
xlab50 = abs(Md50.purelinez) + (Md50.gridsize(1)./2)-(R/2);
plt50 = zeros(1,size(Cyl50.Bz,2));
plt51 = plt50; plt52 = plt50; plt53 = plt50;
for cnt = 1:length(plt50)
    plt50(cnt) = max(max((Cyl50.Bz(:,:,cnt))));
    plt51(cnt) = mean(mean((Cyl50.Bz(:,:,cnt))));
    plt52(cnt) = max(mean((BOD50(:,:,cnt,1,1))));
    plt53(cnt) = mean(mean((BOD50(:,:,cnt,1,1))));
end 

ind100 = (1:floor((Md100.wrldSz(1) - R)./2./Md100.gridsize(1)));
xlab100 = abs(Md100.purelinez) + (Md100.gridsize(1)./2)-(R/2);
plt100 = zeros(1,size(Cyl100.Bz,2));
plt101 = plt100; plt102 = plt100; plt103 = plt100;
for cnt = 1:length(plt100)
    plt100(cnt) = max(max((Cyl100.Bz(:,:,cnt))));
    plt101(cnt) = mean(mean((Cyl100.Bz(:,:,cnt))));
    plt102(cnt) = max(mean((BOD100(:,:,cnt,1,1))));
    plt103(cnt) = mean(mean((BOD100(:,:,cnt,1,1))));
end 

ind200 = (1:floor((Md200.wrldSz(1) - R)./2./Md200.gridsize(1)));
xlab200 = abs(Md200.purelinez) + (Md200.gridsize(1)./2)-(R/2);
plt200 = zeros(1,size(Cyl200.Bz,2));
plt201 = plt200; plt202 = plt200; plt203 = plt200;
for cnt = 1:length(plt200)
    plt200(cnt) = max(max((Cyl200.Bz(:,:,cnt))));
    plt201(cnt) = mean(mean((Cyl200.Bz(:,:,cnt))));
    plt202(cnt) = max(max((BOD200(:,:,cnt,1,1))));
    plt203(cnt) = mean(mean((BOD200(:,:,cnt,1,1))));
end 
%% Plotting the above counters. 
figure; subplot(1,2,1)
semilogy(xlab50(ind50),plt50(ind50),xlab50(ind50),plt52(ind50),xlab100(ind100),plt100(ind100),xlab100(ind100),plt102(ind100),xlab200(ind200),plt200(ind200),xlab200(ind200),plt202(ind200))
legend ('Mumax 50','Caciagli 50','Mumax 100','Caciagli 100','Mumax 200','Caciagli 200')
xlabel 'Distance from magnet surface [m]'; ylabel 'Max field [T]'; subplot(1,2,2)
semilogy(xlab50(ind50),plt51(ind50),xlab50(ind50),plt53(ind50),xlab100(ind100),plt101(ind100),xlab100(ind100),plt103(ind100),xlab200(ind200),plt201(ind200),xlab200(ind200),plt203(ind200))
legend ('Mumax 50','Caciagli 50','Mumax 100','Caciagli 100','Mumax 200','Caciagli 200')
xlabel 'Distance from magnet surface [m]'; ylabel 'Mean field [T]';


%% Plotting only the 200 data, which is most convincing (obv). 
figure
semilogy(xlab200(ind200),plt201(ind200),'r',xlab200(ind200),plt203(ind200),'b:')
yyaxis left; ylabel 'Mean field [T]';  
xlabel 'Distance from magnet surface [m]'
yyaxis right; ylabel 'percentage difference [%]'; hold on;
df =(plt201(ind200)-plt203(ind200))./plt203(ind200).*100;
semilogy(xlab200(ind200), df(ind200))
legend ('Mumax','Caciagli', 'Percentage difference', 'Location','South')

%% A small calculator, for reassurance. How many points differ by <1%.

dfprop =(BOD200(:,100,:,1,1)-Cyl200.Bz(:,100,:))./Cyl200.Bz(:,100,:).*100;
T1pc = abs(dfprop)>= 1;
Ts1pc = nonzeros(T1pc);


%% Combining the cross sections with the mean field plots 

figure
subplot(3,4,1); imagesc(Md50.purelinex,Md50.purelinez,squeeze(BOD50(:,25,:,1,1))); polarmap; colorbar;
xlabel 'X [m]'; ylabel 'Y [m]'; title 'Caciagli, (50)^3'; axis equal; axis([-0.02,0.02,-0.02,0.02])
subplot(3,4,2); imagesc(Md50.purelinex,Md50.purelinez,squeeze(Cyl50.Bz(:,25,:))); polarmap; colorbar;
xlabel 'X [m]'; ylabel 'Y [m]'; title 'Mumax, (50)^3'; axis equal; axis([-0.02,0.02,-0.02,0.02])
subplot(3,4,[3,4]); semilogy(xlab50(ind50),plt51(ind50),xlab50(ind50),plt53(ind50))
yyaxis left; ylabel 'Mean field [T]';  
xlabel 'Distance from magnet surface [m]'
yyaxis right; ylabel 'percentage difference [%]'; hold on;
df =(plt51(ind50)-plt53(ind50))./plt53(ind50).*100;
semilogy(xlab50(ind50), df(ind50))
legend ('Mumax 50','Caciagli 50', 'Percentage difference', 'Location','South')

subplot(3,4,5); imagesc(Md100.purelinex,Md100.purelinez,squeeze(BOD100(:,50,:,1,1))); polarmap; colorbar;
xlabel 'X [m]'; ylabel 'Y [m]'; title 'Caciagli, (100)^3'; axis equal; axis([-0.02,0.02,-0.02,0.02])
subplot(3,4,6); imagesc(Md100.purelinex,Md100.purelinez,squeeze(Cyl100.Bz(:,50,:)));polarmap; colorbar;
xlabel 'X [m]'; ylabel 'Y [m]'; title 'Mumax, (100)^3'; axis equal; axis([-0.02,0.02,-0.02,0.02])
subplot(3,4,[7,8]); semilogy(xlab100(ind100),plt101(ind100),xlab100(ind100),plt103(ind100))
yyaxis left; ylabel 'Mean field [T]';  
xlabel 'Distance from magnet surface [m]'
yyaxis right; ylabel 'percentage difference [%]'; hold on;
xlabel 'Distance from magnet surface [m]'; ylabel 'Mean field [T]';
df =(plt101(ind100)-plt103(ind100))./plt103(ind100).*100;
semilogy(xlab100(ind100), df(ind100))
legend ('Mumax 100','Caciagli 100', 'Percentage difference', 'Location','South')

subplot(3,4,9); imagesc(Md200.purelinex,Md200.purelinez,squeeze(BOD200(:,100,:,1,1))); polarmap; colorbar;
xlabel 'X [m]'; ylabel 'Y [m]'; title 'Caciagli, (200)^3'; axis equal; axis([-0.02,0.02,-0.02,0.02])
subplot(3,4,10); imagesc(Md200.purelinex,Md200.purelinez,squeeze(Cyl200.Bz(:,100,:))); polarmap; colorbar;
xlabel 'X [m]'; ylabel 'Y [m]'; title 'Mumax, (200)^3'; axis equal; axis([-0.02,0.02,-0.02,0.02])
subplot(3,4,[11,12]); semilogy(xlab200(ind200),plt201(ind200),xlab200(ind200),plt203(ind200))
yyaxis left; ylabel 'Mean field [T]';  
xlabel 'Distance from magnet surface [m]'
yyaxis right; ylabel 'percentage difference [%]'; hold on;
df =(plt201(ind200)-plt203(ind200))./plt203(ind200).*100;
semilogy(xlab200(ind200), df(ind200))
legend ('Mumax','Caciagli', 'Percentage difference', 'Location','South')

%%
ind = [23,67];
ls1 = zeros(1,200); 
ls2 = zeros(1,200);
for cnt = 1:200
    ls1(cnt) = BOD200(ind(1), ind(2),cnt,1,1);
    ls2(cnt) = Cyl200.Bz(ind(1), ind(2),cnt);
end
pdls = (ls1-ls2)./ls2.*100;
ll = figure;
plot(Md200.purelinez, ls1, '-', Md200.purelinez, ls2,'--'); % yyaxis left;
xlabel 'Z position [m]'; ylabel 'B_x [T]' 
% yyaxis right; hold on; plot(Md200.purelinez, pdls); ylabel 'Percentage difference (%)';
legend ('Caciagli','Mumax', 'Location','North'); tt = (['average difference : ', num2str(mean(pdls)), '%']);
text(-0.009,0,tt); thesis_fig_gen(ll.Number)
%%

ind = [6,17]; ls1 = zeros(1,50); ls2 = zeros(1,50);
for cnt = 1:50
    ls1(cnt) = BOD50(ind(1), ind(2),cnt,1,1);
    ls2(cnt) = Cyl50.Bz(ind(1), ind(2),cnt);
end
pdls = (ls1-ls2)./ls2.*100;
ll = figure; subplot(1,3,1)
plot(Md50.purelinez, ls1, '-', Md50.purelinez, ls2,'--'); % yyaxis left;
xlabel 'Z position [m]'; ylabel 'B_x [T]' 
% yyaxis right; hold on; plot(Md200.purelinez, pdls); ylabel 'Percentage difference (%)';
legend ('Caciagli','Mumax', 'Location','North'); tt = compose(['average difference : \n     ', num2str(mean(pdls)), '%']);
text(-0.01,0,tt); title '(50)^3 cell resolution'; thesis_fig_gen(ll.Number)


ind = [12,34]; ls1 = zeros(1,100); ls2 = zeros(1,100); subplot(1,3,2)
for cnt = 1:100
    ls1(cnt) = BOD100(ind(1), ind(2),cnt,1,1);
    ls2(cnt) = Cyl100.Bz(ind(1), ind(2),cnt);
end
pdls = (ls1-ls2)./ls2.*100;
plot(Md100.purelinez, ls1, '-', Md100.purelinez, ls2,'--'); % yyaxis left;
xlabel 'Z position [m]'; ylabel 'B_x [T]' 
% yyaxis right; hold on; plot(Md200.purelinez, pdls); ylabel 'Percentage difference (%)';
legend ('Caciagli','Mumax', 'Location','North'); tt = compose(['average difference : \n     ', num2str(mean(pdls)), '%']);
text(-0.01,0,tt); title '(100)^3 cell resolution'; thesis_fig_gen(ll.Number)


ind = [23,67]; ls1 = zeros(1,200); ls2 = zeros(1,200); subplot(1,3,3)
for cnt = 1:200
    ls1(cnt) = BOD200(ind(1), ind(2),cnt,1,1);
    ls2(cnt) = Cyl200.Bz(ind(1), ind(2),cnt);
end
pdls = (ls1-ls2)./ls2.*100;
plot(Md200.purelinez, ls1, '-', Md200.purelinez, ls2,'--'); % yyaxis left;
xlabel 'Z position [m]'; ylabel 'B_x [T]' 
% yyaxis right; hold on; plot(Md200.purelinez, pdls); ylabel 'Percentage difference (%)';
legend ('Caciagli','Mumax', 'Location','North'); tt = compose(['average difference : \n     ', num2str(mean(pdls)), '%']);
text(-0.01,0,tt); title '(200)^3 cell resolution'; thesis_fig_gen(ll.Number)


set(ll,'Position',[100 250 1100 400])

%%














%%



%% If you ever need to get into the data creation again (takes a long while!)

% %% Check the effect of cell size on Mumax-Caciagli differences. 
% 
% %% input the data from Mumax
% [Cyl50] = Mumax_data_extractor();
% % [Yunit] = Mumax_data_extractor();
% [Cyl100] = Mumax_data_extractor();
% [Cyl200] = Mumax_data_extractor();
% %%
% Md50 = Cyl50.Mdl_dtl;
% Md100 = Cyl100.Mdl_dtl;
% Md200 = Cyl200.Mdl_dtl;
% 
% %% Calculate the field for equivalent systems to the Mumax model
% % user inputs 
% noin = 50;
% L = 2e-2; 
% R = L;
% M = 1.27e6;
% IB = 6e-3;
% 
% %extract data using user inputs
% Yin50 = Md50.pureliney; Zin50 = Md50.purelinez;
% Xin50 = Md50.purelinex; tic
% [BOD50] = new3Dbanditunitvector(Xin50,Yin50,Zin50,L./2,R./2,M);
% [BIB50] = new3Dbanditunitvector(Xin50,Yin50,Zin50,L./2,IB./2,M);
% Xu50 = BOD50(:,:,:,1,1) - BIB50(:,:,:,1,1); 
% Yu50 = BOD50(:,:,:,1,2) - BIB50(:,:,:,1,2);toc; 
% tic
% Yin100 = Md100.pureliney; Zin100 = Md100.purelinez;
% Xin100 = Md100.purelinex;
% [BOD100] = new3Dbanditunitvector(Xin100,Yin100,Zin100,L./2,R./2,M);
% [BIB100] = new3Dbanditunitvector(Xin100,Yin100,Zin100,L./2,IB./2,M);
% Xu100 = BOD100(:,:,:,1,1) - BIB100(:,:,:,1,1); 
% Yu100 = BOD100(:,:,:,1,2) - BIB100(:,:,:,1,2); toc
% %%
% Yin200 = Md200.pureliney; Zin200 = Md200.purelinez;
% Xin200 = Md200.purelinex;
% [BOD200] = new3Dbanditunitvector(Xin200,Yin200,Zin200,L./2,R./2,M);
% [BIB200] = new3Dbanditunitvector(Xin200,Yin200,Zin200,L./2,IB./2,M);
% Xu200 = BOD200(:,:,:,1,1) - BIB200(:,:,:,1,1); 
% Yu200 = BOD200(:,:,:,1,2) - BIB200(:,:,:,1,2);
% 
% %%
% figure
% subplot(2,2,1); imagesc(Md100.purelinex,Md100.purelinez,squeeze(BOD100(:,50,:,1,1))); polarmap; colorbar;
% subplot(2,2,2); imagesc(Md50.purelinex,Md50.purelinez,squeeze(Cyl50.Bz(:,25,:))); polarmap; colorbar;
% subplot(2,2,3); imagesc(Md100.purelinex,Md100.purelinez,squeeze(Cyl100.Bz(:,50,:))); polarmap; colorbar;
% subplot(2,2,4); imagesc(Md200.purelinex,Md200.purelinez,squeeze(Cyl200.Bz(:,100,:))); polarmap; colorbar;

%%

















%% Random bits I actually haven't looked at. Not sure why they're here.

%%
figure; ind = (1:floor((Mdl_dtl.wrldSz(1) - R)./2./Mdl_dtl.gridsize(1)));
xlab = abs(Zin) + (Mdl_dtl.gridsize(1)./2)-(R/2);
semilogy(xlab(ind), plt1(ind), xlab(ind), plt2(ind))
yyaxis left; ylabel 'Max fields [T]';  
xlabel 'Distance from magnet surface [m]'
yyaxis right; ylabel 'relative difference'; hold on;
yy = ((plt1 - plt2)./plt2); semilogy(xlab(ind), yy(ind))
legend('Mumax','Caciagli', 'Relative difference', 'Location', 'East'); 

%%

figure;
ind = (1:floor((Mdl_dtl.wrldSz(1) - R)./2./Mdl_dtl.gridsize(1)));
xlab = abs(Zin) + (Mdl_dtl.gridsize(1)./2)-(R/2);
subplot(1,2,1);semilogy(xlab(ind), plt1(ind), xlab(ind), plt2(ind))
hold on; semilogy(xlab100(ind100), plt100(ind100), xlab200(ind200), plt200(ind200))
xlabel 'Distance from the magnet surface [m]'; ylabel 'Max Field [T]'
legend ('Caciagli', 'Mumax 50', 'Mumax 100', 'Mumax 200')
subplot(1,2,2);semilogy(xlab(ind), plt11(ind), xlab(ind), plt21(ind))
hold on; semilogy(xlab100(ind100), plt101(ind100), xlab200(ind200), plt201(ind200))
xlabel 'Distance from the magnet surface [m]'; ylabel 'Mean Field [T]'
legend ('Caciagli', 'Mumax 50', 'Mumax 100', 'Mumax 200')
