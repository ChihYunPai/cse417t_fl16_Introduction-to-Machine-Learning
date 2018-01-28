function [expectation_Eout, bias_plus_var, bias, var] = Problem2_24 (k)
x1 = 2*rand(k,1)-1;
x2 = 2*rand(k,1)-1;
D = [x1, x1.^2, x2, x2.^2];
a_bar = mean(x1+x2)
b_bar = -1*mean(x1.*x2)
x = sym('x');
func = 0.5*((a_bar*x+b_bar-x^2)^2);
bias = vpa( int(func,x,-1,1), 4 );
%var = mean( [mean(((D(:,1)+D(:,3)).*D(:,1) - (D(:,1).*D(:,3)) - (a_bar*D(:,1) + b_bar)).^2) , mean(((D(:,1)+D(:,3)).*D(:,3) - (D(:,1).*D(:,3)) - (a_bar*D(:,3) + b_bar)).^2) ] );
var = mean( [mean(D(:,1).^2) - mean(D(:,1))^2 , mean(D(:,3).^2) - mean(D(:,3))^2] );
bias_plus_var = vpa( bias + var, 5);
expectation_Eout = 1/5 + 1/3*mean((D(:,1)+D(:,3)).^2) - 2/3*mean(D(:,1).*D(:,3)) + mean( (D(:,1).*D(:,3)).^2);

figure

x = linspace(-1,1);
y = x.^2;
g_bar = a_bar*x + b_bar;
%%x1_bar = mean(D(:,1));
%%x2_bar = mean(D(:,3));
%%x1_sqr_bar = mean(D(:,2));
%%x2_sqr_bar = mean(D(:,4));
%%g_bar = (x-x2_bar)*(x1_sqr_bar-x2_sqr_bar)/(x1_bar-x2_bar) + x2_sqr_bar;
plot(x,y, x, g_bar);
ax = gca;
ax.XAxisLocation = 'origin';
ax.YAxisLocation = 'origin';
title('f(x) = x^2 and gbar(x)')
xlabel('x')
ylabel('f(x) = x^2')
set(legend('f(x)','$\bar{g}$(x)'),'interpreter','Latex','FontSize',12)
end