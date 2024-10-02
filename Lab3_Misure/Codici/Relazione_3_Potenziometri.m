clear all
close all
clc

tic

%% Dati 
RP_500 = 500e3; %ohm Resistenza nominale 
RP_10 = 10e3; %ohm Resistenza nominale 
EI = 5.07; %V Tensione di Alimentazione

% Lunghezze nominali di potenziometri cm
L_500 = 4; 
L_10 = 12;

% Tensione misurata col Primo potenziometro V
E0_500_dig = [0 0 0.74774 1.6700 2.5157 3.5952 4.6038 5.0113 5.0700]; % Multimetro digitale
E0_500_an = [0 0 0 0 0 0 1.8 5.4 5.6]; % Multimetro analogico
x_500 = [0 1 1.5 2 2.5 3 3.5 3.8 4]; % Posizioni assunte dal potenziometro

% Tensione misurata col secondo potenziometro V
E0_10_dig = [0 0 0.7178 1.2258 1.7680 2.3454 2.6719 3.3141 3.9265 4.9518 5.0692]; % Multimetro digitale
E0_10_an = [0 0.7 1.4 1.9 2.4 2.9 3.2 3.8 4.3 5.3 5.7]; % Multimetro analogico
x_10 = [0 2 3 4 5 6 6.8 8 9 11 11.8]; % Posizioni assunte dal potenziometro

%% Valori da plottare ANALOGICI
y_10_plt = E0_10_an./EI;  
y_500_plt = E0_500_an./EI;
x_10_plt = x_10./L_10;
x_500_plt = x_500./L_500;

% Visualizzazione risultati
% 10 kohm
figure 
plot(x_10_plt,y_10_plt,'LineWidth', 2)
grid on
ylabel('E_0/E_I')
xlabel('R/R_p')
title('Potenziometro lineare da 10 k\Omega')  
subtitle('Multimetro analogico')
% Esportazione 
ax = gca;
exportgraphics(ax,'10kohm_anal.pdf','Resolution',300)

% 500 kohm    
figure 
plot(x_500_plt,y_500_plt,'LineWidth', 2)
grid on
ylabel('E_0/E_I')
xlabel('R/R_p')
title('Potenziometro lineare da 500 k\Omega') 
subtitle('Multimetro analogico')
% Esportazione 
ax = gca;
exportgraphics(ax,'500kohm_anal.pdf','Resolution',300)

toc