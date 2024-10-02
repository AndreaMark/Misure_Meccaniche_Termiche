clear all
close all
clc
format short

tic
%% Dati
f = [71 2080 5000 11110]; % Hz Frequenza
R = 1e3;
C = 1e-7;


% Calcolo del guadagno a partire dalla frequenza
G0 = 2;
omega = 2*pi.*f
wRC = omega*R*C;
den = sqrt(1+(wRC).^2);
G = G0*(wRC./den)
x = f; y = G;

%% Grafico dati
figure 
scatter(x,y)
hold on
plot(x,y)
grid minor
ylabel('Guadagno')
xlabel('Frequenza [Hz]')
title('Grafico Guadagno/Frequenza')  
% Impostazione degli assi
ax = gca;
ax.XAxisLocation = 'origin';
ax.YAxisLocation = 'origin';
% Esportazione 
% exportgraphics(ax,'Gf_nonlog.pdf','Resolution',300)

% Grafico semilogaritmico 
figure 
semilogx(x,y, '-o')
grid minor
ylabel('Guadagno')
xlabel('Frequenza [Hz]')
title('Grafico Guadagno/Frequenza')
% Impostazione degli assi
ax = gca;
ax.XAxisLocation = 'origin';
ax.YAxisLocation = 'origin';
% Esportazione 
% exportgraphics(ax,'Gf_semilog.pdf','Resolution',300)


%% Individuazione della frequenza di taglio
yft = G(4)/sqrt(2)
xdb = [x(1) x(4)]; ydb = [yft yft];
figure 
plot(x,y, '-o')
hold on
plot(xdb,ydb)
hold off 
grid minor
ylabel('Guadagno')
xlabel('Frequenza [Hz]')
title('Grafico Guadagno/Frequenza')  
% Impostazione degli assi
ax = gca;
ax.XAxisLocation = 'origin';
ax.YAxisLocation = 'origin';
% Esportazione 
% exportgraphics(ax,'Gf_deamp.pdf','Resolution',300)


%% Intersezione 
retta_db = polyfit(xdb, ydb,1);
retta_necessaria = polyfit([x(1) x(2)], [y(1) y(2)], 1);

x_intersect = fzero(@(x) polyval(retta_db-retta_necessaria,x),10e3);
y_intersect = polyval(retta_db,x_intersect);

figure 
plot(x,y, '-o')
hold on
plot(xdb,ydb)
plot(x_intersect,y_intersect,'r*')
hold off 
grid minor
ylabel('Guadagno')
xlabel('Frequenza [Hz]')
title('Grafico Guadagno/Frequenza')  
% Impostazione degli assi
ax = gca;
ax.XAxisLocation = 'origin';
ax.YAxisLocation = 'origin';
% Esportazione 
% exportgraphics(ax,'Gf_ft.pdf','Resolution',300)

disp(x_intersect)

toc