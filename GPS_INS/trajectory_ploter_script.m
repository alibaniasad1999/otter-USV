%% plot trajectory for paper %%


set(gca, 'FontSize', 16)
plot(rN,rE, 'r', 'linewidth', 2);
hold on;
plot(rN2,rE2, '--k', 'linewidth', 2);
hold off;
legend('with GPS', 'without GPS', 'Location','southeast', 'FontSize', 20);
axis([0 20 -20 20])
set(gca, 'FontSize', 16, 'FontName', 'Times New Roman');

xlabel('$p_{\mathrm{n}_{\mathbf{M}}}$', 'interpreter', 'latex', 'FontSize', 24);
ylabel('$p_{\mathrm{e}_{\mathbf{M}}}$', 'interpreter', 'latex', 'FontSize', 24);

ylim([1.105e6, 1.1058e6]);
xlim([0, 3000]);
print('../../AI-aided-Transfer-alignment-Manuscript/Figure/AI-results/trajectory','-depsc');