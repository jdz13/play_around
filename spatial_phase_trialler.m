
load('C:\Users\JDZ\Documents\Thesis\Code Outputs\Chapter V\matlab_SV21p2.mat')

usd = squeeze(SaveVar21p2.SWres(4,:,:,1,:));

plotter  = zeros(size(usd,2),size(usd,3));

for kk = 1:size(usd,2)
    for mm = 1:size(usd,3)
        
        plotter(kk,mm) = nnz(usd(:,kk,mm));
        
    end 
end 

h8 = figure;
imagesc(plotter)
colorbar 
clear kk mm plotter
%%
height = 0.05;
[XunitX,YunitX] = Bandit_Cac_UVs(height,...
                        SaveVar21p2.varst.Yin,SaveVar21p2.varst.Zin,0.01,0.01,1e6);

theta = linspace(0,4*pi,3601);                   
fieldout = zeros(length(SaveVar21p2.varst.Yin),length(SaveVar21p2.varst.Zin),length(theta));                    

for pull = 1:length(theta) 
       % Use rotation matricies to find the Z component 
       Bxnew = XunitX.*cos(theta(pull)) + YunitX.*sin(theta(pull)); 
       
       %save out the z component for each theta rotation
       fieldout(:,:,pull) = Bxnew;
end 

figure
subplot(1,2,1); imagesc(XunitX); title 'X unit'; colorbar
subplot(1,2,2); imagesc(YunitX); title 'Y unit'; colorbar


figure
plot(rad2deg(theta), squeeze(fieldout(13,17,:)))
xlabel 'theta'; ylabel 'Field [T]'
hold on;

[xcoord,ycoord]= meshgrid(SaveVar21p2.varst.Yin, SaveVar21p2.varst.Zin);
radialcoord = sqrt(xcoord'.^2+ycoord'.^2);

Bn = fieldout(26,26,113).*(cos(radialcoord./height).^4);

figure; imagesc(fieldout(:,:,113));colorbar;
figure; imagesc(Bn);colorbar;

diff12 = Bn - fieldout(:,:,113); 

figure; imagesc(diff12)

clear height diff12 Bn radialcoord xcoord ycoord Bxnew fieldout theta XunitX YunitX 