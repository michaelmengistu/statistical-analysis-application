function [ yfit, MSE, r  ] = trigonometric_curve(x,y,logFileID)

    p = polyfit(sin(x),y,1);
    yfit = p(1) + p(2)*sin(x);
    n = numel(x);
    r = (n*sum(x.*y) - sum(x)*sum(y))/(sqrt(n*sum(x.^2)- sum(x)^2)*sqrt(n*sum(y.^2)-sum(y)^2));
    r = r^2;
    e = y - yfit;
    MSE = mean(e.^2);
    fprintf( 'Type:                           R^2  |   MSE   |   COEFF \n');
    fprintf('SINUSOIDAL [y = B + A*sin(x)]:  %.4f | %.4f | %.4f  %.4f\n',r,MSE,p(2),p(1));
    result = sprintf('SINUSOIDAL [y = B + A*sin(x)]:  %.4f | %.4f | %.4f  %.4f\n',r,MSE,p(2),p(1));
    fprintf(logFileID,'%s',result);
        input('Press <Enter> to return to main menu.');


end

