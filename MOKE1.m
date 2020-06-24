
fileID =('C:\Users\JDZ\Documents\MOKE\DEC 2019\Ge Particles\SP8310_4s_repro.txt');
SP8310 = readmatrix(fileID); 

fileID =('C:\Users\JDZ\Documents\MOKE\DEC 2019\Ge Particles\SP8311_5s_repro_minor.txt');
SP8311 = readmatrix(fileID); 

fileID =('C:\Users\JDZ\Documents\MOKE\DEC 2019\Ge Particles\SP8312_6s_repro_minor_care.txt');
SP8312 = readmatrix(fileID); 

fileID =('C:\Users\JDZ\Documents\MOKE\DEC 2019\Ge Particles\SP8313_7s_repro_minor.txt');
SP8313 = readmatrix(fileID); 

fileID =('C:\Users\JDZ\Documents\MOKE\DEC 2019\Ge Particles\SP8314_8s_repro_minor_care.txt');
SP8314 = readmatrix(fileID);

fileID =('C:\Users\JDZ\Documents\MOKE\DEC 2019\Ge Particles\SP8315_9s_repro.txt');
SP8315 = readmatrix(fileID); 

fileID =('C:\Users\JDZ\Documents\MOKE\DEC 2019\Ge Particles\SP8316_10s_repro.txt');
SP8316 = readmatrix(fileID); 

clear fileID

ind = [300, 820];

figure(1); clf;

plot(SP8310(ind(1):ind(2),1), SP8310(ind(1):ind(2),2)); hold on;
plot(SP8311(ind(1):ind(2),1), SP8311(ind(1):ind(2),2));
plot(SP8312(ind(1):ind(2),1), SP8312(ind(1):ind(2),2));
plot(SP8313(ind(1):ind(2),1), SP8313(ind(1):ind(2),2));
plot(SP8314(ind(1):ind(2),1), SP8314(ind(1):ind(2),2));
plot(SP8315(ind(1):ind(2),1), SP8315(ind(1):ind(2),2));
plot(SP8316(ind(1):ind(2),1), SP8316(ind(1):ind(2),2));


plotr(:,1) = rescale(SP8310(ind(1):ind(2),2));
plotr(:,2) = rescale(SP8311(ind(1):ind(2),2));
plotr(:,3) = rescale(SP8312(ind(1):ind(2),2));
plotr(:,4) = rescale(SP8313(ind(1):ind(2),2));
plotr(:,5) = rescale(SP8314(ind(1):ind(2),2));
plotr(:,6) = rescale(SP8315(ind(1):ind(2),2));
plotr(:,7) = rescale(SP8316(ind(1):ind(2),2));

figure(2); clf;
for cnt = 1:size(plotr,2)

    plot(SP8313(ind(1):ind(2),1), plotr(:, cnt)); hold on
    
end 
