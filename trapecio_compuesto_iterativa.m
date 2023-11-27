function I = trapecio_compuesto_iterativa(f, a, b, tol, iterMax)
    % TRAPECIO_COMPUETO_ITERATIVA - Aproxima la integral definida de una función
    %
    %   I = trapecio_compuesto_iterativa(f, a, b, tol, iterMax)
    %
    % Parámetros de entrada:
    %   - f: Función a integrar. Debe ser una función manejable por Octave.
    %   - a, b: Extremos del intervalo [a, b] en el que se realiza la integración.
    %   - tol: Tolerancia para la convergencia del método iterativo.
    %   - iterMax: Número máximo de iteraciones permitidas.
    %
    % Parámetro de salida:
    %   - I: Aproximación numérica de la integral definida de f(x) en [a, b].
    %


    % Inicialización
    n = 1; % Inicializa el número de subintervalos
    h = (b - a) / n; % Calcula la longitud del subintervalo
    I_prev = 0; % Inicializa la aproximación previa de la integral
    I = h / 2 * (f(a) + f(b)); % Calcula la primera aproximación numérica

    % Iteraciones
    while abs(I - I_prev) > tol && n < iterMax
        n = n * 2; % Doble el número de subintervalos en cada iteración
        h = (b - a) / n; % Recalcula la longitud del subintervalo
        I_prev = I; % Almacena la aproximación previa
        I = I_prev / 2; % Inicializa la nueva aproximación

        % Calcula la suma de las evaluaciones de la función en los puntos interiores
        for i = 1:n-1
            I = I + h * f(a + i * h);
        end

        I = I + h * f(b); % Agrega la evaluación de la función en el extremo superior
    end
end

