%варианты размещения в лодке миссионеров(слева) и каннибалов(справа) 
boat_state(1, 0).
boat_state(2, 0).
boat_state(3, 0).
boat_state(0, 1).
boat_state(0, 2).
boat_state(0, 3).
boat_state(1, 1).
boat_state(2, 1).

%пространство состояний задается структурным термом s,
%состоящим из 5 элементов
% 1. MLeft - Кол-во миссионеров на левом берегу 
% 2. KLeft - Кол-во каннибалов на левом берегу 
% 3. boat_pos - Положение лодки (левый/правый берег)
% 4. MRight- Кол-во миссионеров на правом берегу 
% 5. KRight- Кол-во каннибалов на левом берегу

%стартовое состояние - все на левом берегу
start(s(3,3, left, 0, 0)).

%конечное состояние - все на левом берегу
goal(s(_ ,_ ,_ , 3, 3)).

%проверка на удовлетворение условиям безопасности для миссионеров на обоих берегах
check(M, K) :-
    M >= K; M =:= 0. 


%изменение состояний производится за счет "рейса" лодки на другой берег
%"рейс" с левого берега на правый
move(s(MLeft1, KLeft1, left, MRight1, KRight1), s(MLeft2, KLeft2, right, MRight2, KRight2)) :-
    %нам надо подобрать такую комбинацию людей в лодке, чтобы выполнялось условие безопасности миссионеров
    boat_state(M, K), M =< MLeft1, K =< KLeft1,
    MLeft2 is MLeft1 - M, KLeft2 is KLeft1 - K,
    check(MLeft2, KLeft2),
    MRight2 is MRight1 + M, KRight2 is KRight1 + K,
    check(MRight2, KRight2).

%"рейс" с правого берега на левый
move(s(MLeft1, KLeft1, right, MRight1, KRight1), s(MLeft2, KLeft2, left, MRight2, KRight2)) :-
    move(s(MRight1, KRight1, left, MLeft1, KLeft1), s(MRight2, KRight2, right, MLeft2, KLeft2)).


%предикат продления
prolong([X | T], [Y, X | T]) :-
    move(X, Y),
    not(member(Y, [X | T])).

%поиск в глубину
dpth([X | T], [X | T]) :-
    goal(X).
dpth(P, L) :-
    prolong(P, P1),
    dpth(P1, L).

%поиск в ширину
bdth([[X | T] | _], [X | T]) :-
    goal(X).
bdth([P | Q1], R) :-
    findall(Z, prolong(P, Z), T),
    append(Q1, T, Q0), !,
    bdth(Q0, R).

%поиск с итеративным погружением
int(1).
int(M) :-
    int(N), M is N + 1.

depth_id([X | T], [X | T], 0) :- %отсечение путей, которые не соответствуют заданной глубине
    goal(X).
depth_id(P, L, N) :- N > 0,
    prolong(P, P1), N1 is N - 1,
    depth_id(P1, L, N1).


print_answer(_, Len, Len).
print_answer([H |T], N, Len):-
    N1 is N + 1,
    write(N1), write("). "),
    write(H),nl, 
    print_answer(T, N1, Len).


search_dpth :-
    get_time(DEPTH),
    start(S),
    dpth([S], L),
    reverse(L, P),length(P, Len), 
    print_answer(P, 0, Len), nl,
    get_time(DEPTH1),
    T is DEPTH1 - DEPTH,
    write("Depth-search length: "), write(Len), nl,
    write("Depth-search time: "), write(T), nl, nl, !.


search_bdth :-
    get_time(BREADTH),
    start(S),
    bdth([[S]], L),
    reverse(L, P),length(P, Len), 
    print_answer(P, 0, Len), nl,
    get_time(BREADTH1),
    T is BREADTH1 - BREADTH,
    write("Breadth-search length: "), write(Len), nl,
    write("Breadth-search time: "), write(T), nl, nl, !.


search_id :-
    get_time(ITER),
    start(S),
    int(Level),
    depth_id([S], L, Level),
    reverse(L, P),length(P, Len), 
    print_answer(P, 0, Len), nl,
    get_time(ITER1),
    T is ITER1 - ITER,
    write("Breadth-search length: "), write(Len), nl,
    write("Breadth-search time: "), write(T), nl, nl, !.