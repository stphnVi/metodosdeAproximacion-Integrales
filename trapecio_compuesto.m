function I = trapecio_compuesto(f, a, b, N)
    % f: función a integrar
    % a, b: límites del intervalo propuestos con la tarea
    % N: número de puntos en los que se divide el intervalo

    % Calcula el ancho de cada subintervalo
    h = (b - a) / N;

    % Calcula la aproximación inicial
    A = (f(a) + f(b)) / 2;
    I = A * (b - a);

    % Suma las contribuciones de los puntos internos
    x = a + h;  % Inicializa x
    for i = 1:N-1
        I = I + 2* f(x);
        x = x + h;  % Actualiza x para el siguiente punto interno
    end
    I=I*h/2
end


