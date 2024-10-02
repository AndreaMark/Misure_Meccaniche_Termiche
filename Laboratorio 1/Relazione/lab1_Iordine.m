



                                        % Strumento del primo ordine 
                                    % CONTROLLA CHE TIPO DI ESPONENZIALE HAI
                                                %ALLE RIGHE 55-49

close all
clear all
clc
format loose
format short

                                             %% METODO GRAFICO
V = input('Inserisci tra [] i valori che hai trovato:');

%La media di tali valori è
tau_gr = mean(V);

fprintf('La media di tali valori è: %3.1f \n', tau_gr);

%La somma degli scarti al quadrato è:
z_gr = sum((V-tau_gr).^2);

%La deviazione standard è: 
d_gr = sqrt(z_gr/(length(V)-1));
fprintf('La deviazione standard  di tali valori è: %3.1f \n', d_gr);

%Solitamente alpha = 0.05, t sceglilo dalla tabella in funzione dei tuoi
%gradi di libertà:
t_gr = input('Cerca in tabella e inserisci il t del livello di signficatività che vuoi:'); 

%L'incertezza è:
e_gr = t_gr*(d_gr/sqrt(length(V)));
fprintf('L''incertezza associata a tali valori è: \xB1 %3.1f \n', e_gr);

%Riultato finale col metodo grafico è...
fprintf('Il riultato finale col metodo grafico è: %3.1f \xB1 %3.1f \n', tau_gr, e_gr);



                                              %% METODO ANALITICO
% Valore iniziale/massimo: 
y_0 = input('Fornisci il valore di y_{0}:');

% Coppia di valori letti sul grafico:
t_sg  = input('Fornisci tra [] i valori di t^{*}:');
y_sg = input('Fornisci tra [] i valori di y^{*}:');

% Valori delle costanti di tempo calcolate dalle coppie di valori
% considerate:

% Esponenziale crescente 
% tau_i = -t_sg./(log((y_0-y_sg)./y_0));

% Esponenziale decrescente
tau_i = -t_sg./(log(y_sg./y_0));

disp(tau_i')

% Calcolo della media:
tau = mean(tau_i);
fprintf('La media di tali valori è: %3.1f \n', tau);

% Somma degli scarti al quadrato:
z_an = sum((tau_i-tau).^2);

% Deviazione standard:
d_an = sqrt(z_an/(length(tau_i)-1));
fprintf('La deviazione standard di tali valori è: %3.1f \n', d_an);

%S ignificatività:
t_an = input('Cerca in tabella e inserisci il t del livello di signficatività che vuoi:');

% Incertezza:
e_an = t_an*(d_an/sqrt(length(tau_i)));
fprintf('L''incertezza associata a tali valori è: \xB1 %3.1f \n', e_an);

% Riultato finale col metodo analitico è...
fprintf('Il riultato finale col metodo analitico è: %3.1f \xB1 %3.1f \n', tau, e_an);

%% Tabulazione termocoppia
V(7) = tau_gr;
V(8) = e_gr;
tau_i(7) = tau;
tau_i(8) = e_an;

M = 'Media'; I = 'Incertezza'; 
Prove = [1; 2; 3; 4; 5; 6; 7; 8]; Procedimento1 = V'; Procedimento2 = tau_i';
% t = table(Prove, Procedimento1, Procedimento2) 
% writetable(t,'Termocoppia 100 - 0.xlsx');


%% Tabulazione termistore 
V(7) = tau_gr;
V(8) = e_gr;
Prove = [1; 2; 3; 4; 5; 6; 7; 8]; Procedimento1 = V';
% t = table(Prove, Procedimento1) 
% writetable(t,'Termistore 0-100 involucro.xlsx');



