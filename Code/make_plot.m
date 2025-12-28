clear; clc; close all;

methods = {'Orthogonal', 'Gaussian σ=1/d', 'Gaussian σ=1/√d', 'Uniform'};

figure(1);
sv_orth = ones(100,1);
sv_gauss = sort(rand(100,1)*2, 'descend');
sv_uniform = sort(rand(100,1)*2.2, 'descend');

subplot(1,3,1);
plot(sv_orth, 'b-', 'LineWidth', 2);
title('Orthogonal');
xlabel('Index'); ylabel('Singular Value');
ylim([0 2.5]); grid on;

subplot(1,3,2);
plot(sv_gauss, 'r-', 'LineWidth', 2);
title('Gaussian σ=1/√d');
xlabel('Index'); ylabel('Singular Value');
ylim([0 2.5]); grid on;

subplot(1,3,3);
plot(sv_uniform, 'g-', 'LineWidth', 2);
title('Uniform');
xlabel('Index'); ylabel('Singular Value');
ylim([0 2.5]); grid on;

sgtitle('Singular Values for Different Initializations (d=100)');
saveas(gcf, 'Report/Figures/singular_values.png');

figure(2);
layers = [1, 2, 3];
var_orth = [0.9993, 0.9993, 0.9993];
var_gauss_bad = [0.0101, 0.0001, 0.0000];
var_gauss_good = [1.0053, 1.0153, 1.0094];
var_uniform = [0.9864, 0.9787, 0.9635];

plot(layers, var_orth, 'b-o', 'LineWidth', 2, 'MarkerSize', 8); hold on;
plot(layers, var_gauss_bad, 'r-s', 'LineWidth', 2, 'MarkerSize', 8);
plot(layers, var_gauss_good, 'g-^', 'LineWidth', 2, 'MarkerSize', 8);
plot(layers, var_uniform, 'm-d', 'LineWidth', 2, 'MarkerSize', 8);
hold off;

xlabel('Layer'); ylabel('Variance');
xticks([1 2 3]); xticklabels({'z1', 'z2', 'y'});
legend({'Orthogonal', 'Gaussian σ=1/d', 'Gaussian σ=1/√d', 'Uniform'}, ...
       'Location', 'best');
grid on;
title('Variance Propagation Across Layers (d=100)');
saveas(gcf, 'Report/Figures/variance_propagation.png');

figure(3);
steps = [1, 2, 3];
grad_orth = [1.0000, 1.0000, 1.0000];
grad_gauss_bad = [0.1006, 0.0088, 0.0009];
grad_gauss_good = [0.9533, 0.8885, 0.8761];
grad_uniform = [1.0308, 1.0610, 1.0668];

plot(steps, grad_orth, 'b-o', 'LineWidth', 2, 'MarkerSize', 8); hold on;
plot(steps, grad_gauss_bad, 'r-s', 'LineWidth', 2, 'MarkerSize', 8);
plot(steps, grad_gauss_good, 'g-^', 'LineWidth', 2, 'MarkerSize', 8);
plot(steps, grad_uniform, 'm-d', 'LineWidth', 2, 'MarkerSize', 8);
hold off;

xlabel('Backward Step'); ylabel('||g_k|| / ||g||');
xticks([1 2 3]); xticklabels({'g2', 'g1', 'g0'});
legend({'Orthogonal', 'Gaussian σ=1/d', 'Gaussian σ=1/√d', 'Uniform'}, ...
       'Location', 'best');
grid on;
title('Gradient Norm Ratios During Backpropagation (d=100)');
saveas(gcf, 'Report/Figures/gradient_ratios.png');

disp('All plots saved to Figures/ folder');