function [ yfit, MSE,r ] = powerLaw_curve( x,y,logFileID )
    p = polyfit(log(x),log(y),1);
    b = ln(p(2));
    m = p(1);
    yfit = bx.^m;
    plot(x,y,'b+',x,yfit,'r');
    n = numel(x);
    r = (n*sum(x.*y) - sum(x)*sum(y))/(sqrt(n*sum(x.^2) - sum(x)^2) * sqrt(n*sum(y.^2)-sum(y)^2));    r = r.^2;
    e = y - yfit;
    MSE = mean(e.^2);
    fprintf( 'Type:                           R^2  |   MSE   |   COEFF \n');
    fprintf('POWER [y = B * x ^ A]:  %.4f | %.4f | %.4f  %.4f\n',r,MSE,b,m);
    result = sprintf('POWER [y = B * x ^ A]:  %.4f | %.4f | %.4f  %.4f\n',r,MSE,b,m);
    fprintf(logFileID,'%s',result);
        input('Press <Enter> to return to main menu.');



end

