function resultBisec = bisectionN(inpFun, abvec, inpErr, inpX0)
    
    % set default arguments
    arguments
            inpFun = 0
            abvec = 0
            inpErr = .001
            inpX0 = 1
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
    
    % Define a b and max iterations given the error
    a = vpa(abvec(1));
    b = vpa(abvec(2));

    n = log((1/inpErr)*(abs(b-a)))/log(2);
    
    % initialize iteration counter
    iter = 0;
    
    disp(sprintf("Number of iterations = %d \n", ceil(n)))

    while iter < n
        p = vpa((a+b)/2);
        if abs(inpFun(p)) < inpErr
            % result
            resultBisec = vpa(p);

            % Calculate error and perform logic test
            closeRoot = vpa(fzero(inpFun, inpX0));

            if vpa(abs(vpa(closeRoot)-vpa(double(resultBisec)))) <= inpErr
                disp('Within desired error: TRUE')
            else
                disp('Within desired error: FALSE')
            end

            return;
        end
        if sign(inpFun(a)) == sign(inpFun(p))
            a = vpa(p);
        else
            b = vpa(p);
        end
        iter = iter + 1;
    end
    
    
end