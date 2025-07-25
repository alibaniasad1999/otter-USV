function line_ploter_split(time, data, t1, t2, ~, name, MS)
title_array = ["North position error", "East position error", ...
    "Down position error", "North velocity error", "East velocity error", ...
    "Down velocity error", "Attitude error about North", "Attitude error about East", ...
    "Heading error"];
y_array_m = ["$\delta\hat{p}_{n_\mathbf{M}}{(\mathrm{m})}$", "$\delta\hat{p}_{e_\mathbf{M}}{(\mathrm{m})}$", ...
    "$\delta\hat{h}_{\mathbf{M}}{(\mathrm{m})}$", "$\delta\hat{v}_{n_\mathbf{M}}{(\mathrm{m}/\sec)}$", "$\delta\hat{v}_{e_\mathbf{M}}{(\mathrm{m}/\sec)}$", ...
    "$\delta\hat{v}_{d_\mathbf{M}}{(\mathrm{m}/\sec)}$", "${\delta\hat{{\phi}}_{\mathbf{M}}}{(\mathrm{deg})}$", "${\delta\hat{{\theta}}_{\mathbf{M}}}{(\mathrm{deg})}$", ...
    "${\delta\hat{{\psi}}_{\mathbf{M}}}{(\mathrm{deg})}$"];
y_array_s = ["$\delta\hat{p}_{n_\mathbf{S}}{(\mathrm{m})}$", "$\delta\hat{p}_{e_\mathbf{S}}{(\mathrm{m})}$", ...
    "$\delta\hat{h}_{\mathbf{S}}{(\mathrm{m})}$", "$\delta\hat{v}_{n_\mathbf{S}}{(\mathrm{m}/\sec)}$", "$\delta\hat{v}_{e_\mathbf{S}}{(\mathrm{m}/\sec)}$", ...
    "$\delta\hat{v}_{d_\mathbf{S}}{(\mathrm{m}/\sec)}$", "${\delta\hat{{\phi}}_{\mathbf{S}}}{(\mathrm{deg})}$", "${\delta\hat{{\theta}}_{\mathbf{S}}}{(\mathrm{deg})}$", ...
    "${\delta\hat{{\psi}}_{\mathbf{S}}}{(\mathrm{deg})}$"];
data(:, 3) = data(:, 3)*(-1);
for j = 1:length(data)
    if j > 9
        break;
    end
    set(gca, 'FontSize', 16)
for i = 1:length(t1)
     
    if i == 1
        index_start = 1;
    else
        index_start = find(time == t2(i-1));
    end

    if i == length(t1)
        index_end = length(time);
    else
        index_end = find(time == t1(i+1));
    end
    index_1 = find(time == t1(i));
    index_2 = find(time == t2(i));
    if ~isnan(data(index_start, j))
        skip = 5000;  
        x = time(index_start:index_1);
        y = data(index_start:index_1, j);
        % p = plot(x, y, '-', 'Color', 'k', 'LineWidth', 1.2); hold on;
     %    p = plot(x(1:skip:length(x)), y(1:skip:length(y)), '-', 'Color', 'k', 'LineWidth', 1.2, "Marker", 's', ...
     % 'MarkerSize', 8, 'MarkerFaceColor', 'k', 'MarkerEdgeColor', 'k');
        % plot(time(index_start:index_1), data(index_start:index_1, j), 'Color', 'k'...
        %     , 'Marker', '^');
        p = plot(x, y, '-', 'Color', 'k', 'LineWidth', 1.2);          % full curve
p.Marker          = 's';                                      % square
p.MarkerIndices   = 1:skip:numel(x);                          % every skip-th sample
p.MarkerSize      = 8;
p.MarkerFaceColor = 'k';
p.MarkerEdgeColor = 'k';
    end
    
    hold on
    if ~isnan(data(index_1+1, j))
        % plot(time(index_1+1:index_2), data(index_1+1:index_2, j), 'Color', 'r',...
        %     'Marker', 'square');
        if isempty(name)
                skip = 1000;                % show a marker every 10th sample
        else
            skip = 5000; 
        end
        if std(data(index_1+1:index_2, j)) < 10
            skip = 10000; 
        end
        if std(data(index_1+1:index_2, j)) < 0.1
            skip = 10000; 
        end

x = time(index_1+1:index_2);
y = data(index_1+1:index_2, j);
p = plot(x, y, '--', 'Color', 'r', 'LineWidth', 1.2); hold on;
    % plot(x(1:skip:length(x)), y(1:skip:length(y)), '-', 'Color', 'r', 'LineWidth', 1.2, "Marker", '^', ...
    %  'MarkerSize', 8, 'MarkerFaceColor', 'r', 'MarkerEdgeColor', 'r');
    % p = plot(x, y, '-', 'Color', 'k', 'LineWidth', 1.2);          % full curve
p.Marker          = '^';                                      % square
p.MarkerIndices   = 1+1:skip:numel(x);                          % every skip-th sample
p.MarkerSize      = 8;
p.MarkerFaceColor = 'r';
p.MarkerEdgeColor = 'r';
    end
    
    if ~isempty(name) || ( ...
        ~isnan(data(index_2+1, j)) && max(data(index_2+1:index_end, j)) < 10* max(data(1:index_1, j)) && j~= 8 ... % gand bozor)
        )
        skip = 5000;  
        x = time(index_2+1:index_end);
        y = data(index_2+1:index_end, j);
        plot(x, y, '-', 'Color', 'k', 'LineWidth', 1.2); hold on;
     %    plot(x(1:skip:length(x)), y(1:skip:length(y)), '-', 'Color', 'k', 'LineWidth', 1.2, "Marker", 's', ...
     % 'MarkerSize', 8, 'MarkerFaceColor', 'k', 'MarkerEdgeColor', 'k');
        % plot(time(index_2+1:index_end), data(index_2+1:index_end, j)...
        %     , 'Color', 'k', 'LineWidth',2);
        p = plot(x, y, '-', 'Color', 'k', 'LineWidth', 1.2);          % full curve
p.Marker          = 's';                                      % square
p.MarkerIndices   = 1+1:skip:numel(x);                          % every skip-th sample
p.MarkerSize      = 8;
p.MarkerFaceColor = 'k';
p.MarkerEdgeColor = 'k';
    end
end
    
    ymin = min(data(1:length(data)/2, j));
    ymax = max(data(1:length(data)/2, j));
    
    if isempty(name)
        range = 2 * (ymax - ymin);
        ylim([ymin - range, ymax + range]);
        xlim([time(1), time(end)+1]);
    else
        ymin_ = min(data(:, j));
        ymax_ = max(data(:, j));
        % if ymax_ > 0
            ylim([ymin_, ymax_+(ymax_-ymin_)*.2]);
        % else
            ylim([ymin_, ymax_+(ymax_-ymin_)*.2]);
        % end
    end


    
    
    set(gca, 'FontSize', 16, 'FontName', 'Times New Roman');
    set(gca,'XMinorTick','on','YMinorTick','on')
    if isempty(name)
                legend('Solid black line: Conventional method with GPS', 'Dashed red line: Conventional method without GPS', 'FontSize', 18, 'location', 'best')
    else
                legend('Solid black line: Conventional method with GPS', 'Dashed red line: Proposed NN method without GPS', 'FontSize', 18, 'location', 'best')

    end
    xlabel('time(sec)', 'interpreter', 'latex', 'FontSize', 24);
    grid on;








    if MS == 0
        ylabel(y_array_m(j), 'interpreter', 'latex', 'FontSize', 26);
        print(append('../../AI-aided-Transfer-alignment-Manuscript/Figure/AI-results/Master/'...
            ,title_array(j), name), '-depsc', '-tiff', '-r300', '-vector');
    else
        ylabel(y_array_s(j), 'interpreter', 'latex', 'FontSize', 26);
        print(append('../../AI-aided-Transfer-alignment-Manuscript/Figure/AI-results/Slave/'...
            ,title_array(j), name), '-depsc', '-tiff', '-r300', '-vector');
    end
    close;
end
