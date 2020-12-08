[min_all_sup, min_all_bigstr] = loop_input_moke_options(31, 'minor');
[maj_all_sup, maj_all_bigstr] = loop_input_moke_options(32, 'major');

figure(2); clf;

plot(maj_all_sup.datax, maj_all_sup.additiveMnorm, 'k-', min_all_sup.datax, min_all_sup.additiveMnorm.*0.584, 'r-' )

vline(-1394.707,'r:')
text(-1350, 0.8,'J = -1394.707[Oe]','color', 'r')

xlabel 'Field [Oe]'
ylabel 'Normalised Kerr signal'
title 'SP8313 - Normalised summation of many loops'
legend ('Major loop', 'Minor loop', 'Location', 'Northwest')

set(gca, 'fontsize',11)
set(gcf, 'position',  [100, 100, 540, 400]) 
legend('boxoff') 