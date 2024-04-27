clear all
%%

function myplot = customPlot(p, j, x, y, yhat)
    % Call figure(j) before this   
    arguments
        p double
        j double  
        x double
        y double
        yhat double
    end

    % Get explicit polynomial
    digits(10);
    p_sym = poly2sym(vpa(p, 4));
    p_latex = latex(p_sym);
    
    % Plot original data and regression line
    plot(x, y, 'bo', 'MarkerSize', 8); % Plot original data
    hold on;
    plot(x, yhat, 'LineWidth', 2); % Plot regression line
    hold off;
    
    % Add labels and legend
    polyDef = ['P_',num2str(j), '(x)'];
    ylabel('Close Price');
    xlabel('t');
    legend('ClosePrice_t', polyDef);
    title('Polynomial Approx. of $TSLA Close Price');
    subtitle(['$', polyDef, '=', p_latex, '$'],'Interpreter','latex');
end


%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Least squares estimation
% Fetch TSLA stock data from 2023-2024 using hist_stock_data function
disp(" ")
disp('Least Squares Approx. $TSLA Data')

stocks = hist_stock_data('01012023', '01012024', 'TSLA');
closePrice = getfield(stocks, "Close")';
time = getfield(stocks, "Date")';

n = 80;
y_closePrice = closePrice(1:n);
x_dayVals = time(1:n);
x_dayVals = days(x_dayVals - x_dayVals(1));

%% 

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% P. of degree = 1:4. Note that the LaTeX equations will get too big for
% the plot past the 4th power.

for j = 1:4
    
    % Define polynomial
    polyDef = ['P',num2str(j), '(x)'];
    p = polyfit(x_dayVals, y_closePrice, j);
    newY = polyval(p, x_dayVals);
    
    % Predict n+1th value, compare to actual value
    x_next = x_dayVals(end) + 1;
    yhat_next = polyval(p, x_next);
    yactual_next = closePrice(n+1);
    
    abs_diff = abs(yactual_next-yhat_next);
    err = (yactual_next-yhat_next)^2;
    
    % Generate visual
    disp(" ")
    message = [polyDef, ' approx. of element n+1 = ', char(vpa(yactual_next))];
    disp(message)
    message = ['Actual value of element n+1 = ', char(vpa(yhat_next))];
    disp(message)
    message = [polyDef, ' abs. error, for element n+1 = ', char(vpa(abs_diff))];
    disp(message)
    message = [polyDef, ' squared error, for element n+1 = ', char(vpa(err))];
    disp(message)

    figure(j)
    customPlot(p, j, x_dayVals, y_closePrice, newY)

end

%% 

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Now with first-differenced TSLA data
disp(" ")
disp('Least Squares Approx. First-Differenced $TSLA Data')

D1 = LagOp({1,-1},'Lags',[0,1]);
diff_closePrice = filter(D1,closePrice);

n = 80;
dy_closePrice = diff_closePrice(1:n);
x_dayVals = time(1:n);
x_dayVals = days(x_dayVals - x_dayVals(1));

%% 

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% P. of degree = 1:4 on the differenced data.

for j = 1:4
    
    % Define polynomial
    polyDef = ['P',num2str(j), '(x)'];
    p = polyfit(x_dayVals, dy_closePrice, j);
    newY = polyval(p, x_dayVals);
    
    % Predict n+1th value, compare to actual value
    x_next = x_dayVals(end) + 1;
    yhat_next = polyval(p, x_next);
    yactual_next = diff_closePrice(n+1);
    
    abs_diff = abs(yactual_next-yhat_next);
    err = (yactual_next-yhat_next)^2;
    
    % Generate visual
    disp(" ")
    message = [polyDef, ' approx. of element n+1 = ', char(vpa(yactual_next))];
    disp(message)
    message = ['Actual value of element n+1 = ', char(vpa(yhat_next))];
    disp(message)
    message = [polyDef, ' abs. error, for element n+1 = ', char(vpa(abs_diff))];
    disp(message)
    message = [polyDef, ' squared error, for element n+1 = ', char(vpa(err))];
    disp(message)
    

    figure(j+4)
    customPlot(p, j, x_dayVals, dy_closePrice, newY)
    title('Polynomial Approx. of \Delta$TSLA Close Price');
    ylabel('\Delta Close Price');
    xlabel('t');
    polyDef = ['P_',num2str(j), '(x)'];
    legend('\DeltaClosePrice_t', polyDef);

end

%%