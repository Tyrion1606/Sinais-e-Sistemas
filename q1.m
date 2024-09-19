pkg load communications;
clc; clear all; close all;

% Sinal original
load('signal.mat');
signal = signal(1:1500);

% Criar figura com subplots
figure;

% Sinal ECG Original
subplot(4, 2, 1);
plot(signal);
title('Sinal ECG Original');
xlabel('Tempo');
ylabel('Amplitude');

% Sinal com ruído
subplot(4, 2, 2);
y = awgn(signal, 12, 'measured');
plot(y);
title('Sinal ECG com Ruído Branco Aditivo Gaussiano (SNR=12 dB)');
xlabel('Tempo');
ylabel('Amplitude');

% Filtro média móvel 2 amostras
subplot(4, 2, 3);
filtro_2 = ones(1, 2) / 2;
sinal_filtrado_2 = conv(signal, filtro_2, 'same');
plot(sinal_filtrado_2);
title('Sinal Filtrado com Filtro de 2 Amostras');
xlabel('Tempo');
ylabel('Amplitude');

% Filtro média móvel 5 amostras
subplot(4, 2, 4);
filtro_5 = ones(1, 5) / 5;
sinal_filtrado_5 = conv(signal, filtro_5, 'same');
plot(sinal_filtrado_5);
title('Sinal Filtrado com Filtro de 5 Amostras');
xlabel('Tempo');
ylabel('Amplitude');

% Magnitude do Filtro de 2 Amostras
[H_2, W_2] = freqz(filtro_2, 1, 512);
subplot(4, 2, 5);
plot(W_2, abs(H_2));
title('Magnitude do Filtro de 2 Amostras');
xlabel('Frequência Normalizada');
ylabel('Magnitude');

% Fase do Filtro de 2 Amostras
subplot(4, 2, 6);
plot(W_2, angle(H_2));
title('Fase do Filtro de 2 Amostras');
xlabel('Frequência Normalizada');
ylabel('Fase (radianos)');

% Magnitude do Filtro de 5 Amostras
[H_5, W_5] = freqz(filtro_5, 1, 512);
subplot(4, 2, 7);
plot(W_5, abs(H_5));
title('Magnitude do Filtro de 5 Amostras');
xlabel('Frequência Normalizada');
ylabel('Magnitude');

% Fase do Filtro de 5 Amostras
subplot(4, 2, 8);
plot(W_5, angle(H_5));
title('Fase do Filtro de 5 Amostras');
xlabel('Frequência Normalizada');
ylabel('Fase (radianos)');

% Ajustar layout para melhor visualização
sgtitle('Análise do Sinal ECG'); % Título geral

