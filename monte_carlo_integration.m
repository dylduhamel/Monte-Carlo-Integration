function xApprox = monte_carlo(func, a, b, sampleSize)
    % Function to compute the Monte-Carlo integral of a function func from
    % bounds a, b
    % Uses random sampling of size sampleSize 

    % Parameters
    i = 1;
    N = sampleSize;
    funcVal = 0;

    % Fills array with random numbers within [a, b] of size N
    vals = rand(N,1)*(b-a) + a;

    % Compute N function evaluations of vals
    while i <= N
        funcVal = funcVal + func(vals(i));
        i = i+1;
    end

    % Compute MC definite integral
    xApprox = (b-a)/N*funcVal;
   
end
