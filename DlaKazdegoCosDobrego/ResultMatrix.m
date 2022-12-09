function [I] = ResultMatrix(A, p, tol)

    % Funkcja ResultMatrix(A, p, tol) służy zamianie wartości
    % współczynników podanej macierzy A na liczbę iteracji wymaganą
    % do uzyskania warunku stopu o podanym parametrze przyjmując za punkt
    % startowy wartość współczynnika w danej komórce, posługując się 
    % wcześniej określoną funkcją Jarratt(w, x_0, tol)

    % A: Macierz współczynników (być może zespolonych)
    % p: Wektor współczynników wielomianu, którego miejsc zerowych
    %    poszukujemy
    % tol: (Zwykle mała) liczba rzeczywista określająca warunek stopu

    % Deklaracja macierzy wynikowej
    I = zeros(size(A,1), size(A,2));
    
    % Dla każdej komórki macierzy wywołujemy funkcję Jarratt() z punktem
    % początkowym równym wartości współczynnika 
    for k = 1:size(A,1)
        for j = 1:size(A,2)
            i = Jarratt(p, A(k,j), tol);
            I(k, j) = i;
        end
    end
end