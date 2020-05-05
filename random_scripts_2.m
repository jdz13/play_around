% Looking at monitoring L directly

% first I need to define where I want to look at this
% Dot's four corners approach seems like a good idea

%-------------------------------------------------------------------------
% bits that could be function inputs

pm_cl = [2,4]*1e-2;
L = [2,3,4]*1e-2;

theta = linspace(0,pi/2,9001); % define the angular resolution. Only up to 90 degrees, symmetry conditions help after.
Yin = linspace(-1e-3, 1e-3,51); % Probe plane points in Y 
Zin = Yin(1:26); % Probe plane points in Z 
s_rad = 1e-3; % define the sample radius (where the particles will actually be
con = 0.7;
KRV = 5; % Key ratio values, how strict of a condition do we want 
RES = 0.4; % Start field values. 

%-------------------------------------------------------------------------

[a,b] = meshgrid(pm_cl,L);


                    
%%

inputStr = SaveVar10p2;

M = 1e6;

cnt.pm = 1; cnt.L = 1;
cnt.StartB = 1; cnt.StChan = 1; cnt.KRV = 1;

SH0 = inputStr.SH0(cnt.KRV, cnt.StChan, cnt.pm, cnt.StartB, cnt.L);
swinit = inputStr.SWres(cnt.KRV, cnt.StChan, cnt.pm, cnt.StartB, cnt.L);

    [particle_loc] = plane_mask(inputStr.varst.Yin,inputStr.varst.Zin,inputStr.varst.s_rad);
    control = sum(sum(particle_loc));

    pzcut =  find(inputStr.MxB(cnt.pm,:,cnt.L) >= SH0, 1, 'last');

    [Xunitx,Yunitx] = Bandit_Cac_UVs(inputStr.probe_line(cnt.pm,pzcut),...
                        inputStr.varst.Yin,inputStr.varst.Zin,inputStr.varst.Lengths(cnt.L)./2,inputStr.varst.PM(cnt.pm)./2,M);
                   
                       
    pind = (inputStr.ind1res(cnt.KRV, cnt.StChan, cnt.pm, cnt.StartB, cnt.L):inputStr.ind2res(cnt.KRV, cnt.StChan, cnt.pm, cnt.StartB, cnt.L));
                    
for pull = 1:length(pind)
    
           new.Bxnew = (Xunitx.*cos(inputStr.varst.theta(pind(pull))) + Yunitx.*sin(inputStr.varst.theta(pind(pull))))'; 
                              
           %Find out how much of this areas is above or below the threshold
           new.BZM = (new.Bxnew >= swinit) - (new.Bxnew <= -swinit);
           % Correlate with where the particles actually are in the world

           new.CM = new.BZM .* particle_loc';
           % Find a qualitative number for how much is 'on'
           new.vc = sum(sum(new.CM));
           % Compare this to how many are in the sample space 
           new.NVC(1,pull) = new.vc./control;
           
           keepers.Bx(:,:,pull) = new.Bxnew;
           keepers.BZM(:,:,pull) = new.BZM;
           keepers.CM(:,:,pull) = new.CM;
           
end 
           keepers.NVC = new.NVC;
% [FWHMX(1),MLOC(1),indout] = FWHMNVC(new.NVC(1,:),inputStr.varst.theta,inputStr.varst.CON);



[keepers.gradY, keepers.gradZ,keepers.gradTheta] = gradient(keepers.Bx);

for count = 1:size(keepers.Bx,3)
    keepers.AvY(count) = mean(keepers.gradY(:,:,count),'all');
    keepers.AvZ(count) = mean(keepers.gradZ(:,:,count),'all');
    keepers.AvTheta(count) = mean(keepers.gradTheta(:,:,count),'all');
end

pltx = rad2deg(inputStr.varst.theta(pind));

figure(1); clf;
plot(pltx, keepers.AvY, pltx, keepers.AvZ, pltx, keepers.AvTheta)
xlabel 'angle [deg]'
ylabel 'gradient (\Delta)'
legend ('\DeltaY','\DeltaZ','\Delta\theta','location', 'East')




keepers.MeanAvY = mean(keepers.AvY);
keepers.MeanAvZ = mean(keepers.AvZ);
keepers.MeanAvTheta = mean(keepers.AvTheta);


%%

inputStr = SaveVar10p2;

M = 1e6;
cnt.StartB = 1; cnt.StChan = 1; cnt.KRV = 1;

[particle_loc] = plane_mask(inputStr.varst.Yin,inputStr.varst.Zin,inputStr.varst.s_rad);
            control = sum(sum(particle_loc));

for pm = 1:size(inputStr.varst.PM,2)
    for L = 1:size(inputStr.varst.Lengths,2)

        cnt.L = L;
        cnt.pm = pm;
        
        SH0 = inputStr.SH0(cnt.KRV, cnt.StChan, cnt.pm, cnt.StartB, cnt.L);
        swinit = inputStr.SWres(cnt.KRV, cnt.StChan, cnt.pm, cnt.StartB, cnt.L);

            pzcut =  find(inputStr.MxB(cnt.pm,:,cnt.L) >= SH0, 1, 'last');

            [Xunitx,Yunitx] = Bandit_Cac_UVs(inputStr.probe_line(cnt.pm,pzcut),...
                                inputStr.varst.Yin,inputStr.varst.Zin,inputStr.varst.Lengths(cnt.L)./2,inputStr.varst.PM(cnt.pm)./2,M);


            pind = (inputStr.ind1res(cnt.KRV, cnt.StChan, cnt.pm, cnt.StartB, cnt.L):inputStr.ind2res(cnt.KRV, cnt.StChan, cnt.pm, cnt.StartB, cnt.L));

        for pull = 1:length(pind)

                   new.Bxnew = (Xunitx.*cos(inputStr.varst.theta(pind(pull))) + Yunitx.*sin(inputStr.varst.theta(pind(pull))))'; 

                   %Find out how much of this areas is above or below the threshold
                   new.BZM = (new.Bxnew >= swinit) - (new.Bxnew <= -swinit);
                   % Correlate with where the particles actually are in the world

                   new.CM = new.BZM .* particle_loc';
                   % Find a qualitative number for how much is 'on'
                   new.vc = sum(sum(new.CM));
                   % Compare this to how many are in the sample space 
                   new.NVC(1,pull) = new.vc./control;

                   keepers.Bx(:,:,pull) = new.Bxnew;
                   keepers.BZM(:,:,pull) = new.BZM;
                   keepers.CM(:,:,pull) = new.CM;

        end 
                   keepers.NVC = new.NVC;
        % [FWHMX(1),MLOC(1),indout] = FWHMNVC(new.NVC(1,:),inputStr.varst.theta,inputStr.varst.CON);



        [keepers.gradY, keepers.gradZ,keepers.gradTheta] = gradient(keepers.Bx);

        for count = 1:size(keepers.Bx,3)
            keepers.AvY(count) = mean(keepers.gradY(:,:,count),'all');
            keepers.AvZ(count) = mean(keepers.gradZ(:,:,count),'all');
            keepers.AvTheta(count) = mean(keepers.gradTheta(:,:,count),'all');
        end

        pltx = rad2deg(inputStr.varst.theta(pind));

        propkeepers(crook).pm = inputStr.varst.PM(cnt.pm);
        propkeepers(crook).L = inputStr.varst.Lengths(cnt.L);
        propkeepers(crook).AvY = keepers.AvY;
        propkeepers(crook).AvZ = keepers.AvZ;
        propkeepers(crook).AvTheta = keepers.AvTheta;
        propkeepers(crook).MeanAvY = mean(keepers.AvY);
        propkeepers(crook).MeanAvZ = mean(keepers.AvZ);
        propkeepers(crook).MeanAvTheta = mean(keepers.AvTheta);
        
    end
end 

%%

inputStr = SaveVar10p2;

plt1 = zeros(size(inputStr.varst.Lengths,2), size(inputStr.varst.PM,2));
plt2 = plt1; plt3 = plt1; pltpm = plt1; pltL = plt1;

for cck = 1:size(inputStr.varst.Lengths,2)*size(inputStr.varst.PM,2)
        
    if rem(cck,size(inputStr.varst.PM,2)) == 0 
        
        plt1(ceil(cck/size(inputStr.varst.PM,2)),size(inputStr.varst.PM,2)) = propkeepers(cck).MeanAvY;
        plt2(ceil(cck/size(inputStr.varst.PM,2)),size(inputStr.varst.PM,2)) = propkeepers(cck).MeanAvZ;
        plt3(ceil(cck/size(inputStr.varst.PM,2)),size(inputStr.varst.PM,2)) = propkeepers(cck).MeanAvTheta;
        pltpm(ceil(cck/size(inputStr.varst.PM,2)),size(inputStr.varst.PM,2)) = propkeepers(cck).pm;
        pltL(ceil(cck/size(inputStr.varst.PM,2)),size(inputStr.varst.PM,2)) = propkeepers(cck).L;

        
        
    else
    
        plt1(ceil(cck/size(inputStr.varst.PM,2)),rem(cck,size(inputStr.varst.PM,2))) = propkeepers(cck).MeanAvY;
        plt2(ceil(cck/size(inputStr.varst.PM,2)),rem(cck,size(inputStr.varst.PM,2))) = propkeepers(cck).MeanAvZ;
        plt3(ceil(cck/size(inputStr.varst.PM,2)),rem(cck,size(inputStr.varst.PM,2))) = propkeepers(cck).MeanAvTheta;
        pltpm(ceil(cck/size(inputStr.varst.PM,2)),rem(cck,size(inputStr.varst.PM,2))) = propkeepers(cck).pm;
        pltL(ceil(cck/size(inputStr.varst.PM,2)),rem(cck,size(inputStr.varst.PM,2))) = propkeepers(cck).L;
    end
end

pltsq = (pltpm.^2 + pltL.^2).^0.5;

figure(6); clf; 
subplot(2,2,1)
imagesc (inputStr.varst.PM,inputStr.varst.Lengths, flipud(plt1'));
xlabel 'PM'; ylabel 'Lengths'; title 'Mean Av Y'; colorbar

ax = gca; trial = linspace(ax.YLim(1),ax.YLim(2),length(inputStr.varst.Lengths)+1);
trial = trial - (trial(2)-trial(1))/2;    trial(1) = [];
yticks(trial);    yticklabels((fliplr(inputStr.varst.Lengths)));

trial = linspace(ax.XLim(1),ax.XLim(2),length(inputStr.varst.PM)+1);
trial = trial - (trial(2)-trial(1))/2;    trial(1) = [];
xticks(trial);    xticklabels(((inputStr.varst.PM)));
        
subplot(2,2,2)
imagesc (inputStr.varst.PM,inputStr.varst.Lengths, flipud(plt2'));
xlabel 'PM'; ylabel 'Lengths'; title 'Mean Av Z'; colorbar
xticks(trial);    xticklabels(((inputStr.varst.PM)));
yticks(trial);    yticklabels((fliplr(inputStr.varst.Lengths)));

subplot(2,2,3)
imagesc (inputStr.varst.PM,inputStr.varst.Lengths, flipud(plt3'));
xlabel 'PM'; ylabel 'Lengths'; title 'Mean Av Theta'; colorbar
xticks(trial);    xticklabels(((inputStr.varst.PM)));
yticks(trial);    yticklabels((fliplr(inputStr.varst.Lengths)));

subplot(2,2,4)
imagesc (inputStr.varst.PM,inputStr.varst.Lengths, flipud(pltsq'));
xlabel 'PM'; ylabel 'Lengths'; title 'polarity checking (pm^2 + L^2)^0^.^5'; colorbar
xticks(trial);    xticklabels(((inputStr.varst.PM)));
yticks(trial);    yticklabels((fliplr(inputStr.varst.Lengths)));