% Definición de la función f(x)
f = @(x) 0.2 + 25*x - 200*x.^2 + 675*x.^3 - 900*x.^4 + 400*x.^5;

% Intervalo de integración
a = 0;
b = 0.8;

% Número de subintervalos
n = 6;
h = (b - a) / n;
x = a:h:b;

% Evaluación de la función en los puntos x
y = f(x);

% Aplicación de la regla de Simpson 1/3 compuesta
S = y(1) + y(end) + 4*sum(y(2:2:end-1)) + 2*sum(y(3:2:end-2));
I_approx = (h / 3) * S;

% Cálculo de la cuarta derivada de f(x)
syms xsym
fsym = 0.2 + 25*xsym - 200*xsym^2 + 675*xsym^3 - 900*xsym^4 + 400*xsym^5;
f4sym = diff(fsym, xsym, 4);
f4 = matlabFunction(f4sym);

% Cálculo del valor medio de la cuarta derivada
media_f4 = integral(f4, a, b) / (b - a);

% Cálculo del error de truncamiento estimado
error_trunc = -((b - a) * h^4 / 180) * media_f4;

% Valor exacto de la integral
I_exact = 1.640533;

% Cálculo del error relativo porcentual
error_relativo = abs((I_exact - I_approx) / I_exact) * 100;

% Mostrar resultados
fprintf('Integral aproximada (Simpson 1/3): %.6f\n', I_approx);
fprintf('Valor medio de la cuarta derivada: %.6f\n', media_f4);
fprintf('Error de truncamiento estimado: %.6f\n', error_trunc);
fprintf('Error relativo porcentual: %.6f%%\n', error_relativo);
