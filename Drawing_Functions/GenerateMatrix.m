function [A] = GenerateMatrix(a,b,c,d,n,m)

    % Funkcja GenerateMatrix(a,b,c,d,n,m) to funkcja generująca
    % macierz A o współczynnikach zespolonych, przy czym każda kolumna
    % oraz każdy wiersz różni się o dokładnie tą samą wartość względem
    % poprzednika części zarówno rzeczywistej, jak i urojonej.
    % Różnica ta określana jest przez średnią arytmetyczną ustalonych
    % przez użytkownika parametrów:

    % a,b: Krańce dyskretnego podziału wartości części urojonej
    % c,d: Krańce dyskretnego podziału wartości części rzeczywistej
    % n,m: Ustalają podział różnicy pomiędzy kolejnymi wartościami,
    %      jednocześnie wyznaczając rozmiar macierzy (z dokładnością
    %      do pierwszego wyrazu)

    h1 = (b-a)/n;
    h2 = (d-c)/m;
    
    y = c:h2:d;
    
    A = zeros(n+1, m+1);

    % Zamiana podanej wartości rzeczywistej na urojoną
    for k = 1:m+1
        y(k) = y(k) * 1i;
    end
    
    % Dodanie części urojonej do macierzy
    for k = 1:n+1
        A(k, :) = y;
    end
    
    % Dodanie części rzeczywistej do macierzy
    for k = 1:m+1
        x = reshape(a:h1:b, n+1, 1);
        A(:, k) = reshape(A(:,k),n+1,1) + x;
    end
end
