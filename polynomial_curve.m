function [ yfit, MSE, r  ] = polynomial_curve( x,y,logFileID)
ContinueOrNot = true;

while ContinueOrNot
fprintf('      Chose up to the 5th degree.\n\n');
fprintf(' 1) 1st degree.\n');
fprintf(' 2) 2nd degree.\n');
fprintf(' 3) 3rd degree.\n');
fprintf(' 4) 4th degree.\n');
fprintf(' 5) 5th degree\n');



degree = input('\nEnter your choice: '); 

switch degree
case 1
[yfit, MSE, r] =nth_degree( x,y,degree );
ContinueOrNot = false;
case 2
[yfit, MSE, r] =nth_degree( x,y,degree );
ContinueOrNot = false; 
case 3
[yfit, MSE, r] =nth_degree( x,y,degree );
ContinueOrNot = false; 
case 4
[yfit, MSE, r] =nth_degree( x,y,degree );
ContinueOrNot = false; 
case 5
[yfit, MSE, r] =nth_degree( x,y,degree );
ContinueOrNot = false; 
otherwise  
fprintf('\nERROR: Please choose an integer between 1 and 5\n\n')
input('Press <Enter> to continue');
end
end
    
end

