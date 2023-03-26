function p = HornerDerivative(c, x)
    % Funkcja HornerDerivative służy określeniu wartości pochodnej
    % danego wielomianu w danym punkcie
    
    % c: Wektor współczynników wielomianu
    % x: Argument, dla którego wartości szukamy

    n = length(c);

    w = c(1);
    p = w;

    % Nie bierzemy pod uwagę wyrazu wolnego w iteracjach
    for k = 2:n-1
        wk = c(k) + x*w;
        pk = wk + x*p;
        p = pk;
        w = wk;
    end
end