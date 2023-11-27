function I = simpson_compuesto(f, a, b, tol, iterMax)
    % SIMPSON_COMPUETO - Aproxima la integral definida de una función utilizando la regla de Simpson Compuesto
    %
    %   I = simpson_compuesto(f, a, b, tol, iterMax)
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
    % Ejemplo de uso:
    %   f = @(x) x^2;
    %   a = 0;
    %   b = 1;
    %   tol = 1e-6;
    %   iterMax = 1000;
    %   resultado = simpson_compuesto(f, a, b, tol, iterMax);
    %   disp(['Aproximación numérica de la integral: ', num2str(resultado)]);
    %

    % Inicialización
    n = 1; % Inicializa el número de subintervalos
    h = (b - a) / n; % Calcula la longitud del subintervalo
    I_prev = 0; % Inicializa la aproximación previa de la integral
    I = h / 3 * (f(a) + 4 * f((a + b) / 2) + f(b)); % Calcula la primera aproximación numérica usando la fórmula de Simpson

    % Iteraciones
    while abs(I - I_prev) > tol && n < iterMax
        n = n * 2; % Doble el número de subintervalos en cada iteración
        h = (b - a) / n; % Recalcula la longitud del subintervalo
        I_prev = I; % Almacena la aproximación previa
        I = h / 3 * (f(a) + f(b)); % Inicializa la nueva aproximación usando los extremos

        % Calcula la suma de las evaluaciones de la función en los puntos interiores
        for i = 1:n-1
            x = a + i * h;
            I = I + h / 3 * (4 * f(x) + 2 * f(x + h));
        end
    end
end


% Solicitar la función a integrar al usuario
f_str = input('Ingrese la función a integrar como una cadena de caracteres (por ejemplo, "x^2"): ', 's');
f = str2func(['@(x) ', f_str]);

% Solicitar los extremos del intervalo al usuario
a = input('Ingrese el extremo inferior del intervalo (a): ');
b = input('Ingrese el extremo superior del intervalo (b): ');

% Solicitar la tolerancia y el número máximo de iteraciones al usuario
tol = input('Ingrese la tolerancia para la convergencia del método iterativo: ');
iterMax = input('Ingrese el número máximo de iteraciones permitidas: ');

% Calcular la aproximación numérica de la integral
resultado = simpson_compuesto(f, a, b, tol, iterMax);

% Mostrar el resultado
disp(['Aproximación numérica de la integral: ', num2str(resultado)]);

