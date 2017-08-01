function [ fig, ax ] = gantt_chart( slots, labels, active_color, passive_color )
%%Simple Gantt chart plotting function. 
%   Arguments:
%       slots: Matrix with rows per activity. Columns should correspond to 
%              alternating begin and end times (absolute) of an activity.
%              Rows should be padded to the right with zeros if number of 
%              slots is unequal for different activities.
%       active_color: Color of active slots of an activity.
%       passive_color: Color of passive slots of an activity.
%   Returns:
%       fig: figure handle
%       ax: axis handle
% 
%   Author: Tiemen Schuijbroek
%   Organization: Eindhoven University of Technology
%   Date: August 1st 2017


%% Default argument values
if nargin < 2
    % Just numbered labels
    labels = 1:size(slots, 1);
end

if nargin < 3
    % Black
    active_color = 'k';
end

if nargin < 4
    % Grey
    passive_color = [0.8, 0.8, 0.8];
end

%% Calculate relative bar lengths
for i = length(slots(1,:)):-1:2
    for j = 1:1:length(slots(:,1))
        if slots(j,i) > 0
           slots(j,i) = slots(j,i)-slots(j,i-1); 
        end
    end
end

%% Plot stacked horizontal bars using barh()
range = 1:length(labels);
h = barh(range, slots, 'stacked', active_color, 'LineStyle', 'none');
title('Gantt Chart');
xlabel('Time [days]');
ylabel('Activity');
set(gca, 'YDir', 'reverse', 'YTickLabel', labels);

%% Set inactive color for alternating slots.
for i = 1:1:size(slots, 2)
    if mod(i, 2) ~= 0
        set(h(i), 'FaceColor', passive_color); 
    end
end

%% Get return values (figure and axis handles)
fig = gcf;
ax = gca;
end