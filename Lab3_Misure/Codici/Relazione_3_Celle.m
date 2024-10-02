clear all
close all
clc
format short

tic

%% Dati
M = [1 2 3 5]; % kg Masse
O = 3.76; % V Offset
V = [4.56 5.36 6.08 7.68]-O; % V Tensioni misurate
A = 10; % V Alimentazione
n = length(V);
g = 9.80294;
% Conversione da kg in N
F = M.*g;

%% a - Grafico dati
x = F, y = V,
figure 
scatter(x,y)
grid on
ylabel('Tensione [V]')
xlabel('Forza peso [N]')
title('Marcatore dati')  
ax = gca;
ax.XAxisLocation = 'origin';
ax.YAxisLocation = 'origin';
% Esportazione 
%exportgraphics(ax,'dati.pdf','Resolution',300)

%% Calcolo Parametri
X_m = mean(x), Y_m = mean(y), 

cod_x = sum((x - X_m).*(y-Y_m)); dev_x = sum((x-X_m).^2); 

b = cod_x/dev_x % b = V/N

a = Y_m - b*X_m

%% b - Retta di regressione
f = @(x)[b*x + a];
figure
scatter(x, y)
hold on
fplot(f, 'r')
grid on
ylabel('Tensione [V]')
xlabel('Forza peso [N]')
title('Retta di regressione')
ax = gca;
ax.XAxisLocation = 'origin';
ax.YAxisLocation = 'origin';
% Esportazione
%exportgraphics(ax,'retta_regressione.pdf','Resolution',300)

y_stim = b.*x + a

%% c - Studio della linearità  
h1 = y - y_stim;
h2 = h1.^2;
h = sum(h2);
Se_quadro= h/(n-2)

f1 = x - X_m
f2 = f1.^2;
f3 = sum(f2)
Sb = sqrt(Se_quadro/f3)

t_gdl_misurato = b/Sb

%% e - Incertezza relativa alla taratura
% u_interpolazione lineare
u_interp = sqrt(h/((b^2)*(n-2)))

% u_multimetro
u_multimetro = 0.01/((2*sqrt(3)))

% u_misurando (F, x)
% Per il calcolo dell'incertezza standard sul misurando uso i valori a cui è
% associata una maggiore variabilità
toll = 250; %mg è una tolleranza 'a', non è necessario dividerla per due
u_massa = (toll/(2*sqrt(3)))*1e-6 % Per 5kg
ug = 0.00001/((2*sqrt(3))) % Incertezza sull'ultima cifra, distribuzione rettangolare
m = 5; 
u_misurando = sqrt(g^2*u_massa^2 + m^2*ug^2)

u_tar = sqrt(u_interp^2 + u_multimetro^2 + u_misurando^2)

U_tar = 4.303*u_tar


%% f - g - Sensibilità nominale e relativa incertezza
% b = mV/N
FS = max(x); G = 200;
Sn = (b*1e3*FS)/(A*G)

dSndFS = b*1e3/(A*G), uFS = u_misurando,
dSndA = -(b*1e3*FS)/(A^2*G), uA =0.1/((2*sqrt(3))), 
dSndG = -(b*1e3*FS)/(A*G^2), uG = 0.2/2,

uSn = sqrt(dSndFS^2*uFS^2 + dSndA^2*uA^2 + dSndG^2*uG^2)

Usn = 4.303*uSn

toc