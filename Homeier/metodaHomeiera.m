function [k,x,w_x] = metodaHomeiera(w, x0, tol)

% Funkcja metodaHomeiera(w,x0,tol) służy określeniu miejsc zerowych podanego
% wielomianu przy pomocy metody Homeiera, jednocześnie umożliwiająca
% maksymalnie 30 iteracji tej metody, w przeciwnym wypadku liczba 
% iteracji ustalana jest na 31.
%Jako argumenty metoda przyjmuje:
% p - wspolczynniki wielomianu
% x0 - początkowe przybliżenie
% tol - dokładność
% max_iter - maksymalna ilość iteracji
% Metoda zwraca:
% k - liczba wykonanych iteracji
% x - przybliżenie
% w_x=w(x)

max_iter = 30;
k = 0;
dx = tol + 1;

while abs(dx) > tol && k <= max_iter
    w = Horner(w,x0);
    y0 = x0 - w/HornerDerivative(w, x0);
    if abs(w) <= tol               % warunek na dokładność
        x = x0;
        w_x = w;
        return
    end
    mianownik = 2*HornerDerivative(w, x0)*(HornerDerivative(w, y0));
    
    if mianownik == 0
        disp(' Dzielenie przez zero! ');
        return
    end
    
    dx = (w*(HornerDerivative(w, x0)+ HornerDerivative(w, y0)))/mianownik;
    x1 = x0 - dx;        % obliczanie xk+1
    k = k + 1;           % aktualizacja liczby iteracji 
    x0 = x1;             % aktualizacja xk
end

fprintf('Nie znaleziono rozwiązania w %d iteracjach', max_iter);
k = 31;         %gdy nie znajdziemy w wymaganej liczbie iteracji to kolorujemy na czarno  
x = NaN;
