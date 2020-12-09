function [ yfit, MSE, r  ] = liner_curve( x,y,logFileID )


    
    linerMenu = true;
    while linerMenu



    fprintf('     Liner Menu\n\n');
    fprintf(' 1) Make a liner curve fit with a non-zero intercept.\n');
    fprintf(' 2) Make a liner curve fit with a zero intercept.\n');
  

    
     MenuChoice = input('\nEnter your choice: ');
    
    
    switch MenuChoice
        case 1
           p = polyfit(x,y,1);
           yfit = p(1)*x ;
           n = numel(x);
           r = (n*sum(x.*y) - sum(x)*sum(y))/(sqrt(n*sum(x.^2) - sum(x)^2) * sqrt(n*sum(y.^2)-sum(y)^2));
           r = r.^2;
           e = y - yfit;
           MSE = mean(e.^2);
           fprintf( 'Type:                           R^2  |   MSE   |   COEFF \n');
           fprintf('LINEAR [ y = A*x ]:  %.4f | %.4f | %.4f\n',r,MSE,p(1));
           result = sprintf('LINEAR [ y = A*x ]:  %.4f | %.4f | %.4f\n',r,MSE,p(1));
           fprintf(logFileID,'%s',result);
           input('Press <Enter> to return to main menu.');
           linerMenu = false;
        case 2
           p = polyfit(x,y,1);
           yfit = p(1)*x + p(2);
           n = numel(x);
           r = (n*sum(x.*y) - sum(x)*sum(y))/(sqrt(n*sum(x.^2) - sum(x)^2) * sqrt(n*sum(y.^2)-sum(y)^2));
           r = r.^2;
           e = y - yfit;
           MSE = mean(e.^2);
           fprintf( 'Type:                           R^2  |   MSE   |   COEFF \n');
           fprintf('LINEAR [ y = Ax + B ]:  %.4f | %.4f | %.4f  %.4f \n',r,MSE,p(1),p(2));
           result = sprintf('LINEAR [ y = A*x ]:  %.4f | %.4f | %.4f  %.4f \n',r,MSE,p(1),p(2));
           fprintf(logFileID,'%s',result);
           input('Press <Enter> to return to main menu.');
           linerMenu = false;  
        otherwise  
            fprintf('\nERROR: Please choose an integer between 1 and 2\n\n')
            input('Press <Enter> to continue');
    end
    end
end


          


