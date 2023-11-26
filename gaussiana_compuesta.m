
function I = gaussiana_compuesta(f, a, b, M, N)
    % gaussiana_compuesta - Aproxima la integral definida de una función utilizando la cuadratura gaussiana compuesta
    % Importante: se tomó la desición de obtener las constantes de los pesos y las raices para
    % optimizar la función y evitar realizar cálculos que afectaran a lo largo el flujo del programa para ello
    % se hizo uso del polinomio de Legendre.
    %
    %   I = gaussiana_compuesta(f, a, b, M, N)
    %
    % Parámetros de entrada:
    %   - f: Función a integrar. Debe ser una función manejable por Octave.
    %   - a, b: Extremos del intervalo [a, b] en el que se realiza la integración.
    %   - N: número de puntos en los que se divide el intervalo
    %   - M: orden de la cuadratura, maximo 10
    %
    % Parámetro de salida:
    %   - I: Aproximación numérica de la integral definida de f(x) en [a, b].
    %
    % Ejemplo de uso:
    %   - f = @(x) log(asin(x))/log(x);
    %   - a = 0.1;
    %   - b = 0.9;
    %   - N = 20;
    %   - M = 10;
    %   I = gaussiana_compuesta(f, a, b, M, N);
    %
    %
    % Inicialización de la integral
    I = 0;

    % Nodos y Pesos de la Cuadratura Gaussiana hasta orden 10

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

    % Verificar si el orden M es válido
    if M < 1 || M > 10
        error('El orden de la cuadratura gaussiana maxima es 10.');
    end

    % Iteraciones sobre los subintervalos
    for i = 1:N
        aNew = a + (i - 1) * (b - a) / N;
        bNew = a + i * (b - a) / N;

        % Aproximación de la integral en el subintervalo usando la cuadratura Gaussiana
        for j = 1:M
            x = 0.5 * (bNew - aNew) * gauss_data(j, 1) + 0.5 * (aNew + bNew);
            I = I + 0.5 * (bNew - aNew) * gauss_data(j, 2) * f(x);
        end
    end
end











