    % f: función a integrar
    % a, b: límites del intervalo propuestos con la tarea
    % N: número de puntos en los que se divide el intervalo
    % M: orden de la cuadratura, maximo 10

function I = gaussiana_compuesta(f, a, b, M, N)
    [sol, pN] = polLegendre(M);
    x = ceros(pN);
    w = pesos(sol, pN);
    I = calcular_integral(f, a, b, N, x, w, M);
end

function I = calcular_integral(f, a, b, N, x, w, M)
    raices_decimal = double(x);
    pesos_decimal = double(w);

    % Convertir matrices en listas separadas
    raices_lista = raices_decimal(:).'; % Convertir matriz en lista
    pesos_lista = pesos_decimal(:).'; % Convertir matriz en lista

    I = 0;
    h = (b - a) / N;

    for i = 1:N
        sub_a = a + (i - 1) * h;
        sub_b = a + i * h;

        for j = 1:M
            x = 0.5 * (sub_b - sub_a) * raices_lista(j) + 0.5 * (sub_a + sub_b);
            I = I + 0.5 * (sub_b - sub_a) * pesos_lista(j) * f(x);
        end
    end

    I = h * I;
end

function [sol, pN] = polLegendre(M)
    syms pN;
    syms x;
    f_sym = ((x^2-1)^M);
    f_symB = f_sym;

    for j = 1:M
        f_symB = diff(f_symB, x);
    end

    pN = simplify(f_symB / (factorial(M) * 2^M));
    sol = ceros(pN); % Calcula las raíces usando la función ceros

end

function x = ceros(pN)
    syms x;
    eqn = pN == 0;
    sol = solve(eqn, x);
    x = sol; % Convierte a valores numéricos si es necesario
end

function w = pesos(sol, pN)
    syms x;
    pNder = diff(pN, x); % Calcula la derivada de pN respecto a x

    w = sym(zeros(size(sol))); % Inicializa un vector/matriz para los pesos

    for i = 1:numel(sol)
        pNder_sol = subs(pNder, x, sol(i)); % Evalúa la derivada en el punto sol(i)
        w(i) = 2 / ((1 - sol(i))^2 * pNder_sol);
    end
end










