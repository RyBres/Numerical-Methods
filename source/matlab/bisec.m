function resultBisec = bisec(inpFun, abvec, inpErr)
    
    % set default arguments
    arguments
            inpFun = 0
            abvec = 0
            inpErr = .001
    end

    if abvec == 0
        disp("Please obtain a vector containing a and b by running findab prior to this function.");
        return
    else if size(abvec,ndims(abvec)) ~= 2
        disp("Please obtain a vector containing a and b by running findab prior to this function.");
        return
    end
    
    message1 = sprintf("Finding the solution to within an error of %d using the bisection method.\n", inpErr);
    disp(message1);
    
    % Define a b given the error
    a = vpa(abvec(1));
    b = vpa(abvec(2));
    
    while abs(b-a) > inpErr
        p = vpa((a+b)/2);
        if abs(inpFun(p)) < inpErr
            % result
            resultBisec = vpa(p);
            return;
        end
        if sign(inpFun(a)) == sign(inpFun(p))
            a = vpa(p);
        else
            b = vpa(p);
        end
    end

    
end