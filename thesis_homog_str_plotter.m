function [ ] = thesis_homog_str_plotter(outstr, figno, method)
%UNTITLED5 Summary of this function goes here
%   Detailed explanation goes here

if strcmp(method, 'multi')
    
    if strcmp(outstr.inmeth, 'L')
        
        range = [outstr.ist.varst.Lengths(1),outstr.ist.varst.Lengths(end)].*1e3;
        figure(figno); hh = gcf;
        subplot(2,2,1)
        plot(outstr.ist.varst.Lengths.*1e3, normalize(outstr.BzX.*1e3,'range')); hold on
        xlabel 'L [mm]'
        ylabel 'Normalised range of B_z across X'
        title 'Normalised range of B_z across X'
        h = gca;
        if isempty(h.Legend)
            legend(['B_0 = ', num2str(outstr.B0_Oe), ' [Oe], fac = ', num2str(max(outstr.BzX.*1e3,[],'all')),' [mT]'])
        else
            lset =  {['B_0 = ', num2str(outstr.B0_Oe), ' [Oe], fac = ', num2str(max(outstr.BzX.*1e3,[],'all')),' [mT]']};
            lset2 = [h.Legend.String(1:end-1), lset];
            legend(lset2)
        end
        xlim(range)
        thesis_fig_gen(hh.Number)
        subplot(2,2,2)
        plot(outstr.ist.varst.Lengths.*1e3, normalize(outstr.BzY.*1e3,'range')); hold on
        xlabel 'L [mm]'
        ylabel 'Normalised range of B_z [mT]'
        title 'Normalised range of B_z across Y'
        xlim(range)
        h = gca;
        if isempty(h.Legend)
            legend(['B_0 = ', num2str(outstr.B0_Oe), ' [Oe], fac = ', num2str(max(outstr.BzY.*1e3,[],'all')),' [mT]'])
        else
            lset =  {['B_0 = ', num2str(outstr.B0_Oe), ' [Oe], fac = ', num2str(max(outstr.BzY.*1e3,[],'all')),' [mT]']};
            lset2 = [h.Legend.String(1:end-1), lset];
            legend(lset2)
        end
        thesis_fig_gen(hh.Number)
        subplot(2,2,3)
        plot(outstr.ist.varst.Lengths.*1e3, normalize(outstr.dphi.*1e3,'range')); hold on
        xlabel 'L [mm]'
        ylabel 'Normalised range of B_z [mT/deg]'
        title 'Normalised range of d\phi/dt'
        xlim(range)
        h = gca;
        if isempty(h.Legend)
            legend(['B_0 = ', num2str(outstr.B0_Oe), ' [Oe], fac = ', num2str(max(outstr.dphi.*1e3,[],'all')),' [mT/deg]'])
        else
            lset =  {['B_0 = ', num2str(outstr.B0_Oe), ' [Oe], fac = ', num2str(max(outstr.dphi.*1e3,[],'all')),' [mT/deg]']};
            lset2 = [h.Legend.String(1:end-1), lset];
            legend(lset2)
        end
        thesis_fig_gen(hh.Number)
        subplot(2,2,4)
        plot(outstr.ist.varst.Lengths.*1e3, normalize(outstr.avphi.*1e3,'range')); hold on
        xlabel 'L [mm]'
        ylabel 'Normalised average d\phi/dt [mT/deg]'
        title 'Normalised average d\phi/dt'
        xlim(range)
        h = gca;
        if isempty(h.Legend)
            legend(['B_0 = ', num2str(outstr.B0_Oe), ' [Oe], fac = ', num2str(max(outstr.avphi.*1e3,[],'all')),' [mT/deg]'])
        else
            lset =  {['B_0 = ', num2str(outstr.B0_Oe), ' [Oe], fac = ', num2str(max(outstr.avphi.*1e3,[],'all')),' [mT/deg]']};
            lset2 = [h.Legend.String(1:end-1), lset];
            legend(lset2)
        end
        thesis_fig_gen(hh.Number)
        
    elseif strcmp(outstr.inmeth, 'OD')
        
        range = [outstr.ist.varst.PM(1),outstr.ist.varst.PM(end)].*1e3;
        figure(figno); hh = gcf;
        subplot(2,2,1)
        plot(outstr.ist.varst.PM.*1e3, normalize(outstr.BzX.*1e3,'range')); hold on
        xlabel 'OD [mm]'
        ylabel 'Range of B_z [mT]'
        title 'Range of B_z across X'
        xlim(range)
        h = gca;
        if isempty(h.Legend)
            legend(['B_0 = ', num2str(outstr.B0_Oe), ' [Oe], fac = ', num2str(max(outstr.BzX.*1e3,[],'all')),' [mT]'])
        else
            lset =  {['B_0 = ', num2str(outstr.B0_Oe), ' [Oe], fac = ', num2str(max(outstr.BzX.*1e3,[],'all')),' [mT]']};
            lset2 = [h.Legend.String(1:end-1), lset];
            legend(lset2)
        end
        thesis_fig_gen(hh.Number)
        subplot(2,2,2)
        plot(outstr.ist.varst.PM.*1e3, normalize(outstr.BzY.*1e3,'range')); hold on
        xlabel 'OD [mm]'
        ylabel 'Range of B_z [mT]'
        title 'Range of B_z across Y'
        xlim(range)
        h = gca;
        if isempty(h.Legend)
            legend(['B_0 = ', num2str(outstr.B0_Oe), ' [Oe], fac = ', num2str(max(outstr.BzY.*1e3,[],'all')),' [mT]'])
        else
            lset =  {['B_0 = ', num2str(outstr.B0_Oe), ' [Oe], fac = ', num2str(max(outstr.BzY.*1e3,[],'all')),' [mT]']};
            lset2 = [h.Legend.String(1:end-1), lset];
            legend(lset2)
        end
        thesis_fig_gen(hh.Number)
        subplot(2,2,3)
        plot(outstr.ist.varst.PM.*1e3, normalize(outstr.dphi.*1e3,'range')); hold on
        xlabel 'OD [mm]'
        ylabel 'Range of B_z [mT/deg]'
        title 'Range of d\phi/dt'
        xlim(range)
        h = gca;
        if isempty(h.Legend)
            legend(['B_0 = ', num2str(outstr.B0_Oe), ' [Oe], fac = ', num2str(max(outstr.dphi.*1e3,[],'all')),' [mT/deg]'])
        else
            lset =  {['B_0 = ', num2str(outstr.B0_Oe), ' [Oe], fac = ', num2str(max(outstr.dphi.*1e3,[],'all')),' [mT/deg]']};
            lset2 = [h.Legend.String(1:end-1), lset];
            legend(lset2)
        end
        thesis_fig_gen(hh.Number)
        subplot(2,2,4)
        plot(outstr.ist.varst.PM.*1e3, normalize(outstr.avphi.*1e3,'range')); hold on
        xlabel 'OD [mm]'
        ylabel 'Average d\phi/dt [mT/deg]'
        title 'Average d\phi/dt'
        xlim(range)
        h = gca;
        if isempty(h.Legend)
            legend(['B_0 = ', num2str(outstr.B0_Oe), ' [Oe], fac = ', num2str(max(outstr.avphi.*1e3,[],'all')),' [mT/deg]'])
        else
            lset =  {['B_0 = ', num2str(outstr.B0_Oe), ' [Oe], fac = ', num2str(max(outstr.avphi.*1e3,[],'all')),' [mT/deg]']};
            lset2 = [h.Legend.String(1:end-1), lset];
            legend(lset2)
        end
        thesis_fig_gen(hh.Number)
        
    else
        error 'Incorrect structure input method - go and check it'
    end  
    
elseif strcmp(method, 'single')  
    
    if strcmp(outstr.inmeth, 'L')
        
        range = [outstr.ist.varst.Lengths(1),outstr.ist.varst.Lengths(end)].*1e3;
        figure(figno); hh = gcf;
        subplot(2,2,1)
        plot(outstr.ist.varst.Lengths.*1e3, (outstr.BzX.*1e3)); hold on
        xlabel 'L [mm]'
        ylabel 'Range of B_z [mT]'
        title 'Range of B_z across X'
        xlim(range)
        legend(['B_0 = ', num2str(outstr.B0_Oe), ' [Oe]'])
        thesis_fig_gen(hh.Number)
        subplot(2,2,2)
        plot(outstr.ist.varst.Lengths.*1e3, (outstr.BzY.*1e3)); hold on
        xlabel 'L [mm]'
        ylabel 'Range of B_z [mT]'
        title 'Range of B_z across Y'
        xlim(range)
        legend(['B_0 = ', num2str(outstr.B0_Oe), ' [Oe]'])
        thesis_fig_gen(hh.Number)
        subplot(2,2,3)
        plot(outstr.ist.varst.Lengths.*1e3, (outstr.dphi.*1e3)); hold on
        xlabel 'L [mm]'
        ylabel 'Range of B_z [mT/deg]'
        title 'Range of d\phi/dt'
        xlim(range)
        legend(['B_0 = ', num2str(outstr.B0_Oe), ' [Oe]'])
        thesis_fig_gen(hh.Number)
        subplot(2,2,4)
        plot(outstr.ist.varst.Lengths.*1e3, (outstr.avphi.*1e3)); hold on
        xlabel 'L [mm]'
        ylabel 'Average d\phi/dt [mT/deg]'
        title 'Average d\phi/dt'
        xlim(range)
        legend(['B_0 = ', num2str(outstr.B0_Oe), ' [Oe]'])
        thesis_fig_gen(hh.Number)
        
    elseif strcmp(outstr.inmeth, 'OD')
        
        range = [outstr.ist.varst.PM(1),outstr.ist.varst.PM(end)].*1e3;
        figure(figno); hh = gcf;
        subplot(2,2,1)
        plot(outstr.ist.varst.PM.*1e3, (outstr.BzX.*1e3)); hold on
        xlabel 'OD [mm]'
        ylabel 'Range of B_z [mT]'
        title 'Range of B_z across X'
        xlim(range)
        legend(['B_0 = ', num2str(outstr.B0_Oe), ' [Oe]'])
        thesis_fig_gen(hh.Number)
        subplot(2,2,2)
        plot(outstr.ist.varst.PM.*1e3, (outstr.BzY.*1e3)); hold on
        xlabel 'OD [mm]'
        ylabel 'Range of B_z [mT]'
        title 'Range of B_z across Y'
        xlim(range)
        legend(['B_0 = ', num2str(outstr.B0_Oe), ' [Oe]'])
        thesis_fig_gen(hh.Number)
        subplot(2,2,3)
        plot(outstr.ist.varst.PM.*1e3, (outstr.dphi.*1e3)); hold on
        xlabel 'OD [mm]'
        ylabel 'Range of B_z [mT/deg]'
        title 'Range of d\phi/dt'
        xlim(range)
        legend(['B_0 = ', num2str(outstr.B0_Oe), ' [Oe]'])
        thesis_fig_gen(hh.Number)
        subplot(2,2,4)
        plot(outstr.ist.varst.PM.*1e3, (outstr.avphi.*1e3)); hold on
        xlabel 'OD [mm]'
        ylabel 'Average d\phi/dt [mT/deg]'
        title 'Average d\phi/dt'
        xlim(range)
        legend(['B_0 = ', num2str(outstr.B0_Oe), ' [Oe]'])
        thesis_fig_gen(hh.Number)
        
    else
        error 'Incorrect structure input method - go and check it'
    end 
    
else
    error 'Incorrect function input method - go and check it'
end         
end

