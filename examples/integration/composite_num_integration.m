clear all;

function myplot = customPlot(num, fun, a, b)
    arguments
        num {mustBeNumeric}
        fun function_handle
        a {mustBeNumeric}
        b {mustBeNumeric}
    end
    figure(num)
    fplot(fun)
    xlim([a,b])
end

%% 

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Composite Simpson's Rule
% Find max of f''''(xi) on interval for error bound, then estimate
% Desired error = 1/10^3

disp('Composite Simpson''s Rule')

x = 1:0.001:3;
d4_y = abs(-119*exp(3*x).*cos(2*x)-120*exp(3*x).*sin(2*x));
d4_y_fplot = @(x) abs(-119*exp(3*x).*cos(2*x)-120*exp(3*x).*sin(2*x));

customPlot(1, d4_y_fplot, 1, 3)

[maxvalue, index] = max(d4_y(1:length(1:0.001:3)));

syms x
d4_y = abs(-119*exp(3*x).*cos(2*x)-120*exp(3*x).*sin(2*x));
LaTeX_Expr = latex(d4_y);

title(['$|f^4(x)| = ', LaTeX_Expr, '$'],'Interpreter','latex')

n = ceil(nthroot((1600/9)*(maxvalue), 4)); % this is a solved equation!

x = 1:0.001:3;
message = ['Max of |f^4(x)| on interval = ', num2str(maxvalue), ', where x=', num2str(x(index))];
disp(message)
message = ['n = ', num2str(n)];
disp(message)

%% 

f = @(x) exp(3*x).*cos(2*x);
a = 1;
b = 3;

if rem(n, 2) ~= 0
    n = n + 1
end

result = composite_simpson(f, a, b, n);
message = ['Composite Trapezoid Rule Approx. = ', char(vpa(result, 10))];
disp(message)

matlab_res = integral(f, a, b);
abs_err = abs(result - matlab_res);
message = ['Error = ', char(vpa(abs_err, 10))];
disp(message)

disp(' ')

%% 

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Composite Trapezoid Rule
% Find max of f''(xi) on interval for error bound, then estimate
% Desired error = 1/10^3

disp('Composite Trapezoid Rule')

x = 1:0.001:3;
d2_y = abs(5*exp(3*x).*cos(2*x)-12*exp(3*x).*sin(2*x));
d2_y_fplot = @(x) abs(5*exp(3*x).*cos(2*x)-12*exp(3*x).*sin(2*x));

customPlot(2, d2_y_fplot, 1, 3)

[maxvalue, index] = max(d2_y(1:length(1:0.001:3)));

syms x
d2_y = abs(5*exp(3*x).*cos(2*x)-12*exp(3*x).*sin(2*x));
LaTeX_Expr = latex(d2_y);

title(['|$f''''(x)| = ', LaTeX_Expr, '$'],'Interpreter','latex')

n = ceil(nthroot((2000/3)*(maxvalue), 2)); % this is a solved equation!

x = 1:0.001:3;
message = ['Max of |f''''(x)| on interval = ', num2str(maxvalue), ', where x=', num2str(x(index))];
disp(message)
message = ['n = ', num2str(n)];
disp(message)

%% 

f = @(x) exp(3*x).*cos(2*x);
a = 1;
b = 3;

if rem(n, 2) ~= 0
    n = n + 1;
end

result = composite_trapezoid(f, a, b, n);
message = ['Composite Trapezoid Rule Approx. = ', char(vpa(result, 10))];
disp(message)

matlab_res = integral(f, a, b);
abs_err = abs(result - matlab_res);
message = ['Error = ', char(vpa(abs_err, 10))];
disp(message)

disp(' ')

%% 

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Composite Midpoint Rule
% Find max of f''(xi) on interval for error bound, then estimate
% Desired error = 1/10^3

disp('Composite Midpoint Rule')

x = 1:0.001:3;
d2_y = abs(5*exp(3*x).*cos(2*x)-12*exp(3*x).*sin(2*x));
d2_y_fplot = @(x) abs(5*exp(3*x).*cos(2*x)-12*exp(3*x).*sin(2*x));

customPlot(3, d2_y_fplot, 1, 3)

[maxvalue, index] = max(d2_y(1:length(1:0.001:3)));

syms x
d2_y = abs(5*exp(3*x).*cos(2*x)-12*exp(3*x).*sin(2*x));
LaTeX_Expr = latex(d2_y);

title(['|$f''''(x)| = ', LaTeX_Expr, '$'],'Interpreter','latex')

n = ceil(nthroot((1000/3)*(maxvalue), 2)); % this is a solved equation!

x = 1:0.001:3;
message = ['Max of |f''''(x)| on interval = ', num2str(maxvalue), ', where x=', num2str(x(index))];
disp(message)
message = ['n = ', num2str(n)];
disp(message)

%% 

f = @(x) exp(3*x).*cos(2*x);
a = 1;
b = 3;

result = composite_midpoint(f, a, b, n);
message = ['Composite Midpoint Rule Approx. = ', char(vpa(result, 10))];
disp(message)

matlab_res = integral(f, a, b);
abs_err = abs(result - matlab_res);
message = ['Error = ', char(vpa(abs_err, 10))];
disp(message)

disp(' ')

%% 
