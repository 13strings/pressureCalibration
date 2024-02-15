close all; clc; clear all;

%% Trial 1
files = ["T1,1 0g.csv", "T1,2 1240 g.csv", "T1,3.csv", "T1,4.csv", "T1,5.csv",...
    "T1,6.csv", "T1,7.csv"];

fit = PressureSensorCalibration(files,"compression trial 1.csv",1);

%% Trial 2
files2 = ["T2,1 0g.csv", "T2,2 1240 g.csv", "T2,3.csv", "T2,4.csv", "T2,5.csv",...
    "T2,6.csv", "T2,7.csv"];

fit2 = PressureSensorCalibration(files2, "compression trials - Trial 2.csv",2);

%% Comparing the fits

% x = linspace(0,4000);
% 
% y1 = fit(1) * x.^2 + fit(2) * x + fit(3);
% y2 = fit2(1) * x.^2 + fit2(2) * x + fit2(3);
% 
% figure(3) 
% title("Both trial calibration curves")
% plot(x,y1)
% hold on
% plot(x,y2)