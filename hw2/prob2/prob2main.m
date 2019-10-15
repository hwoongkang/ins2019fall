%% barometer just bias
close all;
% accelerometer bias
bias = 1E-3 * g;

% altimeter bias
altBiases = [5,10];

% desired time constant
taus = [10,50,100,150,200];

% schuler frequency
schuler = sqrt(g/R);

for tau = taus
    T = 10*tau;
    altBias = altBiases(1);
    
    C1 = 2 / tau;
    C2 = 1/tau/tau + 2 * schuler^2;
    
    justBias = sim('prob2bias',T);

    biasDelH = justBias.get('deltaH');
    
    figure
    plot(biasDelH)
    hold on
    yline(tau*tau*bias,'--r')
end

