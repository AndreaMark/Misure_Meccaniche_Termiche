clear all
close all
clc
format long

tic
%% Dati
G = [0.16 2.4 2.9 3.1]; % Guadagno
f = [71 2080 5000 11110]; % Hz Frequenza
x = f; y = G;

%% Grafico dati
figure 
plot(x,y, '-o')
grid minor
ylabel('Guadagno')
xlabel('Frequenza [Hz]')
title('Grafico Guadagno/Frequenza')  
% Esportazione 
ax = gca;
exportgraphics(ax,'Gf_nonlog.pdf','Resolution',300)

%% Grafico semilogaritmico 
figure 
semilogx(x,y, '-o')
grid minor
ylabel('Guadagno')
xlabel('Frequenza [Hz]')
title('Grafico Guadagno/Frequenza semilogaritmico')  
% Esportazione 
ax = gca;
exportgraphics(ax,'Gf_semilog.pdf','Resolution',300)


%% Individuazione della frequenza di taglio
xdb = [71 11110]; ydb = [2.19 2.19];

figure 
plot(x,y, '-o')
hold on
plot(xdb,ydb)
hold off 
grid minor
ylabel('Guadagno')
xlabel('Frequenza [Hz]')
title('Grafico Guadagno/Frequenza')  
% Esportazione 
ax = gca;
exportgraphics(ax,'Gf_deamp.pdf','Resolution',300)


%% Intersezione 
retta_db = polyfit(xdb, ydb,1);
retta_necessaria = polyfit([71 2080], [0.16 2.4], 1);

x_inter = fzero(@(x) polyval(retta_db-retta_necessaria,x),10e3);
y_inter = polyval(retta_db,x_inter);

figure 
plot(x,y, '-o')
hold on
plot(xdb,ydb)
plot(x_inter,y_inter,'r*')
hold off 
grid minor
ylabel('Guadagno')
xlabel('Frequenza [Hz]')
title('Grafico Guadagno/Frequenza')  
% Esportazione 
ax = gca;
exportgraphics(ax,'Gf_ft.pdf','Resolution',300)

toc