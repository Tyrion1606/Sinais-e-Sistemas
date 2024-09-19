clc; clear all; close all;

% Transformada discreta do sinal
n = linspace(-50, 50, 500);
x = @(n) exp(-(0.1 * n).^2 / 2); % definição do sinal
x_values = x(n); % Extrair valores amostrados

% FFT do sinal original
Xw = fft(x_values);
Xw_centered = fftshift(Xw); % centralizar em torno de Ω=0
Omega_x = linspace(-pi, pi, length(x_values));

% Criar figura com subplots
figure;

% Sinal original
subplot(4, 3, 1);
plot(n, x_values);
xlabel('n');
ylabel('x(n)');
title('Sinal Original - x(n)');

% FFT do sinal original
subplot(4, 3, 2);
plot(Omega_x, abs(Xw));
xlabel('\Omega');
ylabel('|X(\Omega)|');
title('FFT do Sinal');

subplot(4, 3, 3);
plot(Omega_x, abs(Xw_centered));
xlabel('\Omega');
ylabel('|X(\Omega)|');
title('Magnitude da FFT com fftshift');

% Subamostragens
% x(2n)
y_2 = x(2 * n);
Yw_2 = fft(y_2);
Yw_2_centered = fftshift(Yw_2);
subplot(4, 3, 4);
plot(n, y_2);
xlabel('n');
ylabel('x(2n)');
title('x(2*n)');

subplot(4, 3, 5);
plot(Omega_x, abs(Yw_2));
xlabel('\Omega');
ylabel('|Y(\Omega)|');
title('FFT - x(2*n)');

subplot(4, 3, 6);
plot(Omega_x, abs(Yw_2_centered));
xlabel('\Omega');
ylabel('|Y(\Omega)|');
title('Centered FFT - x(2*n)');

% x(4n)
y_4 = x(4 * n);
Yw_4 = fft(y_4);
Yw_4_centered = fftshift(Yw_4);
subplot(4, 3, 7);
plot(n, y_4);
xlabel('n');
ylabel('x(4n)');
title('x(4*n)');

subplot(4, 3, 8);
plot(Omega_x, abs(Yw_4));
xlabel('\Omega');
ylabel('|Y(\Omega)|');
title('FFT - x(4*n)');

subplot(4, 3, 9);
plot(Omega_x, abs(Yw_4_centered));
xlabel('\Omega');
ylabel('|Y(\Omega)|');
title('Centered FFT - x(4*n)');

% x(5n)
y_5 = x(5 * n);
Yw_5 = fft(y_5);
Yw_5_centered = fftshift(Yw_5);
subplot(4, 3, 10);
plot(n, y_5);
xlabel('n');
ylabel('x(5n)');
title('x(5*n)');

subplot(4, 3, 11);
plot(Omega_x, abs(Yw_5));
xlabel('\Omega');
ylabel('|Y(\Omega)|');
title('FFT - x(5*n)');

subplot(4, 3, 12);
plot(Omega_x, abs(Yw_5_centered));
xlabel('\Omega');
ylabel('|Y(\Omega)|');
title('Centered FFT - x(5*n)');

% Ajustar layout para melhor visualização
sgtitle('Análise da Transformada de Fourier dos Sinais'); % Título geral

