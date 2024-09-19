clc; clear; close all;

function [outputSignal, outputTime] = customConvolution(inputSignal, impulseResponse, inputTime, impulseTime)
    % Calcula o novo intervalo de tempo para a convolução
    outputTimeMin = inputTime(1) + impulseTime(1);
    outputTimeMax = inputTime(end) + impulseTime(end);
    outputTime = outputTimeMin:outputTimeMax;

    % Realiza a convolução
    outputSignal = conv(inputSignal, impulseResponse);
end

% Teste da função de convolução personalizada
inputTime = -3:3;   % Índices de tempo para x
impulseTime = -1:4; % Índices de tempo para h
% Define os sinais
inputSignal = [3, 11, 7, 0, -1, 4, 2];
impulseResponse = [2, 3, 0, -5, 2, 1];

% Chama a função de convolução personalizada
[outputSignal, outputTime] = customConvolution(inputSignal, impulseResponse, inputTime, impulseTime);

% Plota o resultado
stem(outputTime, outputSignal, 'filled');
title('Convolução Personalizada com Índices de Tempo');
xlabel('Tempo');
ylabel('Amplitude');

