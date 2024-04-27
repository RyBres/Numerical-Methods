%%%%%%%%%%%%%%%%%
% Ryan Bresnahan
%%%%%%%%%%%%%%%%%

% KEY %
% inpFun = the function

% inpX0 = a number that is close to some root (default is 1). If x0=1 is
% undefined, then change the number to one that is.

% findab(inpFun, inpX0) => findab takes two arguments - the function and
% inpX0, or a number near some root (default 1). This number is necessary 
% for the interval to be guaranteed to contain a root.

% bisec(inpFun, ab_vec, inpErr) => bisec takes three arguments - the
% function, vector containing a and b, and a given error. inpErr defaults
% to .1.

% bisectionN(inpFun, ab_vec, inpErr, inpX0) => bisectionN accomplishes the same as
% above with the same inputs, but uses N iterations to converge on a value
% within the given error inpErr. inpX0 is necessary to confirm the error of
% the result (I was not sure if this would be better outside of inside of
% the function). Can usually be ignored as it default = 1, but must be
% changed if inpX0 != 1.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% EXAMPLE with a polynomial

inpFun = @(x) x^4 - 2*x^3 - 4*x^2 + 4*x + 4;
inpX0 = 1;

ab_vec = findab(inpFun);
disp(ab_vec);  % Display the results

result = bisec(inpFun, ab_vec, .1); 
disp(vpa(result))

resultN = bisectionN(inpFun, ab_vec, .1);
disp(vpa(resultN))