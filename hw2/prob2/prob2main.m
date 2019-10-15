close all;
% accelerometer bias
bias = 1E-3 * g;

% altimeter bias
altBiases = [5,10];

% desired time constant
taus = [10,50,100,150,200];

% schuler frequency
schuler = sqrt(g/R);

for tauInd = 1:length(taus)
    tau = taus(tauInd);
    figure('DefaultAxesFontSize',14);
    T = 10*tau;
    C1 = 2 / tau;
    C2 = 1/tau/tau + 2 * schuler^2;
    
    %% bias = 5;
    altBias = 5;
    
    bias5 = sim('prob2bias',T);

    delH = bias5.get('deltaH');
    delV = bias5.get('deltaV');
    
    subplot(2,1,1)
    five = plot(delH,'r');
    hold on
    
    subplot(2,1,2)
    plot(delV,'r')
    hold on
    
    %% bias = 10;
    altBias = 10;
    
    bias10 = sim('prob2bias',T);

    delH = bias10.get('deltaH');
    delV = bias10.get('deltaV');
    
    subplot(2,1,1)
    ten = plot(delH,'b');
    hold on
    
    subplot(2,1,2)
    plot(delV,'b')
    hold on
    
    %% markov
    stdH = 0.5;
    tauH = 1000;
    altDt = 0.1;
    
    mark = sim('prob2markov',T);
    
    delH = mark.get('deltaH');
    delV = mark.get('deltaV');
    
    subplot(2,1,1)
    markov = plot(delH,'k');
    
    subplot(2,1,2)
    plot(delV,'k')
    
    %% theoretical value
    subplot(2,1,1)
    % steady state del H
    ssH = @(altB) tau^2 * bias + (1 + 2 * (schuler * tau)^2)*altB;
    
    yline(ssH(5),'--r');
    yline(ssH(10),'--b');
    
    subplot(2,1,2)
    % steady state del V
    ssV = @(altB) 2*tau*bias + 4*schuler^2*tau*altBias;
    yline(ssV(5),'--r');
    yline(ssV(10),'--b');
    
    %% titles
    subplot(2,1,1)
    title("Height error");
    ylabel("[m]");
    
    
    legend([five,ten,markov],["bias 5m", "bias 10m", "markov"],'Location','best')
    
    grid on
    
    subplot(2,1,2)
    title("Velocity error");
    ylabel("[m/s]");
    xlabel("time [s]");
    grid on
    
    sgtitle(sprintf("tau = %d",tau))
    
    %% save
    saveas(gcf,sprintf("./figures/prob2tau%d.jpg",tau))
end

