
function I = composite_midpoint(f, a, b, n)
    
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
    
    % obtain step size and find vector between a and b by h
    h = (b - a) / n;
    x = linspace(a + h/2, b - h/2, n);
    
    % find I with composite midpoint formula
    I = sum(f(x)) * h;

end
