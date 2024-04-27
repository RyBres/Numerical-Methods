
% You must input a number inpX0 to obtain a root close to that number.
% Otherwise depending on the function you may never get a or b (think tangent).

function vectorab = findab(inpFun, inpX0)

    % set default arguments
    arguments
        inpFun = 0
        inpX0 = 1
    end

    % check if defined for inpX0
    if isa(inpFun, 'function_handle') ~= 1
        disp("The function is not properly set. Please define a function (class function_handle) for the input inpFun.");
        return
    end

    if real(inpFun(inpX0)) == 0
        disp("The function is undefined for the given X0. Please select a different value for X0.");
        return
    end
    
    % find the closest root to X0 and define a and b as 1 unit away
    closeRoot = fzero(inpFun, inpX0);
    a = closeRoot-1;
    b = closeRoot+1;
    
    % move a and b until they satisfy the inequality. this needs to be
    % changed so that it's guaranteed (should be able to move in either
    % direction)
    while inpFun(a)*inpFun(b) > 0
        a = a + .1;
        b = b + .1;
    end

    vectorab = [a, b];

end