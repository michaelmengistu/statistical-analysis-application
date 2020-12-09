function [ yfit, MSE, r  ] = reciprocal_curve( x,y,logFileID )
    Y = 1./y;
    p = polyfit(x,Y,1);
    b = p(2);
    m = p(1);
    yfit = 1 ./ (m*x + b);
    n = numel(x);
    r = (n*sum(x.*y) - sum(x)*sum(y))/(sqrt(n*sum(x.^2)- sum(x)^2)*sqrt(n*sum(y.^2)-sum(y)^2));
    r = r^2;
    e = y - yfit;
    MSE = mean(e.^2);
    fprintf( 'Type:                           R^2  |   MSE   |   COEFF \n');
    fprintf('RECIPROCAL [y = 1/ (A*x + B)]:  %.4f | %.4f | %.4f  %.4f\n',r,MSE,b,m);
    result = sprintf('RECIPROCAL [y = 1/ (A*x + B)]:  %.4f | %.4f | %.4f  %.4f\n',r,MSE,b,m);
    fprintf(logFileID,'%s',result);
        input('Press <Enter> to return to main menu.');


end

