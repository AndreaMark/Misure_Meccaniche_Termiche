

                    %Strumento del secondo ordine - evoluzioni libere


close all
clear all
clc

%% PRIMA EVOLUZIONE LIBERA
%Metodo grafico, calcolo del decremento logaritmoco

%Ordine dei massimi, per un massimo dopo l'altro N = 1
prompt = input('PRIMA EVOLUZIONE LIBERA, premi INVIO per procedere...', "s"); %Stringa
N1 = input('Quale ordine di massimi scegli? [N1, N2]:');
y_max1= input('Y_{max, 0}: Valore del massimo di ordine 0:');
y_maxi1 = input('Y_{max,N}: Valori dei massimi di ordine N individuati [Y_{max,1}, Y_{max,2}]:'); 
d1 = (1./N1).*log(y_max1./y_maxi1);

fprintf('Il decremento logaritmico è pari a %f \n', d1);

%Smorzamento
z1 = d1./sqrt(4*pi^2 + d1.^2);

fprintf('I coefficienti di smorzamento sono: %f \n', z1);

%Periodo
T_01 = input('Inserisci i valori dei periodi tra i massimi che hai considerato [T1,T2]:');

%Pulsazione propria 
w_01 = (2*pi)./T_01;

%Pulsazione naturale
w_n1 = (2*pi)./(T_01.*(1-d1.^2));

%Frequenza naturale 
f_n1 = w_n1./(2*pi);

%% SECONDA EVOLUZIONE LIBERA
%Metodo grafico, calcolo del decremento logaritmoco

%Ordine dei massimi, per un massimo dopo l'altro N = 1
prompt = input('SECONDA EVOLUZIONE LIBERA, premi INVIO per procedere...', "s");
N2 = input('Quale ordine di massimi scegli? [N1, N2]:');
y_max2= input('Y_{max, 0}: Valore del massimo di ordine 0:');
y_maxi2 = input('Y_{max,N}: Valori dei massimi di ordine N individuati [Y_{max,1}, Y_{max,2}]:'); 
d2 = (1./N2).*log(y_max2./y_maxi2);

fprintf('Il decremento logaritmico è pari a %f \n', d2);

%Smorzamento
z2 = d2./sqrt(4*pi^2 + d2.^2);

fprintf('I coefficienti di smorzamento sono: %f \n', z2);

%Periodo
T_02 = input('Inserisci i valori dei periodi tra i massimi che hai considerato [T1,T2]:');

%Pulsazione propria 
w_02 = (2*pi)./T_02;

%Pulsazione naturale
w_n2 = (2*pi)./(T_02.*(1-d2.^2));

%Frequenza naturale 
f_n2 = w_n2./(2*pi);


%% TERZA EVOLUZIONE LIBERA
%Metodo grafico, calcolo del decremento logaritmoco

%Ordine dei massimi, per un massimo dopo l'altro N = 1
prompt = input('TERZA EVOLUZIONE LIBERA, premi INVIO per procedere...', "s");
N3 = input('Quale ordine di massimi scegli? [N1, N2]:');
y_max3= input('Y_{max, 0}: Valore del massimo di ordine 0:');
y_maxi3 = input('Y_{max,N}: Valori dei massimi di ordine N individuati [Y_{max,1}, Y_{max,2}]:'); 
d3 = (1./N3).*log(y_max3./y_maxi3);

fprintf('Il decremento logaritmico è pari a %f \n', d3);

%Smorzamento
z3 = d3./sqrt(4*pi^2 + d3.^2);

fprintf('I coefficienti di smorzamento sono: %f \n', z3);

%Periodo
T_03 = input('Inserisci i valori dei periodi tra i massimi che hai considerato [T1,T2]:');

%Pulsazione propria 
w_03 = (2*pi)./T_03;

%Pulsazione naturale
w_n3 = (2*pi)./(T_03.*(1-d3.^2));

%Frequenza naturale 
f_n3 = w_n3./(2*pi);



%% Medie ed errori cumulativi 
Z = [z1 z2 z3];
F_n = [f_n1 f_n2 f_n3];
W_n = [w_n1 w_n2 w_n3];

Z_m = mean(Z); F_nm = mean(F_n); W_nm = mean(W_n);

%Deviazioni standard
S_Z = std(Z); S_Wn = std(W_n); S_Fn = std(F_n);

%Errori
t_fin = input('Scegli il t che meglio rappresenta l''incertezza dei tuoi dati:');

E_Z = t_fin*(S_Z/sqrt(length(Z_m)));
E_Wn = t_fin*(S_Wn/sqrt(length(W_n)));
E_Fn = t_fin*(S_Fn/sqrt(length(F_n)));

%Tabulazione 

Prove1 = [1; 2; 3; 4; 5; 6]; D = [d1 d2 d3]'; T_0 = [T_01 T_02 T_03]'; W_0 = [w_01 w_02 w_03]'; 
Prove2 = [1; 2; 3; 4; 5; 6; 7; 8]; 

Z(7) = Z_m; Z(8) = E_Z; 
F_n(7) = F_nm; F_n(8) = E_Fn;
W_n(7) = W_nm; W_n(8) = E_Wn;

T1 = table(Prove1, D, T_0, W_0)

%writetable(T1, 'secondo ordine libere senza errori.xlsx');

zeta = Z'; omega_n = W_n'; effe_n = F_n';

T2 = table(Prove2, zeta, omega_n, effe_n)

%writetable(T2, 'secondo ordine libere con errori.xlsx');





