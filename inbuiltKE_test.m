

kkk = 0;


    vg = @(k) (integral(@(x) (sqrt(1 - (1-(k.^2))*(sin(x).^2))),0,pi/2));

    epsillonmHm = vg(kkk);
    
    g = @(k) (integral(@(x) (1./sqrt(1 - ((1-(k.^2))*(sin(x).^2)))),0,pi/2));

    kappamHm = g(kkk);
    
    vg1 = @(k) (integral(@(x) (sqrt(1 - (k)*(sin(x).^2))),0,pi/2));

    epsillonkHm = vg1(kkk);
    
    g1 = @(k) (integral(@(x) (1./sqrt(1 - (k)*(sin(x).^2))),0,pi/2));

    kappakHm = g1(kkk);
    

[kappakIb,epsillonkIb] = ellipke(kkk);

[kappamIb,epsillonmIb] = ellipke((1-(kkk^2)));
