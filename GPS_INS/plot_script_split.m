colors = [
    0.9290 0.6940 0.1250;  % Dark yellow
    0.3010 0.7450 0.9330;  % Light blue
    0.6350 0.0780 0.1840;  % Dark red
    0.4660 0.6740 0.1880;  % Dark green
    0.8500 0.3250 0.0980;  % Dark orange
    0 0.4470 0.7410;       % Dark blue
    0.9290 0.6940 0.5640;  % Light brown
    0.4940 0.1840 0.5560;  % Dark purple
    0.4660 0.6740 0.1880   % Dark green
];
% hold off
% line_ploter_3D(time, horzcat(rN(1:end-1), rN2)...
%     , horzcat(rE(1:end-1), rE2), horzcat(states(:, 4), states(:, 4)+1), t1, t2, colors)
%%
t1 = 1045;
t2 = 1800;
%%
% no AI slave
load('data_no_AI.mat', 'AI_result', 'AI_result_master')
windowSize = 5; % Adjust the window size as needed
data = AI_result;
time = data(:, 1);
line_ploter_split(time, movmean(data(:, 2:end),windowSize), t1, t2, colors, '', 1) % 0 is master
% no AI master
data = AI_result_master;
time = data(:, 1);
line_ploter_split(time, movmean(data(:, 2:end),windowSize), t1, t2, colors, '', 0) % 0 is master

%% AI slave
windowSize = 50000; % Adjust the window size as needed
% smoothed_data_with_gps = movmean(data_with_gps, windowSize);
load('data_AI.mat', 'AI_result', 'AI_result_master')
data = AI_result;
time = data(:, 1);
line_ploter_split(time, movmean(data(:, 2:end),windowSize), t1, t2, colors, 'AI', 1) % 0 is master
% AI master
data = AI_result_master;
time = data(:, 1);
line_ploter_split(time, movmean(data(:, 2:end),windowSize), t1, t2, colors, 'AI', 0) % 0 is master
