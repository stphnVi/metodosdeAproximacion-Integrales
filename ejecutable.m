function ejecutable()

    % Ejecutable - permite probar aproximaciones de integrales por medio de diversos métodos tales como:

    % Regla de simpson compuesto
    % Regla de trapecio compuesto
    % Cuadratura gaussiana compuesta

    % Regla de simpson compuesto iterativa
    % Regla de trapecio compuesto iterativa
    % Cuadratura gaussiana compuesta iterativa

    % Parámetros de entrada segun corresponda
    %   - f: Función a integrar. Debe ser una función manejable por Octave.
    %   - a, b: Extremos del intervalo [a, b] en el que se realiza la integración.
    %   - N: número de puntos en los que se divide el intervalo
    %   - M: orden de la cuadratura, maximo 10
    %   - tol: tolerancia
    %   - iterMax: Numero maximo de iteraciones

    % Parámetro de salida:
    %   - I: Aproximación numérica de la integral definida de f(x) en [a, b].
    %
    % Ejemplo de uso:
    %   - f = @(x) log(asin(x))/log(x);
    %   - a = 0.1;
    %   - b = 0.9;
    %   - N = 20;
    %   - M = 10;
    %   - iterMax = 2500;
    %   - tol = 1e-6
    %
    %   Al llamar a la funcion ejecutable se pretende obtener las aproximaciones de todos
    %   los métodos mencionados anteriormente


    %  definir función a integrar

    f = @(x) log(asin(x))/log(x);

    % Definir los límites de integración
    a = 0.1;
    b = 0.9;

    % Parámetros solicitados para las pruebas
    N = 20;
    tol = 1e-6;
    iterMax = 2500;
    M = 10;

    % Aproximación numérica utilizando la regla del trapecio compuesto
    disp('Aproximación utilizando trapecio compuesto:');
    I_trapecio = trapecio_compuesto(f, a, b, N);
    disp(['Resultado: ' num2str(I_trapecio)]);

    % Aproximación numérica utilizando la regla de simpson compuesto
    disp('Aproximación utilizando simpson compuesto:');
    I_simpson = simpson_compuesto(f, a, b, N);
    disp(['Resultado: ' num2str(I_simpson)]);

    % Aproximación numérica utilizando la regla de gauss compuesto
    disp('Aproximación utilizando gauss compuesta:');
    I_gauss = gaussiana_compuesta(f, a, b, M, N);
    disp(['Resultado: ' num2str(I_gauss)]);

end


% Llamar a la función ejecutable
ejecutable();
