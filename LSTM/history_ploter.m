% plot history
% Read data from CSV
data = readtable('history.csv');

% Extract training and validation losses
training_loss = data.loss;
validation_loss = data.val_loss;

% Number of epochs
epochs = 1:length(training_loss);

% Plotting
figure;
plot(epochs, training_loss, 'k-', 'LineWidth', 2); hold on;
plot(epochs, validation_loss, 'r--.', 'LineWidth', 2);
grid on

% % Add labels and title
% xlabel('Epoch');
% ylabel('Loss');
% title('Training and Validation Loss');


% Add grid
% grid on;
axis tight
% Save the figure as an image file
ylim([0, 8])

xlabel('Epoch', 'interpreter', 'latex', 'FontSize', 24);
ylabel('Loss', 'interpreter', 'latex', 'FontSize', 24);
set(gca, 'FontSize', 16, 'FontName', 'Times New Roman');
legend('Training Loss', 'Validation Loss', 'FontSize', 18)
xlabel('Epoch', 'interpreter', 'latex', 'FontSize', 24);
ylabel('Loss', 'interpreter', 'latex', 'FontSize', 24);

print('../../AI-aided-Transfer-alignment-Manuscript/Figure/loss', ...
            '-depsc', '-tiff', '-r300', '-vector');
