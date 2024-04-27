
function I = composite_simpson(f, a, b, n)
    
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
    
    % get function values at vector points, grouping into odd and even
    fx = f(x);
    fx_odd = fx(2:2:end-1);
    fx_even = fx(3:2:end-2);

    % find I with composite simpson formula
    I = (h/3) * (fx(1) + 4*sum(fx_odd) + 2*sum(fx_even) + fx(end));

end

    
