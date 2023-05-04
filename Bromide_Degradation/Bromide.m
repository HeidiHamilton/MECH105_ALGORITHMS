% Given experimental data
t_exp = 10:10:60;
c_exp = [3.4 2.6 1.6 1.3 1.0 0.5];
t = 0:.5:70;
% Expected function
c_func = 4.84.*exp(-.034.*t)
t_func = (log(c_func./4.84))/-.034

% Plot
plot(t,c_func,'rd')
xlabel('t')
ylabel('func')
legend('c_func')