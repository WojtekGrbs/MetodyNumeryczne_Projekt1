function [k,x,w_x] = metodaKinga(p, x0, tol)

% Funkcja metodaHomeiera(w,x0,tol) służy określeniu miejsc zerowych podanego
% wielomianu przy pomocy metody Kinga, jednocześnie umożliwiająca
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
    w = Horner(p,x0);
    y0 = x0 - w/HornerDerivative(p, x0);
    if abs(w) <= tol               % warunek na dokładność
        x = x0;
        w_x = w;
        return
    end
    mianownik = HornerDerivative(p, x0)*HornerDerivative(p, y0)*(Horner(p,x0))^3;
    
    if mianownik == 0
        disp(' Dzielenie przez zero! ');
        return
    end
    
    licznik1 = Horner(p,y0)*HornerDerivative(p, x0)*(Horner(p,x0))^3;
    licznik2 = HornerDerivative(p, y0)*(Horner(p,y0))^3*Horner(p,x0);
    licznik = licznik1 + licznik2;
    dx = licznik/mianownik;
    x1 = y0 - dx;        % obliczanie xk+1
    k = k + 1;           % aktualizacja liczby iteracji 
    x0 = x1;             % aktualizacja xk
end

fprintf('Nie znaleziono rozwiązania w %d iteracjach \n', max_iter);
k = 31;         %gdy nie znajdziemy w wymaganej liczbie iteracji to kolorujemy na czarno  
x = NaN;
