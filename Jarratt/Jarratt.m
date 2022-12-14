function count = Jarratt(w, x_0, tol)
    % Funkcja Jarrat(w,x_0,tol) służy określeniu miejsc zerowych podanego
    % wielomianu przy pomocy metody Jarratt'a, jednocześnie umożliwiająca
    % maksymalnie 30 iteracji tej metody, w przeciwnym wypadku liczba 
    % iteracji ustalana jest na 31.

    % w: Współczynniki wielomianu, którego miejsc zerowych szukamy
    % x_0: Początkowe przybliżenie
    % tol: (Zwykle mała) liczba rzeczywista określająca warunek stopu
    
    % Funkcja wymaga wcześniejszego zaimplementowania funkcji Horner() oraz
    % HornerDerivative()
    
    x0 = x_0;
    x1 = x_0;

    fx0 = Horner(w, x0);

    % Zmienna count zlicza dotychczasowe iteracje
    count = 0;

    while (count < 30)
        
        % W pierwszym kroku nie nadpisujemy
        if count ~= 0 
            x0 = x1;
            fx0 = Horner(w, x0);
            if abs(fx0) < tol
            return
            end 
        end

        
        fix0 = HornerDerivative(w, x0);

        if fix0 == 0
            disp('Dzielenie przez 0!')
            return
        end
        
        mianownik = HornerDerivative(w, x0 - (1/2)*fx0/fix0);
        x1 = x0 - fx0/mianownik;
        count = count + 1;
    end

    % W przypadku, gdy po przejściu 30 iteracji nie spełniamy warunku stopu
    count = 31;
end
