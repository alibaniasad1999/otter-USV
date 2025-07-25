% plot trajectory
load('trajectory_data.mat')
plot(rN,rE, 'Color', 'k', 'LineWidth',2)
xlabel('$p_{\mathrm{n}_{\mathbf{M}}}$', 'interpreter', 'latex', 'FontSize', 24);
ylabel('$p_{\mathrm{e}_{\mathbf{M}}}$', 'interpreter', 'latex', 'FontSize', 24);
set(gca, 'FontSize', 16, 'FontName', 'Times New Roman');
xlabel('$p_{\mathrm{n}_{\mathbf{M}}} (\mathrm{m})$', 'interpreter', 'latex', 'FontSize', 24);
ylabel('$p_{\mathrm{e}_{\mathbf{M}}} (\mathrm{m})$', 'interpreter', 'latex', 'FontSize', 24);
grid on;
axis tight
print('../../AI-aided-Transfer-alignment-Manuscript/Figure/trajectory', ...
            '-depsc', '-tiff', '-r300', '-vector');