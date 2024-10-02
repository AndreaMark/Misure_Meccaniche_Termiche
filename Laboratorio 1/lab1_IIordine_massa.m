                                        %Strumento del secondo ordine con massa

close all
clear all
clc

                                        %% 1kg
% Metodo grafico, calcolo del decremento logaritmoco
%Ordine dei massimi, per un massimo dopo l'altro N = 1
prompt= input('1kg', "s");
N1 = input('Quale ordine di massimi scegli? [N1, N2]:');
y_max1 = input('Y_{max, 0}: Valore del massimo di ordine 0:');
y_maxi1 = input('Y_{max,N}: Valori dei massimi di ordine N individuati [Y_{max,1}, Y_{max,2}]:');
d1 = (1/N1)*log(y_max1/y_maxi1);

fprintf('Il decremento logaritmico è pari a %f \n', d1);

%Smorzamento
z1 = d1/sqrt(4*pi^2 + d1^2);

fprintf('Il coefficiente di smorzamento è pari a %f \n', z1);

%Periodo
T_01 = input('Inserisci il valore del priodo tra i due massimi che hai considerato:');

%Pulsazione propria 
w_01 = (2*pi)/T_01;

%Pulsazione naturale
w_n1 = (2*pi)/(T_01*(1-z1^2));

%Frequenza naturale 
f_n1 = w_n1/(2*pi);

                                                    %% 2kg
% Metodo grafico, calcolo del decremento logaritmoco
% Ordine dei massimi, per un massimo dopo l'altro N = 1
prompt= input('2kg', "s");
N2 = input('Quale ordine di massimi scegli? [N1, N2]:');
y_max2 = input('Y_{max, 0}: Valore del massimo di ordine 0:');
y_maxi2 = input('Y_{max,N}: Valori dei massimi di ordine N individuati [Y_{max,1}, Y_{max,2}]:');
d2 = (1/N2)*log(y_max2/y_maxi2);

fprintf('Il decremento logaritmico è pari a %f \n', d2);

%S morzamento
z2 = d2/sqrt(4*pi^2 + d2^2);

fprintf('Il coefficiente di smorzamento è pari a %f \n', z2);

% Periodo
T_02 = input('Inserisci il valore del priodo tra i due massimi che hai considerato:');

% Pulsazione propria 
w_02 = (2*pi)/T_02;

% Pulsazione naturale
w_n2 = (2*pi)/(T_02*(1-z2^2));

% Frequenza naturale 
f_n2 = w_n2/(2*pi);



%% Tabulazione 
Prove = [1;2]; D = [d1 d2]'; T_0 = [T_01 T_02]'; W_0 = [w_01 w_02]'; zeta = [z1 z2]'; omega_n = [w_n1 w_n2]'; effe_n = [f_n1 f_n2]';
T = table(Prove, D, T_0, W_0, zeta, omega_n, effe_n)
writetable(T, 'secondo ordine con massa.xlsx');







