x = linspace(0,30, 1001);
% x1 = linspace(0.1,0.45,31);
y = ((x.*cos(x)) - sin(x))./(x.^4);
% y1 = cos(50.*x)./(x.^3);

posInd = y >= 0;
negInd = y <  0;

h1 = figure;
plot(x(posInd),y(posInd)*1e3,'rx','MarkerSize', 2)
hold on
plot(x(negInd),y(negInd)*1e3,'bx','MarkerSize', 2)
hline(0,'k:')

set(gca,'XTick',(2:2:8).*pi);
set(gca,'XTickLabels',{'2\pi','4\pi','6\pi','8\pi'})
% set(gca,'YTick',[]);
xlabel 'R'; ylabel '10^3 x J(R)'
set(gca,'fontsize', 11)


ylim([-2.5 ,5.5])

vline((2:2:8).*pi,'k:')

plot(x(y==max(y)),y(y==max(y))*1e3,'ko','MarkerSize', 13);

thesis_fig_gen(h1.Number)

clear h1 x y x1 y1 posInd negInd