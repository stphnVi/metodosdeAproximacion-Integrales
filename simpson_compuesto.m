function I = simpson_compuesto(f, a, b, N)
    % f: función a integrar
    % a, b: límites del intervalo
    % N: número de puntos en los que se divide el intervalo

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

