function [k,x,w_x] = metodaHomeiera(p, x0, tol, max_iter)

% Wyznaczanie zera wielomianu metodą Halleya'a
% p - wspolczynniki wielomianu np. p =[3,2,1], czyli w(x) = 3x^2 + 2x + 1
% x0 - początkowe przybliżenie
% tol - dokładność
% max_iter - maksymalna ilość iteracji
% Metoda zwraca:
% x - przybliżenie
% i - liczba wykonanych iteracji
% w_x=w(x), gdzie x jest obliczonym przybliżeniem zera w(x)

k = 0;
dx = tol + 1;
xpocz = x0;             % wartość początkowa

      % I pochodna wielomianu

while abs(dx) > tol && k <= max_iter
    w = Horner(p,x0);
    y0 = x0 - w/HornerDerivative(p, x0);
    if abs(w) <= tol               % dokładność jest wystarczająca
        x = x0;
        w_x = w;
        return
    end
    mianownik = 2*HornerDerivative(p, x0)*(HornerDerivative(p, y0));
    
    if mianownik == 0
        disp(' Dzielenie przez zero! ');
        return
    end
    
    dx = (w*(HornerDerivative(p, x0)+ HornerDerivative(p, y0)))/mianownik;
    x1 = x0 - dx;        % obliczanie następnego przybliżenia 
    k = k + 1;           % aktualizacja i
    x0 = x1;             % aktualizacja x0
end

fprintf('Nie znaleziono rozwiązania w %d iteracjach, zaczynając od %d z wymaganą precyzją wynoszącej: %d \n', max_iter, xpocz, tol);
k = 31;         % bo zamiar jest taki, aby wszystkie pierwiastki nie znalezione do 30 iteracji były kolorowane na jeden kolor  
x = NaN;