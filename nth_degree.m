function [yfit, MSE, r]= nth_degree( x,y,n )
           p = polyfit(x,y,n);
           yfit = polyval(p,x);
           n = numel(x);
           r = (n*sum(x.*y) - sum(x)*sum(y))/(sqrt(n*sum(x.^2) - sum(x)^2) * sqrt(n*sum(y.^2)-sum(y)^2));
           r = r.^2;
           e = y - yfit;
           MSE = mean(e.^2);
           fprintf( 'Type:                           R^2  |   MSE   |   COEFF \n');
           if(n == 1)
           fprintf('OTHER POLYNOMIAL:  %.4f | %.4f | %.4f\n',r,MSE,p(1));
           result = sprintf('OTHER POLYNOMIAL:  %.4f | %.4f | %.4f\n',r,MSE,p(1));
           elseif(n == 2)
           fprintf('OTHER POLYNOMIAL:  %.4f | %.4f | %.4f  %.4f\n',r,MSE,p(1),p(2));
           result = sprintf('OTHER POLYNOMIAL:  %.4f | %.4f | %.4f  %.4f\n',r,MSE,p(1),p(2));
           elseif(n == 3)
           fprintf('OTHER POLYNOMIAL:  %.4f | %.4f | %.4f  %.4f  %.4f\n',r,MSE,p(1),p(2),p(3));
           result = sprintf('OTHER POLYNOMIAL:  %.4f | %.4f | %.4f  %.4f  %.4f\n',r,MSE,p(1),p(2),p(3));
           elseif(n == 4)
           fprintf('OTHER POLYNOMIAL:  %.4f | %.4f | %.4f  %.4f  %.4f  %.4f\n',r,MSE,p(1),p(2),p(3), p(4));
           result = sprintf('OTHER POLYNOMIAL:  %.4f | %.4f | %.4f  %.4f  %.4f  %.4f\n',r,MSE,p(1),p(2),p(3),p(4));
           else
           fprintf('OTHER POLYNOMIAL:  %.4f | %.4f | %.4f  %.4f  %.4f  %.4f  %.4f\n',r,MSE,p(1),p(2),p(3), p(4),p(5));
           result = sprintf('OTHER POLYNOMIAL:  %.4f | %.4f | %.4f  %.4f  %.4f  %.4f  %.4f\n',r,MSE,p(1),p(2),p(3),p(4),p(5));
           end
           
           fprintf(logFileID,'%s',result);
    input('Press <Enter> to return to main menu.');
           

end

