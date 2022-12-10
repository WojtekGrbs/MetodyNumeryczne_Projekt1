function [] = Demonstrate(a,b,c,d,p)
    % Funkcja Demonstrate(a,b,c,d,p) służy wygenerowaniu graficznej
    % reprezentacji szybkości zbieżności metody Jarratt'a poprzez
    % określenie kolorów odpowiadających wymaganym liczbom iteracji
    % potrzebnych do uzyskania warunku stopu.

    % W tym celu funkcja wykorzystuje wcześniej zdefiniowaną funkcję
    % ResultMatrix(A, p, tol) oraz GenerateMatrix(a,b,c,d,n,m).
    
    % Argumenty przekazywane funkcji GenerateMatrix(a,b,c,d,n,m):
    % a,b: Krańce dyskretnego podziału wartości części urojonej
    % c,d: Krańce dyskretnego podziału wartości części rzeczywistej
    
    % Argumenty przekazywane funkcji ResultMatrix(A, p, tol):
    % p: Wektor współczynników wielomianu, którego miejsc zerowych szukamy

    % Macierz A generujemy funkcją GenerateMatrix
    size = 1500;
    I = ResultMatrix(GenerateMatrix(a,b,c,d,size,size), p, 0.01);
    
    % Ręcznie ustawiamy kolorystykę
    map = hot(31);
    
    figure

    imagesc(I);

    % Niech miejsca początkowe wymagające najwięcej iteracji będą
    % najciemniejsze
    colormap(flipud(map))
    colorbar
    xticks([1 size/4 size/2 size*3/4  size-1])
    xticklabels({a, -abs(b-a)/4,a+b,abs(b-a)/4,b})
    yticks([1 size/4 size/2 size*3/4  size-1])
    yticklabels({d, abs(d-c)/4,c+d, -abs(d-c)/4,c})
    xlabel('Re(z)')
    ylabel('Im(z)')
end
