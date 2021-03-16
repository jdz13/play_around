load ('C:\Users\JDZ\Documents\Thesis\Code Outputs\Chapter V\cylinder_resolution_tests_Caciagli.mat');
load ('C:\Users\JDZ\Documents\Thesis\Code Outputs\Chapter V\cylinder_resolution_tests_Mumax.mat');

SP1cy = BcartODnew(:,13,4,1,1);
SP1my = Cyl50.Bz(:,13,4);
hh = figure;
subplot(3,1,1)
plot(Md50.purelinez, SP1cy, 'b', Md50.purelinez, SP1my, 'r--')
ylabel('B_z [T]'); yyaxis right
plot(Md50.purelinez, abs(SP1cy - SP1my)./SP1cy.*100)
ylabel (compose('Percentage \n difference [%]'))
title '(50)^3 cell resolution'
legend ('Caciagli','Mumax', 'Percentage difference','Location', 'Northwest')
thesis_fig_gen(hh.Number)


SP1cy = BOD100(:,26,8,1,1);
SP1my = Cyl100.Bz(:,26,8);
subplot(3,1,2)
plot(Md100.purelinez, SP1cy, 'b', Md100.purelinez, SP1my, 'r--')
ylabel('B_z [T]'); yyaxis right
plot(Md100.purelinez, abs(SP1cy - SP1my)./SP1cy.*100)
ylabel (compose('Percentage \n difference [%]'))
title '(100)^3 cell resolution'
legend ('Caciagli','Mumax', 'Percentage difference','Location', 'Northwest')
thesis_fig_gen(hh.Number)


SP1cy = BOD200(:,52,16,1,1);
SP1my = Cyl200.Bz(:,52,16);
subplot(3,1,3)
plot(Md200.purelinez, SP1cy, 'b', Md200.purelinez, SP1my, 'r--')
ylabel('B_z [T]'); yyaxis right
plot(Md200.purelinez, abs(SP1cy - SP1my)./SP1cy.*100)
ylabel (compose('Percentage \n difference [%]'))
title '(200)^3 cell resolution'
legend ('Caciagli','Mumax', 'Percentage difference','Location', 'Northwest')
thesis_fig_gen(hh.Number)
%%
clear mf50c mf50m mf100c mf100m mf200c mf200m
for ll = 1:11
    mf50c(ll) = mean(BcartODnew(ll+39,:,:,1,1),'all');
    mf50m(ll) = mean(Cyl50.Bz(ll+39,:,:),'all');
end 

hh = figure;
subplot(3,1,1);
plot(Md50.purelinex(40:50)-0.01, mf50c, 'b', Md50.purelinex(40:50)-0.01, mf50m, 'r--')
ylabel('$\bar{B_z}$ [T]','interpreter' ,'latex'); yyaxis right
plot(Md50.purelinex(40:50)-0.01, abs(mf50c - mf50m)./mf50c.*100)
ylabel (compose('Percentage \n difference [%]'))
legend ('Caciagli','Mumax', 'Percentage difference','Location', 'Southeast')
thesis_fig_gen(hh.Number)

for ll = 1:24
    mf100c(ll) = mean(BOD100(ll+76,:,:,1,1),'all');
    mf100m(ll) = mean(Cyl100.Bz(ll+76,:,:),'all');
end 

subplot(3,1,2);
plot(Md100.purelinex(77:100)-0.01, mf100c, 'b', Md100.purelinex(77:100)-0.01, mf100m, 'r--')
ylabel('$\bar{B_z}$ [T]','interpreter' ,'latex'); yyaxis right
plot(Md100.purelinex(77:100)-0.01, abs(mf100c - mf100m)./mf100c.*100)
ylabel (compose('Percentage \n difference [%]'))
legend ('Caciagli','Mumax', 'Percentage difference','Location', 'Southeast')
thesis_fig_gen(hh.Number)

for ll = 1:49
    mf200c(ll) = mean(BOD200(ll+151,:,:,1,1),'all');
    mf200m(ll) = mean(Cyl200.Bz(ll+151,:,:),'all');
end 

subplot(3,1,3);
plot(Md200.purelinex(152:200)-0.01, mf200c, 'b', Md200.purelinex(152:200)-0.01, mf200m, 'r--')
ylabel('$\bar{B_z}$ [T]','interpreter' ,'latex'); yyaxis right
plot(Md200.purelinex(152:200)-0.01, abs(mf200c - mf200m)./mf200c.*100)
ylabel (compose('Percentage \n difference [%]'))
legend ('Caciagli','Mumax', 'Percentage difference','Location', 'Southeast')
thesis_fig_gen(hh.Number)

%%
clear ll Md100 Md200 Md50 BOD100 BOD200 BcartODnew Cyl100 Cyl200 Cyl50
clear mf100c mf100m mf200c mf200m mf50c mf50m SP1cy SP1my hh 
load ('C:\Users\JDZ\Documents\Thesis\Code Outputs\Chapter V\cylinder_angular_resolution_test_data.mat');

%%
SP1cy = BOD50(:,13,4,1,1);
SP1my = Cyl50.Bz(:,13,4);
hh = figure;
subplot(3,1,1)
plot(Md50.purelinez, SP1cy, 'b', Md50.purelinez, SP1my, 'r--')
ylabel('B_z [T]'); yyaxis right
plot(Md50.purelinez, abs(SP1cy - SP1my)./SP1cy.*100)
ylabel (compose('Percentage \n difference [%]'))
title '(50)^3 cell resolution'
legend ('Caciagli','Mumax', 'Percentage difference','Location', 'Northwest')
thesis_fig_gen(hh.Number)


SP1cy = BOD100(:,26,8,1,1);
SP1my = Cyl100.Bz(:,26,8);
subplot(3,1,2)
plot(Md100.purelinez, SP1cy, 'b', Md100.purelinez, SP1my, 'r--')
ylabel('B_z [T]'); yyaxis right
plot(Md100.purelinez, abs(SP1cy - SP1my)./SP1cy.*100)
ylabel (compose('Percentage \n difference [%]'))
title '(100)^3 cell resolution'
legend ('Caciagli','Mumax', 'Percentage difference','Location', 'Northwest')
thesis_fig_gen(hh.Number)


SP1cy = BOD200(:,52,16,1,1);
SP1my = Cyl200.Bz(:,52,16);
subplot(3,1,3)
plot(Md200.purelinez, SP1cy, 'b', Md200.purelinez, SP1my, 'r--')
ylabel('B_z [T]'); yyaxis right
plot(Md200.purelinez, abs(SP1cy - SP1my)./SP1cy.*100)
ylabel (compose('Percentage \n difference [%]'))
title '(200)^3 cell resolution'
legend ('Caciagli','Mumax', 'Percentage difference','Location', 'Northwest')
thesis_fig_gen(hh.Number)

clear mf50c mf50m mf100c mf100m mf200c mf200m
for ll = 1:11
    mf50c(ll) = mean(BOD50(ll+39,:,:,1,1),'all');
    mf50m(ll) = mean(Cyl50.Bz(ll+39,:,:),'all');
end 

hh = figure;
subplot(3,1,1);
plot(Md50.purelinex(40:50)-0.01, mf50c, 'b', Md50.purelinex(40:50)-0.01, mf50m, 'r--')
ylabel('$\bar{B_z}$ [T]','interpreter' ,'latex'); yyaxis right
plot(Md50.purelinex(40:50)-0.01, abs(mf50c - mf50m)./mf50c.*100)
ylabel (compose('Percentage \n difference [%]'))
legend ('Caciagli','Mumax', 'Percentage difference','Location', 'Southeast')
thesis_fig_gen(hh.Number)

for ll = 1:24
    mf100c(ll) = mean(BOD100(ll+76,:,:,1,1),'all');
    mf100m(ll) = mean(Cyl100.Bz(ll+76,:,:),'all');
end 

subplot(3,1,2);
plot(Md100.purelinex(77:100)-0.01, mf100c, 'b', Md100.purelinex(77:100)-0.01, mf100m, 'r--')
ylabel('$\bar{B_z}$ [T]','interpreter' ,'latex'); yyaxis right
plot(Md100.purelinex(77:100)-0.01, abs(mf100c - mf100m)./mf100c.*100)
ylabel (compose('Percentage \n difference [%]'))
legend ('Caciagli','Mumax', 'Percentage difference','Location', 'Southeast')
thesis_fig_gen(hh.Number)

for ll = 1:49
    mf200c(ll) = mean(BOD200(ll+151,:,:,1,1),'all');
    mf200m(ll) = mean(Cyl200.Bz(ll+151,:,:),'all');
end 

subplot(3,1,3);
plot(Md200.purelinex(152:200)-0.01, mf200c, 'b', Md200.purelinex(152:200)-0.01, mf200m, 'r--')
ylabel('$\bar{B_z}$ [T]','interpreter' ,'latex'); yyaxis right
plot(Md200.purelinex(152:200)-0.01, abs(mf200c - mf200m)./mf200c.*100)
ylabel (compose('Percentage \n difference [%]'))
legend ('Caciagli','Mumax', 'Percentage difference','Location', 'Southeast')
thesis_fig_gen(hh.Number)

%%
clear ll Md100 Md200 Md50 BOD100 BOD200 BcartODnew Cyl100 Cyl200 Cyl50
clear mf100c mf100m mf200c mf200m mf50c mf50m SP1cy SP1my hh 
load ('C:\Users\JDZ\Documents\Thesis\Code Outputs\Chapter V\cylinder_resolution_tests_Caciagli_toroidal.mat');

%%
SP1cy = BOD50(:,13,4,1,1)-BIB50(:,13,4,1,1);
SP1my = permute(squeeze(Cyly50.Bx(4,13,:)),[2,1])';
hh = figure;
subplot(3,1,1)
plot(Md50.purelinez, SP1cy, 'b', Md50.purelinez, SP1my, 'r--')
ylabel('B_z [T]'); yyaxis right
plot(Md50.purelinez, abs(SP1cy - SP1my)./SP1cy.*100)
ylabel (compose('Percentage \n difference [%]'))
title '(50)^3 cell resolution'
legend ('Caciagli','Mumax', 'Percentage difference','Location', 'Northwest')
thesis_fig_gen(hh.Number)


SP1cy = BOD100(:,26,8,1,1) - BIB100(:,26,8,1,1);
SP1my = permute(squeeze(Cyly100.Bx(8,26,:)),[2,1])';
subplot(3,1,2)
plot(Md100.purelinez, SP1cy, 'b', Md100.purelinez, SP1my, 'r--')
ylabel('B_z [T]'); yyaxis right
plot(Md100.purelinez, abs(SP1cy - SP1my)./SP1cy.*100)
ylabel (compose('Percentage \n difference [%]'))
title '(100)^3 cell resolution'
legend ('Caciagli','Mumax', 'Percentage difference','Location', 'Northwest')
thesis_fig_gen(hh.Number)


SP1cy = BOD200(:,52,16,1,1) - BIB200(:,52,16,1,1);
SP1my = permute(squeeze(Cyly200.Bx(16,52,:)),[2,1])';
subplot(3,1,3)
plot(Md200.purelinez, SP1cy, 'b', Md200.purelinez, SP1my, 'r--')
ylabel('B_z [T]'); yyaxis right
plot(Md200.purelinez, abs(SP1cy - SP1my)./SP1cy.*100)
ylabel (compose('Percentage \n difference [%]'))
title '(200)^3 cell resolution'
legend ('Caciagli','Mumax', 'Percentage difference','Location', 'Northwest')
thesis_fig_gen(hh.Number)
%%
clear mf50c mf50m mf100c mf100m mf200c mf200m
for ll = 1:11
    mf50c(ll) = mean(BOD50(ll+39,:,:,1,1),'all');
    mf50m(ll) = mean(Cyly50.Bz(ll+39,:,:),'all');
end 

hh = figure;
subplot(3,1,1);
plot(Md50.purelinex(40:50)-0.01, mf50c, 'b', Md50.purelinex(40:50)-0.01, mf50m, 'r--')
ylabel('$\bar{B_z}$ [T]','interpreter' ,'latex'); yyaxis right
plot(Md50.purelinex(40:50)-0.01, abs(mf50c - mf50m)./mf50c.*100)
ylabel (compose('Percentage \n difference [%]'))
legend ('Caciagli','Mumax', 'Percentage difference','Location', 'Southeast')
thesis_fig_gen(hh.Number)

for ll = 1:24
    mf100c(ll) = mean(BOD100(ll+76,:,:,1,1),'all');
    mf100m(ll) = mean(Cyly100.Bz(ll+76,:,:),'all');
end 

subplot(3,1,2);
plot(Md100.purelinex(77:100)-0.01, mf100c, 'b', Md100.purelinex(77:100)-0.01, mf100m, 'r--')
ylabel('$\bar{B_z}$ [T]','interpreter' ,'latex'); yyaxis right
plot(Md100.purelinex(77:100)-0.01, abs(mf100c - mf100m)./mf100c.*100)
ylabel (compose('Percentage \n difference [%]'))
legend ('Caciagli','Mumax', 'Percentage difference','Location', 'Southeast')
thesis_fig_gen(hh.Number)

for ll = 1:49
    mf200c(ll) = mean(BOD200(ll+151,:,:,1,1),'all');
    mf200m(ll) = mean(Cyly200.Bz(ll+151,:,:),'all');
end 

subplot(3,1,3);
plot(Md200.purelinex(152:200)-0.01, mf200c, 'b', Md200.purelinex(152:200)-0.01, mf200m, 'r--')
ylabel('$\bar{B_z}$ [T]','interpreter' ,'latex'); yyaxis right
plot(Md200.purelinex(152:200)-0.01, abs(mf200c - mf200m)./mf200c.*100)
ylabel (compose('Percentage \n difference [%]'))
legend ('Caciagli','Mumax', 'Percentage difference','Location', 'Southeast')
thesis_fig_gen(hh.Number)

%%
clear ll Md100 Md200 Md50 BOD100 BOD200 BcartODnew Cyl100 Cyl200 Cyl50
clear mf100c mf100m mf200c mf200m mf50c mf50m SP1cy SP1my hh 
load ('C:\Users\JDZ\Documents\Thesis\Code Outputs\Chapter V\Torus_angular_resolution_test_data.mat');

%%
SP1cy = BOD50(:,13,4,1,1);
SP1my = Cyl50.Bz(:,13,4);
hh = figure;
subplot(3,1,1)
plot(Md50.purelinez, SP1cy, 'b', Md50.purelinez, SP1my, 'r--')
ylabel('B_z [T]'); yyaxis right
plot(Md50.purelinez, abs(SP1cy - SP1my)./SP1cy.*100)
ylabel (compose('Percentage \n difference [%]'))
title '(50)^3 cell resolution'
legend ('Caciagli','Mumax', 'Percentage difference','Location', 'Northwest')
thesis_fig_gen(hh.Number)


SP1cy = BOD100(:,26,8,1,1);
SP1my = Cyl100.Bz(:,26,8);
subplot(3,1,2)
plot(Md100.purelinez, SP1cy, 'b', Md100.purelinez, SP1my, 'r--')
ylabel('B_z [T]'); yyaxis right
plot(Md100.purelinez, abs(SP1cy - SP1my)./SP1cy.*100)
ylabel (compose('Percentage \n difference [%]'))
title '(100)^3 cell resolution'
legend ('Caciagli','Mumax', 'Percentage difference','Location', 'Northwest')
thesis_fig_gen(hh.Number)


SP1cy = BOD200(:,52,16,1,1);
SP1my = Cyl200.Bz(:,52,16);
subplot(3,1,3)
plot(Md200.purelinez, SP1cy, 'b', Md200.purelinez, SP1my, 'r--')
ylabel('B_z [T]'); yyaxis right
plot(Md200.purelinez, abs(SP1cy - SP1my)./SP1cy.*100)
ylabel (compose('Percentage \n difference [%]'))
title '(200)^3 cell resolution'
legend ('Caciagli','Mumax', 'Percentage difference','Location', 'Northwest')
thesis_fig_gen(hh.Number)

clear mf50c mf50m mf100c mf100m mf200c mf200m
for ll = 1:11
    mf50c(ll) = mean(BOD50(ll+39,:,:,1,1),'all');
    mf50m(ll) = mean(Cyl50.Bz(ll+39,:,:),'all');
end 

hh = figure;
subplot(3,1,1);
plot(Md50.purelinex(40:50)-0.01, mf50c, 'b', Md50.purelinex(40:50)-0.01, mf50m, 'r--')
ylabel('$\bar{B_z}$ [T]','interpreter' ,'latex'); yyaxis right
plot(Md50.purelinex(40:50)-0.01, abs(mf50c - mf50m)./mf50c.*100)
ylabel (compose('Percentage \n difference [%]'))
legend ('Caciagli','Mumax', 'Percentage difference','Location', 'Southeast')
thesis_fig_gen(hh.Number)

for ll = 1:24
    mf100c(ll) = mean(BOD100(ll+76,:,:,1,1),'all');
    mf100m(ll) = mean(Cyl100.Bz(ll+76,:,:),'all');
end 

subplot(3,1,2);
plot(Md100.purelinex(77:100)-0.01, mf100c, 'b', Md100.purelinex(77:100)-0.01, mf100m, 'r--')
ylabel('$\bar{B_z}$ [T]','interpreter' ,'latex'); yyaxis right
plot(Md100.purelinex(77:100)-0.01, abs(mf100c - mf100m)./mf100c.*100)
ylabel (compose('Percentage \n difference [%]'))
legend ('Caciagli','Mumax', 'Percentage difference','Location', 'Southeast')
thesis_fig_gen(hh.Number)

for ll = 1:49
    mf200c(ll) = mean(BOD200(ll+151,:,:,1,1),'all');
    mf200m(ll) = mean(Cyl200.Bz(ll+151,:,:),'all');
end 

subplot(3,1,3);
plot(Md200.purelinex(152:200)-0.01, mf200c, 'b', Md200.purelinex(152:200)-0.01, mf200m, 'r--')
ylabel('$\bar{B_z}$ [T]','interpreter' ,'latex'); yyaxis right
plot(Md200.purelinex(152:200)-0.01, abs(mf200c - mf200m)./mf200c.*100)
ylabel (compose('Percentage \n difference [%]'))
legend ('Caciagli','Mumax', 'Percentage difference','Location', 'Southeast')
thesis_fig_gen(hh.Number)

