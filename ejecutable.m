function ejecutable()

    %  función a integrar
    f = @(x) log(x);

    % Definir los límites de integración
    a = 2;
    b = 5;

    % Parámetros solicitados para las pruebas
    N = 20;
    tol = 1e-6;
    iterMax = 2500;

    % Aproximación numérica utilizando la regla del trapecio compuesto
    disp('Aproximación utilizando trapecio compuesto:');
    I_trapecio = trapecio_compuesto(f, a, b, N);
    disp(['Resultado: ' num2str(I_trapecio)]);

    % Aproximación numérica utilizando la regla de simpson compuesto
    disp('Aproximación utilizando simpson compuesto:');
    I_simpson = simpson_compuesto(f, a, b, N);
    disp(['Resultado: ' num2str(I_simpson)]);

end


% Llamar a la función ejecutable
ejecutable();
