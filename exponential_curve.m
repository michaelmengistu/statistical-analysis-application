function [ yfit, MSE, r  ] = exponential_curve( x,y,logFileID )

    p = polyfit(x,log(y),1);
    b = exp(p(2));
    m = p(1);
    yfit = b*exp(m*x);
    n = numel(x);
    r = (n*sum(x.*y) - sum(x)*sum(y))/(sqrt(n*sum(x.^2) - sum(x)^2) * sqrt(n*sum(y.^2)-sum(y)^2));
    r = r.^2;
    e = y - yfit;
    MSE = mean(e.^2);
    fprintf( 'Type:                           R^2  |   MSE   |   COEFF \n');
    fprintf('EXPONENTIAL [y = B * exp(A*x)]:  %.4f | %.4f | %.4f  %.4f \n',r,MSE,b,m);
    result = sprintf('EXPONENTIAL [y = B * exp(A*x)]: %.4f | %.4f | %.4f  %.4f \n',r,MSE,b,m);
    fprintf(logFileID,'%s',result);
    input('Press <Enter> to return to main menu.');
     


end

