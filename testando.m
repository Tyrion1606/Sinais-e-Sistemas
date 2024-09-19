clc; clear all; close all;

% sinal original
fs = 256; % Frequência de amostragem em Hz
t = 0:1/fs:100; % Vetor de tempo
x = sin(2*pi*(1/50)*t) + sin(20*pi*(1/50)*t); % Sinal composto

% Plotar o sinal original
subplot(4,1,1); % Dividir a janela de gráficos em 2 linhas e 1 coluna, e selecionar o primeiro gráfico
plot(t, x);
title('Sinal Original');
xlabel('Tempo (s)');
ylabel('Amplitude');

% Aplicar FFT
n = length(x);
Y = fft(x);
P2 = abs(Y/n); % Magnitude da FFT
P1 = P2(1:n/2+1); % Apenas a metade positiva do espectro
P1(2:end-1) = 2*P1(2:end-1); % Ajustar magnitudes

f = fs*(0:(n/2))/n; % Vetor de frequências

% Plotar a FFT
subplot(4,1,2); % Selecionar o segundo gráfico
plot(f, P1);
title('Espectro de Frequência');
xlabel('Frequência (Hz)');
ylabel('Magnitude');
xlim([0 1-1/fs]); % Limitar o eixo x até a metade da frequência de amostragem

% Criação do filtro h2
h2 = 0.1 * ones(1, 10);  % Filtro de média móvel de 10 pontos
% Convolução entre o sinal x e o filtro h2
Convolucao = conv(x, h2);
% Calcular a FFT do sinal convoluído
fy = fft(Convolucao);
fy_mag = fy(1:n/2+1); % Pegando apenas a metade positiva do espectro

% Plotar o resultado da convolução
subplot(4,1,3); % Selecionar o segundo gráfico;
plot(0:(length(Convolucao)-1), Convolucao);
title('Convolução de x e h2');
xlabel('n');
ylabel('Amplitude');


% Plotar o espectro de magnitude para as frequências positivas
subplot(4,1,4);
plot(f, fy_mag);
xlabel('Frequência (Hz)');
ylabel('Magnitude');
title('Espectro de Frequências (Metade Positiva)');
grid on;

% Ajustar layout
sgtitle('Análise de Sinal e Frequência');

