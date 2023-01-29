%  This function creates and plots data around the regression line
%  Training set
%  Created by Dr.Yevgeny Beiderman
%  Last edited : 06-11-2022



% Close all windows
close all;
% Clear all varaibles
clear all;


% Shipua
slope=0.5;
% m - examples
vectorSize=45;
% data span arround the regression line
error=0.3;
% max sizes in table
range = [2700000 185 6 6 73];
table= csvread('data_houses.csv');
%feature numbers
n= 5;

% Vector size = 1 x vectorSize ; rand [0..1]
X0 = linspace (1, 1, vectorSize );
X1 = table(1:45,2)/range(2);
X2= table(1:45,3)/range(3);
X3=table(1:45,4)/range(4);
X4 = table(1:45,5)/range(5);
X1 = X1';
X2 = X2';
X3 = X3';
X4 = X4';
% Y's
X =  [  X0 ; X1; X2 ; X3 ; X4  ]';

Y = table(1:45,1);
Y=Y';

% Linear equation y = mx
%Y = slope*X;

% Plotting
figure(1)
plot(X1,Y,'*')
xlabel('feature#1');
ylabel('estimation');
figure(2)
plot(X2,Y,'*')
xlabel('feature#1');
ylabel('estimation');
figure(3)
plot(X3,Y,'*')
xlabel('feature#1');
ylabel('estimation');
figure(4)
plot(X4,Y,'*')
xlabel('feature#1');
ylabel('estimation');
