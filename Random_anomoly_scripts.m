%% random scripts used when trying to sort anomolous data point out. 

folpath = 'C:\Users\JDZ\Documents\Thesis\Data\Feb 2021';
filename = 'sp8314 -SiP.txt';
name = [folpath,'\',filename];

formatSpec = '%f %f';
sizeA = [2 Inf];

fileID = fopen(name,'r');letsC = fgets(fileID);
SP8314_new = fscanf(fileID,formatSpec,sizeA)'; fclose('all');

folpath = 'C:\Users\JDZ\Documents\Thesis\Data\MOKE data\July 2020\Si Particles\Major Loops';
filename = 'SP8314 - 8s - Si particles 0.05Hz.txt';
name = [folpath,'\',filename];

formatSpec = '%f %f';
sizeA = [2 Inf];

fileID = fopen(name,'r');letsC = fgets(fileID);
SP8314_old = fscanf(fileID,formatSpec,sizeA)'; fclose('all');


% folpath = 'C:\Users\JDZ\Documents\MOKE\DEC 2019\New folder';
% filename = 'SP8314_8s_repo_min_care.txt';
% name = [folpath,'\',filename];
% 
% formatSpec = '%f %f';
% sizeA = [2 Inf];
% 
% fileID = fopen(name,'r');letsC = fgets(fileID);
% SP8314_old_old = fscanf(fileID,formatSpec,sizeA)'; fclose('all');



y1 = normalize(SP8314_new(:,2), 'range', [0 1]);
y2 = normalize(SP8314_old(:,2), 'range', [0 1]);
y3 = normalize(SP8314_old_old(:,2), 'range', [0 1]);

uu = figure;
plot(SP8314_new(:,1), y1, SP8314_old(:,1), y2, SP8314_old_old(:,1), y3)
xlabel('Field [Oe]')
ylabel 'Normalised Kerr signal'
legend ('new', 'old', 'old old')

figure
plot(SP8314_old_old(300:820,1), y3(300:820))
hold on 
plot(SP8314_new(10:330,1), y1(10:330))
legend ('old', 'new')
xlabel('Field [Oe]')
ylabel 'Normalised Kerr signal'
%%
clear newdat newdatx
newdat = zeros(1,length(SP8314_old_old));
newdat(300:620) = y1(10:330);
newdat(621:end) = newdat(620);
newdatx = zeros(1,length(SP8314_old_old));
newdatx(300:620) = SP8314_new(10:330,1);
newdatx(621:end) = newdatx(620);
newdatx = newdatx+70;

nndat =  normalize(newdat, 'range', [0 1]);
plot(newdatx(300:820), nndat(300:820))

folpath = 'C:\Users\JDZ\Documents\Thesis\Data\Usable J vs t_Pt data\Si Particles';
filename = 'SP8314_8s_repo_min_care.txt';
name = [folpath,'\',filename];
formatSpec = '%f %f \n';
A = [newdatx;newdat;];

fileID = fopen(name,'w');
fprintf(fileID,formatSpec,A);
fclose(fileID);

%%

% C:\Users\JDZ\Documents\MOKE\DEC 2019\New folder
[SiP, SiPfitting] = MOKE_data_in(47, [300,820], [3,5,6,7,8,9]);
thesis_fig_gen(47:49)
figure(47); xlim([-1000, 9000]); ylim([-0.05,1.05])
set(gcf, 'Position',  [100, 100, 540, 450]); title 'P-AP (H_4) transition - Si Particles'
figure(49); xlim([-1000, 6000]); ylim([-0.9,0.05])

%%




folpath = 'C:\Users\JDZ\Documents\Thesis\Data\MOKE data\July 2020\Si Particles\Major Loops';
filename = 'SP8314 - 8s - Si particles 0.05Hz.txt';
name = [folpath,'\',filename];
formatSpec = '%f %f';
sizeA = [2 Inf];

fileID = fopen(name,'r');letsC = fgets(fileID);
SP8314_old = fscanf(fileID,formatSpec,sizeA)'; fclose('all');

filename = 'SP8309 - 3s - Si particles  0.0384Hz pm6500Oe.txt';
name = [folpath,'\',filename];
fileID = fopen(name,'r');letsC = fgets(fileID);
SP8309_old = fscanf(fileID,formatSpec,sizeA)'; fclose('all');

filename = 'SP8311- 5s - Si particles 0.05Hz.txt';
name = [folpath,'\',filename];
fileID = fopen(name,'r');letsC = fgets(fileID);
SP8311_old = fscanf(fileID,formatSpec,sizeA)'; fclose('all');
filename = 'SP8312- 6s - Si particles 0.05Hz.txt';
name = [folpath,'\',filename];
fileID = fopen(name,'r');letsC = fgets(fileID);
SP8312_old = fscanf(fileID,formatSpec,sizeA)'; fclose('all');
filename = 'SP8313- 7s - Si particles 0.05Hz.txt';
name = [folpath,'\',filename];
fileID = fopen(name,'r');letsC = fgets(fileID);
SP8313_old = fscanf(fileID,formatSpec,sizeA)'; fclose('all');
filename = 'SP8316 - 10s - Si particles 0.05Hz.txt';
name = [folpath,'\',filename];
fileID = fopen(name,'r');letsC = fgets(fileID);
SP8316_old = fscanf(fileID,formatSpec,sizeA)'; fclose('all');

ind = [200,490];

y1 = normalize(SP8309_old(ind(1):ind(2),2), 'range', [0 1]);
y2 = normalize(SP8311_old(ind(1):ind(2),2), 'range', [0 1]);
y3 = normalize(SP8312_old(ind(1):ind(2),2), 'range', [0 1]);
y4 = normalize(SP8313_old(ind(1):ind(2),2), 'range', [0 1]);
y5 = normalize(SP8314_old(ind(1):ind(2),2), 'range', [0 1]);
y6 = normalize(SP8316_old(ind(1):ind(2),2), 'range', [0 1]);

x1 = SP8309_old(ind(1):ind(2),1);
x2 = SP8311_old(ind(1):ind(2),1);
x3 = SP8312_old(ind(1):ind(2),1);
x4 = SP8313_old(ind(1):ind(2),1);
x5 = SP8314_old(ind(1):ind(2),1);
x6 = SP8316_old(ind(1):ind(2),1);

jol = figure;
plot(x1, y1, x2, y2, x3, y3, x4, y4, x5, y5, x6, y6)
 xlabel('Field [Oe]')
ylabel 'Normalised Kerr signal'
legend ('t_P_t = 3 [s]', 't_P_t = 5 [s]','t_P_t = 6 [s]','t_P_t = 7 [s]','t_P_t = 8 [s]', 't_P_t =10 [s]')

%%

jol = figure;
plot(SP8309_old(ind,2), y1, SP8311_old, y2, SP8312_old, y3, SP8313_old,y4,...
     SP8314_old, y5, SP8316_old, y6)
 xlabel('Field [Oe]')
ylabel 'Normalised Kerr signal'
legend ('t_P_t = 3 [s]', 't_P_t = 5 [s]','t_P_t = 6 [s]','t_P_t = 7 [s]','t_P_t = 8 [s]', 't_P_t =10 [s]')
