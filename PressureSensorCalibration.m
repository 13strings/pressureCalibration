function[fit] = PressureSensorCalibration(files, compressionTrialCSV,fignum)

P = LoadCellCalibration();

% Trial 1

data = readtable(compressionTrialCSV);
data_press = data.pressureReading_mbar_;
data_area = data.crossSectAreaIn_2;

for i=1:length(files)
    voltages(i) = averagingData(files(i));
end

for i= 2:length(files)
    N_applied(i) = abs((voltages(i) - P(2))/P(1)) + 1240/1000*9.8; % match voltages to N
    pres_applied(i) = N_applied(i) / data_area(i) *15.5 ; %pressure applied in mbar
end

% match psi to pressure 

fit = polyfit(pres_applied,data_press,2);
fitted_pressure = pres_applied.^2*fit(1) + fit(2)*pres_applied + fit(3);

figure(fignum)

plot(pres_applied, data_press, "DisplayName", "Direct relation")
hold on
plot(pres_applied, fitted_pressure, "DisplayName", "fit")
title("Trial " + num2str(fignum))
ylabel("Pressure measured (from p sensor) [mbar]")
xlabel("Pressure applied (load cell + weight)")
legend()
return
