close all;

accBias = 1E-3 * g;

% schuler frequency
schuler = sqrt(g/R);

%% altimeter
stdH = 0.5;
tauH = 1000;
altDt = 0.1;

% desired time constant
taus = [10,50,100,150,200];

T = 7* max(taus);
figure('DefaultAxesFontSize',14,'DefaultLineLineWidth',1);
for tau = taus
    C1 = 3/tau;
    C2 = 2*schuler^2 + 3/tau/tau;
    C3 = 1/(tau^3);
    C4 = 0;
    
    model = sim('prob3.slx',T);
    
    delH = model.get('deltaH');
    delV = model.get('deltaV');
    
    subplot(2,1,1)
    plot(delH)
    hold on
    
    subplot(2,1,2)
    plot(delV)
    hold on
end
subplot(2,1,1)
legend(arrayfun(@(x) sprintf("tau = %d",x),taus),'Location','best')
title("Height error");
ylabel("[m]")
grid on

subplot(2,1,2)
title("Velocity error");
ylabel("[m/s]")
xlabel("time [s]")
grid on

sgtitle("Model: Markov Process")
saveas(gcf,"./figures/prob3markov.jpg")

%% biases
for altBias = [5,10]
    figure('DefaultAxesFontSize',14,'DefaultLineLineWidth',1);
    for tau = taus
        C1 = 3/tau;
        C2 = 2*schuler^2 + 3/tau/tau;
        C3 = 1/(tau^3);
        C4 = 0;
        
        model = sim('prob3bias.slx',T);
        
        delH = model.get('deltaH');
        delV = model.get('deltaV');
        
        subplot(2,1,1)
        plot(delH)
        hold on
        
        subplot(2,1,2)
        plot(delV)
        hold on
    end
    subplot(2,1,1)
    legend(arrayfun(@(x) sprintf("tau = %d",x),taus),'Location','best')
    title("Height error");
    ylabel("[m]")
    grid on
    yline(altBias,'--k');
    
    subplot(2,1,2)
    title("Velocity error");
    ylabel("[m/s]")
    xlabel("time [s]")
    grid on
    
    sgtitle(sprintf("Model: Bias %dm",altBias))
    saveas(gcf,sprintf("./figures/prob3bias%d.jpg",altBias))
    
end