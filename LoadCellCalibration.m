function [P] = LoadCellCalibration()
weights = [-118.7 0 907.4 1360.8 1814 2268 2720.8 3174.8 3628 4081.4 4535];
weights = (weights + 118.7)/1000 * 9.81;
voltage = [];
files = ["0 g.csv","0 + support ( 118.7 g).csv", "907.4 g.csv", "1360.8 g.csv"...
    "1814 g.csv", "2268 g.csv", "2720.8 g.csv", "3174.8 g.csv", "3628 g.csv", ...
    "4081.4 g.csv", "4535 g.csv"];

for i=1:length(files)
    T = readtable(files(i), "NumHeaderLines", 4);
    V = T.Var2;
    voltage(i) = mean(V);
end

P = polyfit(weights,voltage,1);

figure('Name', 'Load cell calibration')
plot(weights,voltage, "DisplayName", "Raw voltage")
hold on
plot(weights, P(1)*weights + P(2), "DisplayName", "y = 0.0227 x + 0.1163")
xlabel("Weight (N)")
ylabel("Voltage (V)")
legend()

return




