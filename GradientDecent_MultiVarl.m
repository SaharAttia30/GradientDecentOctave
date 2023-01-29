% Gradient descent function for Multi Varaible
% Finds t0, t1 thus J() goes to minima
% HW2

clc
close all;
% m - # of data examples
m = vectorSize;
% learning rate
alpha= 1.0e-2;
% epsilon - convergence "error" for Cost function
ERR = 1.0e-9;
% Max # of iterations
NumIter = 1.0e5;
% intilize of Thetas
T = rand(1,n) ;   % scalar random 1x1 tetha0
% delta for while loop
dt0 = ERR+1;
dt1 = ERR+1;
 ts0=0; % storage vector t0
 ts1=0; % storage vector t1
 ts2=0;
 ts3=0;
 ts4=0;
 ts5=0;
 i=0;  % iteration counter
 cost =0; % cost function per iteration
 lastCost = ERR+1;
 dcost = ERR+1;
 % Main loop
 % Convergence logic term  on Cost function
while  ( lastCost>ERR && i<NumIter)
  i=i+1;
  H = (X*T')';
  s0= sum((H - Y).*X0);
  s1= sum((H - Y).*X1);
  s2= sum((H - Y).*X2);
  s3= sum((H - Y).*X3);
  s4= sum((H - Y).*X4);
  % J- Vector of Cost function per iteration
  cost(i) = sum(((H - Y).^2))/m/2;
  % diff of Cost function between the iterations
  dcost =  abs(cost(i)-lastCost);
  % update lastCost
  lastCost =cost(i);
  % Calculate t0 , t1...
  temp0 = T(1) - alpha/m * s0;
  temp1 = T(2) - alpha/m * s1;
  temp2 = T(3) - alpha/m * s2;
  temp3 = T(4) - alpha/m * s3;
  temp4 = T(5) - alpha/m * s4;
  % Update thethas
  T(1)= temp0;
  T(2)= temp1;
  T(3)= temp2;
  T(4)= temp3;
  T(5)= temp4;
  % For Control : storage vector of t0, t1
  ts1(i)=T(1);
  ts2(i)=T(2);
  ts3(i)=T(3);
  ts4(i)=T(4);
  ts5(i)=T(5);
end
% END of WHILE


% Linear regression line h(x) = t0+t1*XL
%Hx=t0+t1*XL;

% Theoretical line

XL0 = linspace(1,1,150);
% x1 = [0....1]
XL1 = linspace(43,range(2),150);
XL1 = XL1./range(2);
XL2 = linspace(2,range(3),150);
XL2 = XL2./range(3);
XL3 = linspace(1,range(4),150);
XL3 = XL3./range(4);
XL4 = linspace(1,range(5),150);
XL4 = XL4./range(5);

XL = [ XL0 ; XL1 ; XL2 ; XL3 ; XL4 ]';

YL = T*XL';
table2 = csvread('test.csv');
%feature numbers
% Vector size = 1 x vectorSize ; rand [0..1]
Xtest0 = linspace (1, 1, 5 );
Xtest1 = table2(1:5,3)/range(2);
Xtest2= table2(1:5,4)/range(3);
Xtest3=table2(1:5,5)/range(4);
Xtest4 = table2(1:5,6)/range(5);
Xtest1 = Xtest1';
Xtest2 = Xtest2';
Xtest3 = Xtest3';
Xtest4 = Xtest4';
Xtest = [Xtest0 ; Xtest1; Xtest2 ; Xtest3 ; Xtest4];
YtestL = T*Xtest;
Ytest = table2(1:5,2);
yres = abs(Ytest - YtestL)
figure(1);
plot(ts1,ts2,'.');
xlabel ("t1");
ylabel ("t2");

figure(2);
plot(ts3,ts4,'.');
xlabel ("t3");
ylabel ("t4");

figure(3);
plot(1:i,cost,'.');
xlabel ("iteration");
ylabel ("cost");

figure(5)
plot(XL1,YL,'.r');
hold;
plot(X1,Y,'.b');

figure(6)
plot(Xtest1,Ytest,'.r');
hold;
plot(Xtest1,YtestL,'.b');
