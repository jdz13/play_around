
clear
common.M = 1e6; common.L = 2e-2; common.R = 2e-2; common.Xin = 1e-2;
common.swinit = 0.2; common.theta =  linspace(0,0.5*pi,37); 


zero.Yin = linspace(-1e-3, 1e-3,51); % Probe plane points in Y 
zero.Zin = linspace(-1e-3, 1e-3,51);
[zero.Xunitx,zero.Yunitx] = Bandit_Cac_UVs_V2(common.Xin,zero.Yin,zero.Zin,common.L,common.R,common.M);


new.Yin= linspace(-1e-3, 1e-3,51); % Probe plane points in Y
new.Zin = linspace(-1e-3, 0,26);
[new.Xunitx,new.Yunitx] = Bandit_Cac_UVs_V2(common.Xin,new.Yin,new.Zin,common.L,common.R,common.M);

%%

% figure(111); clf
% subplot(2,2,1); imagesc(zero.Yin, zero.Zin, zero.Xunitx); xlabel 'Y distance'; ylabel 'Z distance'; title 'Y unit vector original'
% subplot(2,2,2); imagesc(zero.Yin, zero.Zin, zero.Yunitx); xlabel 'Y distance'; ylabel 'Z distance'; title 'Z unit vector original'
% subplot(2,2,3); imagesc(new.Yin, new.Zin, new.Xunitx); xlabel 'Y distance'; ylabel 'Z distance'; title 'Y unit vector half'
% subplot(2,2,4); imagesc(new.Yin, new.Zin, new.Yunitx); xlabel 'Y distance'; ylabel 'Z distance'; title 'Z unit vector half'

%%

    for pull = 1:length(common.theta) 
    
           % Use rotation matricies to find the Z component 
           new.Bxnew = new.Xunitx.*cos(common.theta(pull)) + new.Yunitx.*sin(common.theta(pull)); 
           %Find out how much of this areas is above or below the threshold


           % Use rotation matricies to find the Z component 
           zero.Bxnew = zero.Xunitx.*cos(common.theta(pull)) + zero.Yunitx.*sin(common.theta(pull)); 
           %Find out how much of this areas is above or below the threshold


           new.newBxnew = zeros(size(new.Bxnew,1), (2*size(new.Bxnew,2))-1);
           new.newBxnew(1:size(new.Bxnew,1), 1:size(new.Bxnew,2)) = new.Bxnew;
           new.temp = fliplr(new.Bxnew); new.temp(:,1) = [];
           new.newBxnew(:, size(new.Bxnew,2)+1: (2*size(new.Bxnew,2))-1) = new.temp;


           new.BZM = (new.newBxnew >= common.swinit) - (new.newBxnew <= -common.swinit);
           % Correlate with where the particles actually are in the world
           zero.BZM = (zero.Bxnew >= common.swinit) - (zero.Bxnew <= -common.swinit);
           % Correlate with where the particles actually are in the world

           figure(112); clf
           subplot(2,2,1); imagesc(new.Yin, new.Zin, new.newBxnew); xlabel 'Y distance'; ylabel 'Z distance'; colorbar; title 'X comp with rotation - new'; %caxis([0,1.25*common.swinit]);
           subplot(2,2,2); imagesc(new.Yin, new.Zin, new.BZM); xlabel 'Y distance'; ylabel 'Z distance'; colorbar; title 'Over threshold - new'; caxis([-1,1]); 
           subplot(2,2,3); imagesc(zero.Yin, zero.Zin, zero.Bxnew); xlabel 'Y distance'; ylabel 'Z distance'; colorbar; title 'X comp with rotation - old'; %caxis([0,1.25*common.swinit]); 
           subplot(2,2,4); imagesc(zero.Yin, zero.Zin, zero.BZM); xlabel 'Y distance'; ylabel 'Z distance'; colorbar; title 'Over threshold - old'; caxis([-1,1]); 


           test.test1 = new.newBxnew - zero.Bxnew;
           test.test2 = new.BZM - zero.BZM;

           figure(113); clf; 
           subplot(1,2,1); imagesc(new.Yin, new.Zin, test.test1); colorbar
           title 'Absolute difference (new vs old)'
           subplot(1,2,2); imagesc(new.Yin, new.Zin, test.test2); colorbar
           title 'Difference in on/off' 

           pause(0.1)

    end
    
        