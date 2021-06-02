function [ ] = thesis_homog_str_plotter(outstr, figno)
%UNTITLED5 Summary of this function goes here
%   Detailed explanation goes here
       
    if strcmp(outstr.inmeth, 'L')
        
        range = [outstr.ist.varst.Lengths(1),outstr.ist.varst.Lengths(end)].*1e3;
        figure(figno); hh = gcf;
        subplot(2,2,1)
        plot(outstr.ist.varst.Lengths.*1e3, outstr.BzX.*1e3); hold on
        xlabel 'L [mm]'
        ylabel 'Range of B_z [mT]'
        title 'Range of B_z across X'
        xlim(range)
        thesis_fig_gen(hh.Number)
        subplot(2,2,2)
        plot(outstr.ist.varst.Lengths.*1e3, outstr.BzY.*1e3); hold on
        xlabel 'L [mm]'
        ylabel 'Range of B_z [mT]'
        title 'Range of B_z across Y'
        xlim(range)
        thesis_fig_gen(hh.Number)
        subplot(2,2,3)
        plot(outstr.ist.varst.Lengths.*1e3, outstr.dphi.*1e3); hold on
        xlabel 'L [mm]'
        ylabel 'Range of B_z [mT/deg]'
        title 'Range of d\phi/dt'
        xlim(range)
        thesis_fig_gen(hh.Number)
        subplot(2,2,4)
        plot(outstr.ist.varst.Lengths.*1e3, outstr.avphi.*1e3); hold on
        xlabel 'L [mm]'
        ylabel 'Average d\phi/dt [mT/deg]'
        title 'Average d\phi/dt'
        xlim(range)
        thesis_fig_gen(hh.Number)
        
    elseif strcmp(outstr.inmeth, 'OD')
        
        range = [outstr.ist.varst.Lengths(1),outstr.ist.varst.Lengths(end)].*1e3;
        figure(figno); hh = gcf;
        subplot(2,2,1)
        plot(outstr.ist.varst.Lengths.*1e3, outstr.BzX.*1e3); hold on
        xlabel 'L [mm]'
        ylabel 'Range of B_z [mT]'
        title 'Range of B_z across X'
        xlim(range)
        thesis_fig_gen(hh.Number)
        subplot(2,2,2)
        plot(outstr.ist.varst.Lengths.*1e3, outstr.BzY.*1e3); hold on
        xlabel 'L [mm]'
        ylabel 'Range of B_z [mT]'
        title 'Range of B_z across Y'
        xlim(range)
        thesis_fig_gen(hh.Number)
        subplot(2,2,3)
        plot(outstr.ist.varst.Lengths.*1e3, outstr.dphi.*1e3); hold on
        xlabel 'L [mm]'
        ylabel 'Range of B_z [mT/deg]'
        title 'Range of d\phi/dt'
        xlim(range)
        thesis_fig_gen(hh.Number)
        subplot(2,2,4)
        plot(outstr.ist.varst.Lengths.*1e3, outstr.avphi.*1e3); hold on
        xlabel 'L [mm]'
        ylabel 'Average d\phi/dt [mT/deg]'
        title 'Average d\phi/dt'
        xlim(range)
        thesis_fig_gen(hh.Number)
        
    else
        error 'Incorrect input method - go and check it'
    end 
    
        
end

