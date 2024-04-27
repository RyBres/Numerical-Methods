
function I = composite_trapezoid(f, a, b, n)
    
    % validate inputs
    arguments
        f function_handle
        a {mustBeNumeric}
        b {mustBeNumeric}
        n {mustBeNumeric}
    end

    if ~(a < b)
        error('The lower limit of integration (a) must be less than the upper limit of integration (b).');
    end

    if n < 1 || rem(n,2)==1
        error('Number of subintervals (n) must be even.');
    end
    
    % obtain step size and find vector between a and b by h
    h = (b - a)/n;
    x = a:h:b;
    
    fx = f(x);

    % find I with composite trapezoid formula
    I = (h/2) * (fx(1) + 2*sum(fx(2:1:end-1)) + fx(end));

end

    
