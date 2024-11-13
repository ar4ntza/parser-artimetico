
% paradigma declarativo - arantza garcía 2024
% liga para instalar prolog: https://www.swi-prolog.org/

% definición de un número
numero(0). numero(1). numero(2). numero(3). numero(4).
numero(5). numero(6). numero(7). numero(8). numero(9).

% definición de un factor
factor([N|Rest]) :- numero(N), Rest = [].
factor(['('|ExprRest], Rest) :- expresion(ExprRest, [')'|Rest]).

% definición de un término
termino(Input, Rest) :-
    factor(Input, TempRest),
    (   TempRest = ['*'|RestExpr] ->
        termino(RestExpr, Rest)
    ;   Rest = TempRest).

% definición de una expresión
expresion(Input, Rest) :-
    termino(Input, TempRest),
    (   TempRest = ['+'|RestExpr] ->
        expresion(RestExpr, Rest)
    ;   Rest = TempRest).

% predicado principal para validar una expresión
es_valida(Expr) :- expresion(Expr, []).
