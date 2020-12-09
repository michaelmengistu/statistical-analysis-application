% By submitting this assignment, I agree to the following:
% ìAggies do not lie, cheat, or steal, or tolerate those who doî
% ìI have not given or received any unauthorized aid on this assignmentî
%
% Name: Michael Mengistu
% Section: 515
% Team: 4
% Assignment: MATLAB Project
% Date: April 22, 2018


%uploads file data
fprintf('Chose a .txt file.\n');
input('Press <Enter> to continue');
fileName = uigetfile('*.txt');
fileID = fopen(fileName);
if(fileID == -1)
    fprintf('File name not found.\n');
    return;
end
if(fileID == '"stdin"')
    fprintf('File not chosen.\n');
    return;
end



%text-based menu
count = 0;
x = [];
y = [];
while ~feof(fileID)
% store a line of text in the variable tline
tline = fgets(fileID);
tline = regexprep(tline,'\t',' ');

% count number of spaces in line
listSpaces = strfind(tline,' ');
if (length(listSpaces) == 1)

first = tline(1:listSpaces(1)-1);

second = tline(listSpaces(1):length(tline));


if ~isnan(str2double(first)) && ~isnan(str2double(second))
count = count + 1;
x(count) = str2double(first);
y(count) = str2double(second);
end

end
end
fclose(fileID);

%makes a log file
fprintf('Create a log file.\n');
input('Press <Enter> to continue');
[logFileName,path] = uiputfile('*.txt');
fileNamePath = strcat(path,logFileName);
if(exist(fileNamePath, 'file') == 2)
    fprintf('File already exits');
return;
end

%log file format
logFileID = fopen(fileNamePath,'w+');
fprintf(logFileID, '%s \n\n',fileName);
fprintf(logFileID, 'Type:                           R^2  |   MSE   |   COEFF \n');


ContinueOrNot = true;
while ContinueOrNot
MenuText();

MenuChoice = input('\nEnter your choice: '); 

switch MenuChoice
case 1
liner_curve(x,y,logFileID);
case 2
polynomial_curve(x,y,logFileID);
case 3
exponential_curve(x,y,logFileID);
case 4
powerLaw_curve( x,y,logFileID )
case 5
trigonometric_curve(x,y,logFileID);
case 6
Logarithmic_curve(x,y,logFileID);
case 7
reciprocal_curve(x,y,logFileID);
case 8
data_plot(x,y,logFileID );
case 9
ContinueOrNot = false; 
otherwise  
fprintf('\nERROR: Please choose an integer between 1 and 9\n\n')
input('Press <Enter> to continue');
end
end
fclose(logFileID);



