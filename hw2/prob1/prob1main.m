% gravity
g = 9.7803267714;

% Earth radius
R = 6378137;

% 1000s simulation
T = 1000;


% acc bias 1mg
bias = 1E-3 * g;
% no acc noise given
noise = 0;

% initial errors
% del V_Z 0 0.5m/s
delV0 = 0.5;
% delta H 30m
delH0 = 30;

% fee


with = sim('prob1.slx',T);

withDelH = with.get('deltaH');
withDelV = with.get('deltaV');

delV0 = 0;
delH0 = 0;
without = sim('prob1.slx',T);

withoutDelH = without.get('deltaH');
withoutDelV = without.get('deltaV');

figure;
subplot(2,1,1)
plot(withDelH,'k')
hold on
plot(withoutDelH,'--k')
title("height errors")
legend("with initial errors", "without initial errors")
xlabel("time [s]")
ylabel("error [m]")

subplot(2,1,2)
plot(withDelV,'k')
hold on
plot(withoutDelV,'--k')
title("velocity errors")
xlabel("time [s]")
ylabel("error [m/s]")

sgtitle("prob1 result")