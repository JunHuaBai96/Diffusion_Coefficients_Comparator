% Close all figures, clear command window, and clear workspace
close all
clc
clear

% Prompt the user to select an Excel file containing experimental and calculated values for the main diffusivities
[FileName, PathName] = uigetfile('*.xlsx', 'Select the experimental and calculated values for the main diffusivities');

% Read data from the selected Excel file, Sheet1
% Columns 3 and 4 contain the logarithmic values (base 10) of the calculated and experimental diffusivities for \tilde{D}_{AlAl}^{Ti}
Exprofile = xlsread([PathName '\\' FileName], 'Sheet1');
X1 = Exprofile(:, 3)'; % Logarithm of calculated diffusivities for \tilde{D}_{AlAl}^{Ti}
X2 = Exprofile(:, 4)'; % Logarithm of experimental diffusivities for \tilde{D}_{AlAl}^{Ti}

% Read data from the selected Excel file, Sheet2
% Columns 3 and 4 contain the logarithmic values (base 10) of the calculated and experimental diffusivities for \tilde{D}_{CoCo}^{Ti}
Exprofile = xlsread([PathName '\\' FileName], 'Sheet2');
Y1 = Exprofile(:, 3)'; % Logarithm of calculated diffusivities for \tilde{D}_{CoCo}^{Ti}
Y2 = Exprofile(:, 4)'; % Logarithm of experimental diffusivities for \tilde{D}_{CoCo}^{Ti}

% Define the range for the plot
x = -13.5:-9.5;
y = x;
y2 = x - 0.20;
y3 = x + 0.20;

% Create a new figure for the plot
figure;

% Plot the line of perfect agreement (y = x) and ±50% error margins
plot(x, y, 'k', x, y2, '--k', x, y3, '--k', 'LineWidth', 2.5); hold on;

% Plot the calculated vs. experimental diffusivities for \tilde{D}_{AlAl}^{Ti} (blue triangles)
plot(X1, X2, 'b^', 'MarkerFaceColor', 'b'); hold on;

% Plot the calculated vs. experimental diffusivities for \tilde{D}_{CoCo}^{Ti} (red circles)
plot(Y1, Y2, 'rO', 'MarkerFaceColor', 'r'); hold on;

% Set the axis limits for the plot
axis([-12.5 -10 -12.5 -10]);

