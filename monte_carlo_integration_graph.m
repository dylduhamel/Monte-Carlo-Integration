function xApprox = monte_carlo_graph(func, a, b, sampleSize)
    % Parameters
    i = 1;

    % Computation of upper y bound for region
    % Finds max y value from func
    upperMax = 1.3*max(func(linspace(a,b)));

    % Generating psuedo random points
    while i <= sampleSize
        % Computing random point within region M * (b-a)
        x = rand(1)*(b-a) + a;
        y = rand(1)*upperMax;

        % Compare against curve
        fx = func(x);

        % Logic
        if y < fx
            under(i,1) = x;
            under(i,2) = y;
        else
            above(i,1) = x;
            above(i,2) = y;
        end
        i = i+1;
    end

    underClean(:,1) = nonzeros(under(:,1));
    underClean(:,2) = nonzeros(under(:,2));

    aboveClean(:,1) = nonzeros(above(:,1));
    aboveClean(:,2) = nonzeros(above(:,2));

    xApprox = length(underClean) / sampleSize * (upperMax*(b-a));

    % Plotting
    plot(aboveClean(:,1),aboveClean(:,2),'ro','MarkerFaceColor','r')
    hold on
    plot(underClean(:,1),underClean(:,2),'bo','MarkerFaceColor','b')
    title('Monte Carlo Integration'), xlabel('x'), ylabel('y')
    legend('above','under')

end