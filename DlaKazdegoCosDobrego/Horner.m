function [y] = Horner(p, x0)
    % Funkcja Horner służy określeniu wartości danego wielomianu
    % dla określonego argumentu
    
    % c: Wektor współczynników wielomianu
    % x: Argument, dla którego wartości szukamy

    n = length(p);
    y = p(1);
    for i = 2:n
        y = y * x0 + p(i);
    end
end
