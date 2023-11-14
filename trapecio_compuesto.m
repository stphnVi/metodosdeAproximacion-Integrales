function I = trapecio_compuesto(f, a, b, N)
    % f: función a integrar
    % a, b: límites del intervalo prupuestos con la tarea
    % N: número de puntos en los que se divide el intervalo

    % Calcula el ancho de cada subintervalo
    h = (b - a) / N;

    % Calcula la aproximación inicial
    I = (f(a) + f(b)) / 2;

    % Suma las contribuciones de los puntos internos
    for i = 1:N-1
        x = a + i * h;
        I = I + f(x);
    end

    % Multiplica por el ancho del intervalo
    I = I * h;
end

