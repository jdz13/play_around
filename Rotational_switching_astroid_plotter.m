%% Rotational switching astroid plotter

%% Rotating switching astroid, CoFeB single layer SP6772

% increasing angle data 
S1=[85,85,85,85,85,90,90,90,90,90,90,95,95,95,95,100,100,105,105,110,115,120,125,130,140,145,135,145,0,0];
E1=[90,90,95,95,95,95,95,95,100,100,100,100,105,105,105,110,110,120,120,130,135,135,140,155,165,200,185,185,0,0];
S2 = [265,265,265,265,270,270,270,270,270,275,275,275,275,275,280,280,280,285,285,290,0,0,0,0,0,0,0,0,0,0];
E2 = [270,275,275,275,275,275,275,275,280,280,280,280,285,285,285,290,290,290,295,300,0,0,0,0,0,0,0,0,0,0];
M1 = (S1+E1)./2;
err1 = abs(S1-E1)./2;
M2 = (S2+E2)./2;
err2 = abs(S2-E2)./2;
% 
% % % decreasing angle data 
% % S1 = [265,265,260,260,260,260,260,260,260,255,255,255,255,255,250,250,250,250,245,245,240,240,240,215,200,0,0,0,0,0];
% % E1 = [255,255,255,255,255,255,255,250,250,250,250,245,245,245,245,240,240,235,235,230,230,225,230,180,160,0,0,0,0,0];
% % S2 = [85,85,80,80,80,80,80,80,80,75,75,75,75,75,70,70,70,65,65,60,55,55,50,45,40,45,0,0,0,0];
% % E2 = [75,75,75,75,75,75,75,70,70,70,70,65,65,65,65,60,55,55,50,45,45,35,30,25,25,20,0,0,0,0];
% % M1 = (S1+E1)./2;
% % err1 = abs(S1-E1)./2;
% % M2 = (S2+E2)./2;
% % err2 = abs(S2-E2)./2;

Bvalall = zeros(1,size(exp1,2));
for kk = 1:size(exp1,2)
Bvalall(kk) = exp1(kk).values(2,6);
end

h1 = figure;
polarplot(deg2rad(M1),Bvalall)

% Outputting the values to files
A = [S1;E1;M1;err1;Bvalall;S2;E2;M2;err2;];
tiled2 = '%f';
fileID = fopen('increasing.txt','w');
fprintf(fileID,'%6.3f %6.3f %6.3f %6.3f %6.3f %6.3f %6.3f %6.3f %6.3f\n',A);
fclose(fileID);



%% Rotating switching astroid, SAF Films and Particles (SP8313 - 7s Rectangles)

theta1 = [15,25,35,40,45,50,60,65,65,70,75];
theta2 = [30,30,45,50,55,55,65,75,75,80,85];
theta3 = [0,0,0,165,150,145,125,120,115,105,100];
theta4 = [0,0,0,180,165,155,135,125,120,115,110];

T1 = (theta1+theta2)./2;
T2 = (theta3+theta4)./2;

E1 = abs(theta1-theta2)./2;
E2 = abs(theta3-theta4)./2;

Bset = [1000,1100,1200,1300,1400,1500,2000,2500,3000,4000,4500];

figure
polarplot(deg2rad(T1),Bset,'+:')
hold on
polarplot(deg2rad(T2(4:end)),Bset(4:end),'+:')
legend ('first transition', 'second transition')
title 'Si Film'

back1 = [175,230,245];
back2 = [205,240,250];
back3 = [325,295,290];
back4 = [315,305,295];

B1 = (back1+back2)./2;
B2 = (back3+back4)./2;
Bs1 = [1300,2000,3000];
EB1 = abs(back1-back2)./2;
EB2 = abs(back3-back4)./2;


theta11 = [5,15,40,60,65,60];
theta21 = [25,25,55,65,70,80];
theta31 = [0,0,140,120,115,110];
theta41 = [0,0,160,125,120,120];

T11 = (theta11+theta21)./2;
T21 = (theta31+theta41)./2;
E11 = abs(theta11-theta21)./2;
E21 = abs(theta31-theta41)./2;

Bset1 = [1400,1500,2000,3000,3500,4000];

figure
polarplot(deg2rad(T11),Bset1,'+:')
hold on
polarplot(deg2rad(T21(3:end)),Bset1(3:end),'+:')
legend ('first transition', 'second transition')
title 'Si Particles'

back11 = [0,205,230];
back21 = [0,220,240];
back31 = [340,320,290];
back41 = [320,305,300];

B11 = (back11+back21)./2;
B21 = (back31+back41)./2;
EB11 = abs(back11-back21)./2;
EB21 = abs(back31-back41)./2;


% Outputting the values to files
A = [Bset;T1;T2;E1;E2;];
fileID = fopen('C:\Users\JDZ\Documents\Thesis\Data\SP8313_film_RSA.txt','w');
fprintf(fileID,'%6.3f %6.3f %6.3f %6.3f %6.3f\n',A);
fclose(fileID);


A = [Bset1;T11;T21;E11;E21;];
fileID = fopen('C:\Users\JDZ\Documents\Thesis\Data\SP8313_particles_RSA.txt','w');
fprintf(fileID,'%6.3f %6.3f %6.3f %6.3f %6.3f\n',A);
fclose(fileID);

A = [Bs1;B1;B2;B11;B21;EB1;EB2;EB11;EB21;];
fileID = fopen('C:\Users\JDZ\Documents\Thesis\Data\SP8313_back_data.txt','w');
fprintf(fileID,'%6.3f %6.3f %6.3f %6.3f %6.3f %6.3f %6.3f %6.3f %6.3f\n',A);
fclose(fileID);

P1t = [T11,T21(3:end),B11(2:3),B21];
P1r = [Bset1,Bset1(3:end),Bs1(2:3),Bs1];

P2t = [T1,T2(4:end),B1,B2];
P2r = [Bset,Bset(4:end),Bs1,Bs1];

figure
subplot(1,3,1)
polarplot(deg2rad(T1),Bset,'+:')
hold on
polarplot(deg2rad(T2(4:end)),Bset(4:end),'+:')
legend ('first transition', 'second transition')
title 'Si Film'
subplot(1,3,2)
polarplot(deg2rad(T11),Bset1,'+:')
hold on
polarplot(deg2rad(T21(3:end)),Bset1(3:end),'+:')
legend ('first transition', 'second transition')
title 'Si Particles'
subplot(1,3,3)
polarplot(deg2rad(T11),Bset1,'+:')
hold on
polarplot(deg2rad(T21(3:end)),Bset1(3:end),'+:')
polarplot(B11(2:3),deg2rad(Bs1(2:3)),'+:')
polarplot(B21(2:3),deg2rad(Bs1(2:3)),'+:');
polarplot(deg2rad(T1),Bset,'+:')
polarplot(deg2rad(T2(4:end)),Bset(4:end),'+:')
polarplot(B1,deg2rad(Bs1),'+:')
polarplot(B2,deg2rad(Bs1),'+:');
legend ('first transition - particles', 'second transition - particles','first transition - films', 'second transition - films')
title 'Both - t_P_t = 0.50 [nm]'


figure
polarplot(deg2rad(P1t),P1r,'+:')
hold on 
polarplot(deg2rad(P2t),P2r,'+:')
title 't_P_t = 0.50 [nm]'
legend ('Si Particles', 'Si Film')
%% SP8314 data (08/03/2021)

theta111 = [10,25,40,45,50,55,60,60,70,75,80,80];
theta211 = [20,40,45,55,60,60,65,70,75,80,85,85];
theta311 = [0,0,0,155,145,140,130,125,115,105,105,100];
theta411 = [0,0,0,175,160,150,140,135,125,115,110,110];

T111 = (theta111+theta211)./2;
T211 = (theta311+theta411)./2;

E111 = abs(theta111-theta211)./2;
E211 = abs(theta311-theta411)./2;

Bset11 = [700,800,900,1000,1100,1200,1400,1500,2000,3000,3500,4000];

A = [Bset11;T111;T211;E111;E211;];
fileID = fopen('C:\Users\JDZ\Documents\Thesis\Data\SP8314_films_RSA.txt','w');
fprintf(fileID,'%6.3f %6.3f %6.3f %6.3f %6.3f\n',A);
fclose(fileID);

theta111b = [305,295,275];
theta211b = [300,290,280];
theta311b = [230,250,260];
theta411b = [220,240,265];

T111b = (theta111b+theta211b)./2;
T211b = (theta311b+theta411b)./2;

E111b = abs(theta111b-theta211b)./2;
E211b = abs(theta311b-theta411b)./2;

Bset11b = [1300,2000,4000];

A = [Bset11b;T111b;T211b;E111b;E211b;];
fileID = fopen('C:\Users\JDZ\Documents\Thesis\Data\SP8314_films_RSA_bw.txt','w');
fprintf(fileID,'%6.3f %6.3f %6.3f %6.3f %6.3f\n',A);
fclose(fileID);

figure
subplot(1,3,1)
polarplot(deg2rad(T1),Bset,'+:')
hold on
polarplot(deg2rad(T2(4:end)),Bset(4:end),'+:')
legend ('first transition', 'second transition')
title 'Si Film t_P_t = 0.50 [nm]'
subplot(1,3,2)
polarplot(deg2rad(T111),Bset11,'+:')
hold on
polarplot(deg2rad(T211(4:end)),Bset11(4:end),'+:')
legend ('first transition', 'second transition')
title 'Si Film t_P_t = 0.58 [nm]'
subplot(1,3,3)
polarplot(deg2rad(T1),Bset,'+:')
hold on
polarplot(deg2rad(T2(4:end)),Bset(4:end),'+:')
polarplot(deg2rad(T111),Bset11,'+:')
polarplot(deg2rad(T211(4:end)),Bset11(4:end),'+:')
legend ('first transition - t_P_t = 0.50 [nm]', 'second transition - t_P_t = 0.50 [nm]','first transition - t_P_t = 0.58 [nm]', 'second transition - t_P_t = 0.58 [nm]')
title 'Both films'

%%

%% SP8310 data (08/03/2021)

theta1111 = [30,40,45,5,20,35];
theta2111 = [35,50,55,20,30,40];
theta3111 = [160,140,130,0,170,150];
theta4111 = [175,150,140,0,175,155];

T1111 = (theta1111+theta2111)./2;
T2111 = (theta3111+theta4111)./2;

E1111 = abs(theta1111-theta2111)./2;
E2111 = abs(theta3111-theta4111)./2;

Bset111 = [3000,3500,4000,2600,2800,3250];

A = [Bset111;T1111;T2111;E1111;E2111;];
fileID = fopen('C:\Users\JDZ\Documents\Thesis\Data\SP8310_films_RSA.txt','w');
fprintf(fileID,'%6.3f %6.3f %6.3f %6.3f %6.3f\n',A);
fclose(fileID);

theta1111b = [310,325];
theta2111b = [315,335];
theta3111b = [225,190];
theta4111b = [230,200];

T1111b = (theta1111b+theta2111b)./2;
T2111b = (theta3111b+theta4111b)./2;

E1111b = abs(theta1111b-theta2111b)./2;
E2111b = abs(theta3111b-theta4111b)./2;

Bset111b = [4000,3000];

A = [Bset111b;T1111b;T2111b;E1111b;E2111b;];
fileID = fopen('C:\Users\JDZ\Documents\Thesis\Data\SP8310_films_RSA_bw.txt','w');
fprintf(fileID,'%6.3f %6.3f %6.3f %6.3f %6.3f\n',A);
fclose(fileID);

figure
polarplot(deg2rad(T1),Bset,'+:')
hold on
polarplot(deg2rad(T2(4:end)),Bset(4:end),'+:')
polarplot(deg2rad(T111),Bset11,'+:')
polarplot(deg2rad(T211(4:end)),Bset11(4:end),'+:')
polarplot(deg2rad(sort(T1111)),sort(Bset111),'+:')
polarplot(deg2rad(nonzeros(sort(T2111))),sort(Bset111([1:3,5:6]),'descend'),'+:')
legend ('first transition - t_P_t = 0.50 [nm]', 'second transition - t_P_t = 0.50 [nm]',...
    'first transition - t_P_t = 0.58 [nm]', 'second transition - t_P_t = 0.58 [nm]', ...
    'first transition - t_P_t = 0.29 [nm]', 'second transition - t_P_t = 0.29 [nm]')


%%


%% SP8312 data (08/03/2021)

theta11111 = [60,65,60,45,15];
theta21111 = [75,70,65,50,30];
theta31111 = [110,115,120,145,0];
theta41111 = [120,120,125,155,0];

T11111 = (theta11111+theta21111)./2;
T21111 = (theta31111+theta41111)./2;

E11111 = abs(theta11111-theta21111)./2;
E21111 = abs(theta31111-theta41111)./2;

Bset1111 = [4000,3500,3000,2000,1500];

A = [Bset1111;T11111;T21111;E11111;E21111;];
fileID = fopen('C:\Users\JDZ\Documents\Thesis\Data\SP8312_films_RSA.txt','w');
fprintf(fileID,'%6.3f %6.3f %6.3f %6.3f %6.3f\n',A);
fclose(fileID);

theta11111b = [310,300,290];
theta21111b = [320,305,295];
theta31111b = [225,240,245];
theta41111b = [230,245,250];

T11111b = (theta11111b+theta21111b)./2;
T21111b = (theta31111b+theta41111b)./2;

E11111b = abs(theta11111b-theta21111b)./2;
E21111b = abs(theta31111b-theta41111b)./2;

Bset1111b = [2000,3000,4000];

A = [Bset1111b;T11111b;T21111b;E11111b;E21111b;];
fileID = fopen('C:\Users\JDZ\Documents\Thesis\Data\SP8312_films_RSA_bw.txt','w');
fprintf(fileID,'%6.3f %6.3f %6.3f %6.3f %6.3f\n',A);
fclose(fileID);

figure
polarplot(deg2rad(T1),Bset,'+:')
hold on
polarplot(deg2rad(T2(4:end)),Bset(4:end),'+:')
polarplot(deg2rad(T111),Bset11,'+:')
polarplot(deg2rad(T211(4:end)),Bset11(4:end),'+:')
polarplot(deg2rad(sort(T1111)),sort(Bset111),'+:')
polarplot(deg2rad(nonzeros(sort(T2111))),sort(Bset111([1:3,5:6]),'descend'),'+:')
polarplot(deg2rad(sort(T11111)),sort(Bset1111),'+:')
polarplot(deg2rad(nonzeros(sort(T21111))),(sort(Bset1111(1:end-1),'descend')),'+:')

legend ('first transition - t_P_t = 0.50 [nm]', 'second transition - t_P_t = 0.50 [nm]',...
    'first transition - t_P_t = 0.58 [nm]', 'second transition - t_P_t = 0.58 [nm]', ...
    'first transition - t_P_t = 0.29 [nm]', 'second transition - t_P_t = 0.29 [nm]',...
        'first transition - t_P_t = 0.43 [nm]', 'second transition - t_P_t = 0.43 [nm]')



%%

%%

[F13] = fol_data_ext_function();

%%

pp = pp+1;
    
    x = F13(2*pp+1).data(1:37,7);
    y = F13(2*pp+1).data(1:37,12);
    plot(x,y.*1e6);
    xlabel 'Angle [deg]'
    ylabel 'Moment [muemu]' 
%%  Results for the S8313 sample - Si Film. (legit this time). 

    S1 = [10,25,35,40,45,45,55,55,65,65,70];
    E1 = [30,40,45,50,55,55,65,70,75,80,80];
    M1 = (S1+E1)./2;
    err1 = abs(S1-E1)./2;
    
    S2 = [0,0,0,0,150,145,125,115,110,105,100];
    E2 = [0,0,0,0,165,155,135,125,120,115,110];
    M2 = (S2+E2)./2;
    err2 = abs(S2-E2)./2;
    
    F1 = [1000,1100,1200,1300,1400,1500,2000,2500,3000,3500,4000];
    F2 = [0,0,0,0,F1(5:end)];    
    
    A = [S1;E1;M1;err1;F1;S2;E2;M2;err2;F2];
    
    BS1 = [0,0,0,0,0,0,0,0,0,225,250];
    BE1 = [0,0,0,0,0,0,0,0,0,235,260];
    BM1 = (BS1+BE1)./2;
    BErr1 = abs(BS1-BE1)./2;
    
    BF1 = [0,0,0,0,0,0,0,0,1300,2000,4000];
    BS2 = [0,0,0,0,0,0,0,0,310,295,280];
    BE2 = [0,0,0,0,0,0,0,0,325,305,290];
    BM2 = (BS2+BE2)./2;
    BErr2 = abs(BS2-BE2)./2;
    
    B = [BS1;BE1;BM1;BErr1;BF1;BS2;BE2;BM2;BErr2;];
    
    C = [A;B];
    
fileID = fopen('S1813_Si_film_real.txt','w');
fprintf(fileID,'%6.3f %6.3f %6.3f %6.3f %6.3f %6.3f %6.3f %6.3f %6.3f %6.3f\n',A);
fclose(fileID);
    
fileID = fopen('S1813_Si_film_real_bw.txt','w');
fprintf(fileID,'%6.3f %6.3f %6.3f %6.3f %6.3f %6.3f %6.3f %6.3f %6.3f\n',B);
fclose(fileID);
%%
h1 = figure;
polarplot(deg2rad(M1),F1); hold on
polarplot(deg2rad(M2),F2);
polarplot(deg2rad(BM1),BF1);
polarplot(deg2rad(BM2),BF1);
legend ('+\theta, H_4','+\theta, H_5','-\theta, H_5', '-\theta, H_4')
