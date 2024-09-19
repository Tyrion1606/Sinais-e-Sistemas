clc; clear; close all;

% Definir o vetor de tempo
timeIndex = 0:100;
samplingFrequency = 256; % Frequência de amostragem em Hz
timeVector = 0:1/samplingFrequency:100; % Vetor de tempo

% Criar o sinal de entrada
inputSignal = sin(2 * pi * (1/50) * timeVector) + sin(20 * pi * (1/50) * timeVector); % Sinal composto

% Plotar o sinal de entrada
subplot(5, 1, 1);
plot(timeVector, inputSignal);
title('Sinal de Entrada');
xlabel('Tempo (s)');
ylabel('Amplitude');

% Definir o vetor de tempo para o filtro e o sinal do filtro
filterTimeIndex = 0:(10 * samplingFrequency) - 1;
filterSignal = 0.1 * ones(1, 10 * samplingFrequency);

% Plotar o sinal do filtro
subplot(5, 1, 2);
plot(filterTimeIndex, filterSignal);
title('Sinal do Filtro');
xlabel('Tempo (amostras)');
ylabel('Amplitude');

% Realizar a convolução entre o sinal de entrada e o filtro
convolvedSignal = conv(inputSignal, filterSignal);

% Plotar o resultado da convolução
subplot(5, 1, 3);
plot(0:1/samplingFrequency:(length(convolvedSignal) - 1) / samplingFrequency, convolvedSignal);
title('Resultado da Convolução entre Sinal de Entrada e Filtro');
xlabel('Tempo (s)');
ylabel('Amplitude');

%%%%%%%%%%%%%%%%%%%%%

% Aplicar FFT ao sinal de entrada
nInput = length(inputSignal);
fftInput = fft(inputSignal);
fftMagnitudeInput = abs(fftInput/nInput); % Magnitude da FFT
halfMagnitudeInput = fftMagnitudeInput(1:nInput/2 + 1); % Apenas a metade positiva do espectro
halfMagnitudeInput(2:end - 1) = 2 * halfMagnitudeInput(2:end - 1); % Ajustar magnitudes

frequencyVectorInput = samplingFrequency * (0:(nInput/2)) / nInput; % Vetor de frequências

% Plotar a FFT do sinal de entrada
subplot(5, 1, 4);
stem(frequencyVectorInput, halfMagnitudeInput);
title('Espectro de Frequência do Sinal de Entrada');
xlabel('Frequência (Hz)');
ylabel('Magnitude');
xlim([0 1 - 1/samplingFrequency]); % Limitar o eixo x até a metade da frequência de amostragem

%%%%%%%%%%%%%%%%%%%%%

% Aplicar FFT ao sinal convoluído
nConvolved = length(convolvedSignal);
fftConvolved = fft(convolvedSignal);
fftMagnitudeConvolved = abs(fftConvolved/nConvolved); % Magnitude da FFT
halfMagnitudeConvolved = fftMagnitudeConvolved(1:nConvolved/2 + 1); % Apenas a metade positiva do espectro
halfMagnitudeConvolved(2:end - 1) = 2 * halfMagnitudeConvolved(2:end - 1); % Ajustar magnitudes

frequencyVectorConvolved = samplingFrequency * (0:(nConvolved/2)) / nConvolved; % Vetor de frequências

% Plotar a FFT do sinal convoluído
subplot(5, 1, 5);
stem(frequencyVectorConvolved, halfMagnitudeConvolved);
title('Espectro de Frequência do Sinal Convoluído');
xlabel('Frequência (Hz)');
ylabel('Magnitude');
xlim([0 1 - 1/samplingFrequency]); % Limitar o eixo x até a metade da frequência de amostragem

