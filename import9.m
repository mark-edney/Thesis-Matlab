%% Import data from text file
% Script for importing data from the following text file:
%
%    filename: D:\Thesis\Experiment\Trial 9 - 2\Conductivity Sensors log file.lvm
%
% Auto-generated by MATLAB on 05-Mar-2020 09:50:49

%% Setup the Import Options and import the data
opts = delimitedTextImportOptions("NumVariables", 6);

% Specify range and delimiter
opts.DataLines = [23, Inf];
opts.Delimiter = "\t";

% Specify column names and types
opts.VariableNames = ["LabVIEWMeasurement", "VarName2", "VarName3", "VarName4", "VarName5", "Var6"];
opts.SelectedVariableNames = ["LabVIEWMeasurement", "VarName2", "VarName3", "VarName4", "VarName5"];
opts.VariableTypes = ["double", "double", "double", "double", "double", "string"];

% Specify file level properties
opts.ExtraColumnsRule = "ignore";
opts.EmptyLineRule = "read";

% Specify variable properties
opts = setvaropts(opts, "Var6", "WhitespaceRule", "preserve");
opts = setvaropts(opts, "Var6", "EmptyFieldRule", "auto");

% Import the data
ConductivitySensorslogfile = readtable("\Thesis\Experiment\Trial 9 - 2\Conductivity Sensors log file.lvm", opts);

%% Convert to output type
ConductivitySensorslogfile = table2array(ConductivitySensorslogfile);

%% Clear temporary variables
clear opts