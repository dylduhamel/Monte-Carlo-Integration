%% Method calls for Monti Carlo Integration

a = 0;
b = 4;
func = @(x) sin(x);
sampleSize = 10000;

xApprox = monte_carlo_integration_graph(func, a, b, sampleSize);
xReal = integral(func, a, b);
approxError = abs(xReal-xApprox);

display(xApprox);
display(xReal);
display(approxError);
