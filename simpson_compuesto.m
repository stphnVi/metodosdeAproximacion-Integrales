function I = simpson_compuesto(f, a, b, N)
    % simpson_compuesto - Aproxima la integral definida de una función utilizando la regla de simpson compuesta
    %
    %   I = simpson_compuesto(f, a, b, N)
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
    %   I = simpson_compuesto(f, a, b, N)

    % Calcula el ancho de cada subintervalo
    h = (b - a) / N;

    % Calcula la aproximación inicial
    I = (h/6) * (f(a) + 4*f((a+b)/2) + f(b));

    % Suma las contribuciones de los puntos
    for i = 1:N-1
        x = a + i * h;
        I = I + (h/6) * (f(x) + 4*f((x + (x+h))/2) + f(x+h));
    end
end

