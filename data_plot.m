function [  ] = data_plot( x,y,logFileID )

Title = input('Enter title of graph: ','s');
Xaxis = input('Enter label of x axis: ', 's');
Yaxis = input('Enter label of y axis: ', 's');
curvefit = input('Enter label of curve fit: ', 's');
data = input('Enter label of data: ', 's');
yfit = [];
ContinueOrNot = true;
while ContinueOrNot
fprintf('      Chose a curve fit for graph.\n\n');
fprintf(' 1) Make a liner curve fit.\n');
fprintf(' 2) Make a general curve fit polynomial of degree n.\n');
fprintf(' 3) Make a exponential curve fit.\n');
fprintf(' 4) Make a power law curve fit.\n');
fprintf(' 5) Make a trigonometric curve fit.\n');
fprintf(' 6) Make a Logarithmic curve fit.\n');
fprintf(' 7) Make a Reciprocal curve fit.\n');


MenuChoice = input('\nEnter your choice: '); 

switch MenuChoice
case 1
[ yfit, ~, ~,  ] =liner_curve(x,y,logFileID);
ContinueOrNot = false;
case 2
[ yfit, ~, ~  ] =polynomial_curve(x,y,logFileID);
ContinueOrNot = false; 
case 3
[ yfit, ~, ~  ] = exponential_curve(x,y,logFileID);
ContinueOrNot = false; 
case 4
[ yfit, ~, ~  ] = Logarithmic_curve(x,y,logFileID);
ContinueOrNot = false; 
case 5
[ yfit, ~, ~  ] = trigonometric_curve(x,y,logFileID);
ContinueOrNot = false; 
case 6
[ yfit, ~, ~  ] = Logarithmic_curve(x,y,logFileID);
ContinueOrNot = false; 
case 7
[ yfit, ~, ~  ] = reciprocal_curve(x,y,logFileID);
ContinueOrNot = false;
otherwise  
fprintf('\nERROR: Please choose an integer between 1 and 7\n\n')
input('Press <Enter> to continue');
end
end



plot(x,y,'co',x,yfit,'r');
title(Title);
legend(curvefit, data);
ylabel(Yaxis);
xlabel(Xaxis);
legend(data,curvefit);
fprintf('\nCreate a pdf for graph.\n');
input('Press <Enter> to continue');
[pdfFileName,path] = uiputfile('*.pdf');
pdfNamePath = strcat(path,pdfFileName);
if(exist(pdfNamePath, 'file') == 2)
    fprintf('File already exits');
return;
end
print(pdfNamePath,'-dpdf');

 input('Press <Enter> to return to main menu.');

end

