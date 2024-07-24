Diffusion Coefficients Comparator
Promoting the Visualization of Calculated vs. Experimental Data
This project calculates and compares the main diffusivities of Ti-Al-Co ternary alloys at 1473 K using both experimental and calculated values. The comparisons are based on the research by Takahashi et al., 2009. The script reads data from an Excel file and plots the comparison graph.

Project Description
This project uses MATLAB to plot a comparison between experimental and calculated main diffusivities for the Ti-Al-Co ternary system at 1473 K. The aim is to facilitate visualization and analysis of the accuracy of calculated diffusion coefficients against experimental values.

Features
Read experimental and calculated values from an Excel file.
Plot a comparison graph of experimental vs. calculated values.
Highlight deviations with dashed lines.
Usage
Place the Excel file with your data in the project directory.

Run the MATLAB script comparison.m.

matlab'''
复制代码
comparison'''
Select the Excel file (comparisons.xlsx) when prompted.

The script will read the data from 'Sheet1' and 'Sheet2' of the selected Excel file and plot the comparison graph.

Data Format
Ensure your Excel file (comparisons.xlsx) has the following format:

Sheet1:

Column 1: Calculated values for the main diffusivity 
𝐷
~
𝐴
𝑙
𝐴
𝑙
𝑇
𝑖
D
~
  
AlAl
Ti
​
 
Column 2: Experimental values for the main diffusivity 
𝐷
~
𝐴
𝑙
𝐴
𝑙
𝑇
𝑖
D
~
  
AlAl
Ti
​
 
Column 3: Logarithm (base 10) of the calculated values for 
𝐷
~
𝐴
𝑙
𝐴
𝑙
𝑇
𝑖
D
~
  
AlAl
Ti
​
 
Column 4: Logarithm (base 10) of the experimental values for 
𝐷
~
𝐴
𝑙
𝐴
𝑙
𝑇
𝑖
D
~
  
AlAl
Ti
​
 
Sheet2:

Column 1: Calculated values for the main diffusivity 
𝐷
~
𝐶
𝑜
𝐶
𝑜
𝑇
𝑖
D
~
  
CoCo
Ti
​
 
Column 2: Experimental values for the main diffusivity 
𝐷
~
𝐶
𝑜
𝐶
𝑜
𝑇
𝑖
D
~
  
CoCo
Ti
​
 
Column 3: Logarithm (base 10) of the calculated values for 
𝐷
~
𝐶
𝑜
𝐶
𝑜
𝑇
𝑖
D
~
  
CoCo
Ti
​
 
Column 4: Logarithm (base 10) of the experimental values for 
𝐷
~
𝐶
𝑜
𝐶
𝑜
𝑇
𝑖
D
~
  
CoCo
Ti
​
 
Example
Below is an example plot generated by the project. It shows the comparison between the experimental and calculated values of the main diffusivities for the Ti-Al-Co ternary system at 1473 K. The plot includes:

Blue triangles representing the data for 
𝐷
~
𝐴
𝑙
𝐴
𝑙
𝑇
𝑖
D
~
  
AlAl
Ti
​
 .
Red circles representing the data for 
𝐷
~
𝐶
𝑜
𝐶
𝑜
𝑇
𝑖
D
~
  
CoCo
Ti
​
 .
A solid black line indicating the line of perfect agreement.
Dashed lines indicating a ±50% error margin.

In this plot, the 
𝑥
x-axis represents the logarithm (base 10) of the experimental interdiffusion coefficients, and the 
𝑦
y-axis represents the logarithm (base 10) of the calculated interdiffusion coefficients. Points within the dashed lines are within a ±50% error margin, indicating good agreement between the experimental and calculated values.

![COMPARISONS](https://github.com/user-attachments/assets/48ad7251-cf31-4af3-9aee-35650c0deca1)

MATLAB Code
Here is the commented MATLAB code used in this project:

matlab
复制代码
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
Contribution
Feel free to contribute to this project by submitting issues or pull requests. Please ensure your contributions align with the project's objectives and maintain code quality.

License
This project is licensed under the MIT License. See the LICENSE file for details.

Contact
For any questions or inquiries, please contact [1786888479@qq.com].

References
Takahashi T, Ozawa T, Minamino Y, et al. Ternary diffusion and thermodynamic interaction in the β solid solutions of Ti―Al―Co alloys. Keikinzoku, 2009, 59(8): 432-438.
