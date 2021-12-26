%Реализация функции вычисления чисел Фибоначчи:

%-----------------------------------
% 1 способ: Обычная рекурсия

rec_fib(0, 0):-!.
rec_fib(1,1) :- !.
rec_fib(2,1) :- !.

rec_fib(N,F) :-
  N1 is N - 1, rec_fib(N1,F1),
  N2 is N - 2, rec_fib(N2,F2),
  F is F1 + F2.

%-----------------------------------
% 2 способ: Хвостовая рекурсия

tail_rec_fib(0, 0):-!.
tail_rec_fib(1,1) :- !.

tail_rec_fib(N,Result):-func1(N,0,1,Result).

func1(0,Result,_,Result):-!.
func1(N, Prev1, Prev2,Result):-
    N>0,
    New_Prev1 is Prev2,
    New_Prev2 is Prev1+Prev2,
    N1 is N-1,
    func1(N1, New_Prev1, New_Prev2, Result).

%-----------------------------------
% 3 способ: Корекурсия

corec_fib(0, 0):-!.
corec_fib(1, 1):-!.
corec_fib(N,RESULT):-func2(2,N,1,1,RESULT).

func2(N_RES, N_RES, _, RESULT, RESULT):-!.
func2(N, N_RES, Prev1, Prev2,F):-
    New_Prev1 is Prev2,
    New_Prev2 is Prev1+Prev2,
    N1 is N+1,
    func2(N1, N_RES, New_Prev1, New_Prev2, F).
