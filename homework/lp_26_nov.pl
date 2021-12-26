%Студент: Попов Илья
%Группа: М80-206Б-20

%Написать программу, которая найдёт минимальное число фибоначчи, делящееся на 13, и превосходящее 5000.

%Проверка числа на заданные условия
check(X):-
    X_CUR is X mod 13,
	X > 5000, X_CUR =:= 0.

%Классическая рекурсия
solve_rec(X):-
    write("Result of recursive search:"), nl,
    rec_fib_search(0, X).

rec_fib(0, 0):-!.
rec_fib(1,1) :- !.
rec_fib(2,1) :- !.

rec_fib(N,F) :-
  N1 is N - 1, rec_fib(N1,F1),
  N2 is N - 2, rec_fib(N2,F2),
  F is F1 + F2.

rec_fib_search(N, RESULT):-
	N1 is N + 1, 
    rec_fib(N1, F1),
	(not(check(F1)) -> rec_fib_search(N1, RESULT); RESULT is F1, !).


%Корекурсия
solve_corec(X):-
    write("Result of corecursive search:"), nl,
    corec_fib_search(1,1, X).

corec_fib_search(F1, F2, RESULT):-
	F is F1 + F2,
	(not(check(F)) -> corec_fib_search(F2, F, RESULT); RESULT is F,!).









