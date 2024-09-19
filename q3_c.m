clc; clear; close all;

% Definir o vetor de tempo
timeIndex = 0:100;

% Criar o sinal de entrada
inputSignal = sin(2 * pi * timeIndex / 50) + sin(20 * pi * timeIndex / 50);

% Criar figura com subplots
figure;

% Plotar o sinal de entrada
subplot(3, 1, 1);
stem(timeIndex, inputSignal, 'filled');
title('Sinal de Entrada');
xlabel('n');
ylabel('Amplitude');

% Definir o vetor de tempo para o filtro e o sinal do filtro
filterTimeIndex = 0:9;
filterSignal = 0.1 * ones(1, 10);

% Plotar o sinal do filtro
subplot(3, 1, 2);
stem(filterTimeIndex, filterSignal, 'filled');
title('Sinal do Filtro');
xlabel('n');
ylabel('Amplitude');

% Realizar a convolução entre o sinal de entrada e o filtro
outputSignal = conv(inputSignal, filterSignal);

% Plotar o resultado da convolução
subplot(3, 1, 3);
stem(0:(length(outputSignal) - 1), outputSignal, 'filled');
title('Resultado da Convolução entre Sinal de Entrada e Filtro');
xlabel('n');
ylabel('Amplitude');

% Ajustar layout para melhor visualização
sgtitle('Análise do Sinal e Filtro'); % Título geral

