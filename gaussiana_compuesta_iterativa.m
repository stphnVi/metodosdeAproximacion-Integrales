function I = gaussiana_compuesta_iterativa(f, a, b, M, tol, iterMax)
    % GAUSSIANA_COMPUESA_ITERATIVA - Aproxima la integral definida de una función utilizando cuadratura gaussiana compuesta iterativa
    %
    %   I = gaussiana_compuesta_iterativa(f, a, b, M, tol, iterMax)
    %
    % Parámetros de entrada:
    %   - f: Función a integrar. Debe ser una función manejable por Octave.
    %   - a, b: Extremos del intervalo [a, b] en el que se realiza la integración.
    %   - M: Orden de la cuadratura gaussiana (considerar un orden máximo de 10).
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
    I = cuadratura_gaussiana_compuesta(f, a, b, M, n); % Calcula la primera aproximación numérica

    % Iteraciones
    while abs(I - I_prev) > tol && n < iterMax
        n = n * 2; % Doble el número de subintervalos en cada iteración
        h = (b - a) / n; % Recalcula la longitud del subintervalo
        I_prev = I; % Almacena la aproximación previa
        I = cuadratura_gaussiana_compuesta(f, a, b, M, n); % Calcula la nueva aproximación
    end
end

function I = cuadratura_gaussiana_compuesta(f, a, b, M, n)
    % CUADRATURA_GAUSSIANA_COMPUESA - Aproxima la integral definida de una función utilizando cuadratura gaussiana compuesta
    %
    %   I = cuadratura_gaussiana_compuesta(f, a, b, M, n)
    %
    % Parámetros de entrada:
    %   - f: Función a integrar. Debe ser una función manejable por Octave.
    %   - a, b: Extremos del intervalo [a, b] en el que se realiza la integración.
    %   - M: Orden de la cuadratura gaussiana.
    %   - n: Número de subintervalos.
    %
    % Parámetro de salida:
    %   - I: Aproximación numérica de la integral definida de f(x) en [a, b].
    %

    % Nodos y Pesos de la Cuadratura Gaussiana
    [x_nodes, w_weights] = gauss(M);

    % Inicialización
    I = 0;

    % Iteraciones
    for i = 1:n
        % Mapea los nodos a los subintervalos [a, b]
        a_i = a + (i - 1) * (b - a) / n;
        b_i = a + i * (b - a) / n;

        % Aproxima la integral en el subintervalo usando la cuadratura gaussiana
        for j = 1:M
            x = 0.5 * (b_i - a_i) * x_nodes(j) + 0.5 * (a_i + b_i);
            I = I + 0.5 * (b_i - a_i) * w_weights(j) * f(x);
        end
    end
end

% Función auxiliar para obtener nodos y pesos de la Cuadratura Gaussiana
function [x_nodes, w_weights] = gauss(M)
    % GAUSS - Devuelve los nodos y pesos para la cuadratura gaussiana de orden M
    %
    %   [x_nodes, w_weights] = gauss(M)
    %
    % Parámetros de entrada:
    %   - M: Orden de la cuadratura gaussiana.
    %
    % Parámetros de salida:
    %   - x_nodes: Nodos de la cuadratura gaussiana.
    %   - w_weights: Pesos de la cuadratura gaussiana.
    %

    % Nodos y Pesos predefinidos para la cuadratura gaussiana hasta orden 10
    gauss_data = [
        -0.9739065285171717, 0.0666713443086881;
        -0.8650633666889845, 0.1494513491505806;
        -0.6794095682990244, 0.2190863625159820;
        -0.4333953941292472, 0.2692667193099963;
        -0.1488743389816312, 0.2955242247147529;
         0.1488743389816312, 0.2955242247147529;
         0.4333953941292472, 0.2692667193099963;
         0.6794095682990244, 0.2190863625159820;
         0.8650633666889845, 0.1494513491505806;
         0.9739065285171717, 0.0666713443086881
    ];
    % Selecciona los nodos y pesos según el orden M
    if M > 0 && M <= 10
        x_nodes = gauss_data(1:M, 1);
        w_weights = gauss_data(1:M, 2);
    else
        error('El orden de la cuadratura gaussiana debe estar entre 1 y 10.');
    end
end




