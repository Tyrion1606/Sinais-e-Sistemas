% Exemplo de sinal
fs = 1000; % Frequência de amostragem em Hz
t = 0:1/fs:1-1/fs; % Vetor de tempo
f1 = 50; % Frequência do sinal em Hz
f2 = 150; % Frequência do sinal em Hz
x = sin(2*pi*f1*t) + 0.5*sin(2*pi*f2*t); % Sinal composto

% Aplicar FFT
n = length(x);
Y = fft(x);
P2 = abs(Y/n); % Magnitude da FFT
P1 = P2(1:n/2+1); % Apenas a metade positiva do espectro
P1(2:end-1) = 2*P1(2:end-1); % Ajustar magnitudes

f = fs*(0:(n/2))/n; % Vetor de frequências

% Encontrar a frequência dominante
[~, idx] = max(P1); % Índice da máxima magnitude
dominant_freq = f(idx); % Frequência correspondente

% Mostrar o resultado
disp(['Frequência dominante: ', num2str(dominant_freq), ' Hz']);

