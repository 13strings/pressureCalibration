function [avg_value] = averagingData(file)

    T = readtable(file, "NumHeaderLines", 4);
    V = T.Var2;
    avg_value = mean(V);
    return 
