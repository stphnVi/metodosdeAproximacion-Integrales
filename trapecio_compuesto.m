function I = trapecio_compuesto(f, a, b, N)
    % trapecio_compuesto - Aproxima la integral definida de una función utilizando la regla del trapecio compuesta
    %
    %   I = trapecio_compuesto(f, a, b, N)
    %
    % Parámetros de entrada:
    %   - f: Función a integrar. Debe ser una función manejable por Octave.
    %   - a, b: Extremos del intervalo [a, b] en el que se realiza la integración.
    %   - N: número de puntos en los que se divide el intervalo
    %
    %
    % Parámetro de salida:
    %   - I: Aproximación numérica de la integral definida de f(x) en [a, b].
    %
    % Ejemplo de uso:
    %   - f = @(x) log(asin(x))/log(x);
    %   - a = 0.1;
    %   - b = 0.9;
    %   - N = 20;
    %
    %   I = trapecio_compuesto(f, a, b, N)

    % Calcula el ancho de cada subintervalo
    h = (b - a) / N;

    % Calcula la aproximación inicial
    A = (f(a) + f(b)) / 2;
    I = A * (b - a);

    % Suma las contribuciones de los puntos internos

    % Inicializa x
    x = a + h;
    for i = 1:N-1
        I = I + 2* f(x);
        % Actualiza x para el siguiente punto interno
        x = x + h;
    end
    I=I*h/2
end


