function I = simpson_compuesto(f, a, b, N)
    % f: función a integrar
    % a, b: límites del intervalo
    % N: número de puntos en los que se divide el intervalo

    % Calcula el ancho de cada subintervalo
    h = (b - a) / N;

    % Calcula la aproximación inicial
    I = f(a) + f(b);

    % Suma las contribuciones de los puntos internos con ponderaciones 4 y 2
    for i = 1:N-1
        x = a + i * h;
        if mod(i, 2) == 0
            I = I + 2 * f(x);
        else
            I = I + 4 * f(x);
        end
    end

    % Multiplica por el ancho del intervalo y divide por 3
    I = I * h / 3;
end

