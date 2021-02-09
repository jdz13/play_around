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



%% Rotating switching astroid, SAF Films and Particles (SP8314 - 8s Ovals)

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


theta11 = [10,15,25,30,35,45,60,65,60,70];
theta21 = [35,40,40,45,50,55,65,70,75,75];
theta31 = [0,0,0,0,0,140,120,115,110,110];
theta41 = [0,0,0,0,0,160,130,120,120,115];

T11 = (theta11+theta21)./2;
T21 = (theta31+theta41)./2;
E11 = abs(theta11-theta21)./2;
E21 = abs(theta31-theta41)./2;

Bset1 = [1000,1100,1200,1300,1400,1500,2000,3000,4000,4500];

figure
polarplot(deg2rad(T11),Bset1,'+:')
hold on
polarplot(deg2rad(T21(6:end)),Bset1(6:end),'+:')
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
