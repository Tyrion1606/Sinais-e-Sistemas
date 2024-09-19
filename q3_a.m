clc; clear; close all;

% Sinais definidos
signalX = [3, 11, 7, 0, -1, 4, 2];
signalH = [2, 3, 0, -5, 2, 1];

% Realiza a convolução de signalA e signalB
convXH = conv(signalX, signalH);

% Realiza a convolução de signalB e signalA (inversa)
convHX = conv(signalH, signalX);

% Cria os gráficos dos resultados
figure;
subplot(2, 1, 1);
stem(convXH, 'filled');
title('Convolução de signalX * signalH');
xlabel('Amostras');
ylabel('Amplitude');

subplot(2, 1, 2);
stem(convHX, 'filled');
title('Convolução de signalH * signalX');
xlabel('Amostras');
ylabel('Amplitude');

