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

%% Stima del fattore di carico massimo dovto all'utilizzo del multimetro analogico
    % Potenziometro 500KOhm
 ETA_500_max = 1 - 2*(E0_500_an(4)/EI)

    % Potenziometro 10KOhm
 ETA_10_max = 1 - 2*(E0_10_an(6)/EI)

%% Stima delle resistenze degli strumenti terminali dal fattore di carico,
    
ETA_500_an =ETA_500_max;
Rs_an = (RP_500/ETA_500_an - RP_500)/4

ETA_10_an = ETA_10_max;
Rs_10_an = (RP_10/ETA_10_an - RP_10)/4

ETA_500_dig =  1 - 2*(E0_500_dig(4)/EI)
Rs_dig = (RP_500/ETA_500_dig - RP_500)/4

%% Curve dell'effetto di carico per potenziometro da 500 kohm
ETA_an_plt = (x_500_plt - x_500_plt.^2)./((Rs_an/RP_500) + x_500_plt - x_500_plt.^2);
ETA_dig_plt = (x_500_plt - x_500_plt.^2)./((Rs_dig/RP_500) + x_500_plt - x_500_plt.^2);

y_1 = ETA_an_plt; y_2 = ETA_dig_plt; 

figure
p1 = plot(x_500_plt,y_1, "b");
hold on
plot([0 1], [1 1], "b")
hold on
plot([0 0], [0 1], "b")
hold on
plot([1 1], [0 1], "b")
hold on
p2 = plot(x_500_plt,y_2, "r");
hold on
plot([-0.1 0.5], [0.3412 0.3412], "-- k")
grid on
ylabel('\eta')
xlabel('R/R_p')
title('Fattore non lineare')
subtitle('Potenziometro da 500 k\Omega')
legend([p1 p2],{'Multimetro analogico', 'Multimetro digitale'})
legend boxoff
ylim([0,1.2])
xlim([-0.1,1.1])
yticks([0 0.2 0.3412 0.4 0.6 0.8 1])
% Esportazione 
ax = gca;
exportgraphics(ax,'effetto_carico.pdf','Resolution',300)

toc