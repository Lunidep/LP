mylength([], 0) .
mylength([_|T], N) :- mylength(T, N1), N is N1 + 1.

mymember(H, [H|_]).
mymember(H, [_|T]) :- mymember(H, T).

myappend([], X, X).
myappend([A|X], Y, [A|Z]) :- myappend(X,Y,Z).
%myappend([1,2,3,4,5,6], [88], X).

myremove(X,[X|T],T).
myremove(X,[Y|T],[Y|T1]):-myremove(X,T,T1).
%myremove(5,[1,2,3,4,5,6], X).

mypermute([],[]).
mypermute(L,[X|T]):-myremove(X,L,R),mypermute(R,T).
%mypermute([1,2,3], X).

mysublist([], _).
mysublist([X|T], [X|T1]) :- mysublist(T, T1), !.
mysublist([X|T], [_|T1]) :- mysublist([X|T], T1), !.
%mysublist([1,2,8], [1,2,3,4,5,6]).

%Задание №1(Предикаты обработки списков)
%Вариант 18(Подсчет числа вхождений заданного элемента в список)
%Используя стандартный предикат findall
count_occurrences(List, El, X):-
  findall(El, mymember(El, List), Count_L),
  mylength(Count_L, X).

%Без использования стандартных предикатов
count_occurrences([], _El, 0):-!.
count_occurrences([El|T], El, N):-!, count_occurrences(T, El, N1),
  N is N1 + 1.
count_occurrences([_El|T], El, N):-count_occurrences(T, El, N).

%Набор тестов
%count_occurrences([1,2,3,4,5,6,7,8,9,10],7,X).
%count_occurrences([1,2,2,6,7,8,2],2,X).


%Задание №2(Предикаты обработки числовых списков)
%Вариант 3(Вычисление максимального элемента)
%Используя стандартныe предикатs sort и last
max_element(List, X):-
    sort(List, L),
    last(L, X).

%Без использования стандартных предикатов
max_element([X],X).
max_element([H|T],H):-max_element(T,M),H>M,!.
max_element([_|T],M):-max_element(T,M).

%Набор тестов
%max_element([1,2,3,4,5,6,7,8,9,10],X).
%max_element([1,5,3,6,7,8,2],X).


%ПУНКТ 6 ЛАБОРАТОРНОЙ РАБОТЫ
%Привести какой-нибудь содержательный пример совместного использования предикатов, реализованных в пунктах 3 и 4.
%поиск среди списка результатов егэ абитуриентов кол-ва людей с самыми большими баллами
max_ege(List_ege, X):-
    max_element(List_ege, Cur),
    count_occurrences(List_ege, Cur, X).
%max_ege([2,78,99,45,12,77,99,99,99,45], X).




