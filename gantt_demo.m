clear
close all
help gantt_chart

% Import demo .csv (look inside for headers!)
ganttData = importdata('gantt.csv');
labels = ganttData.data(:,1);
slots = ganttData.data(:,2:end);

% Or specify custom data
% labels = ['A'; 'B'];
% slots = [0 2 0 0; 
%          1 6 7 8];

gantt_chart(slots, labels);