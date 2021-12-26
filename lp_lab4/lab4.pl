%compare(['Саша', 'и', 'Лена', 'любят', 'шоколад'] , ['шоколад', 'любим', 'Сашей', 'и', 'Леной'], Ph1,Ph2, Y).

op(200, xfy, ':').

compare(X, Y, Ph1, Ph2, Ans):-
  an_phrase(Ph1, _, X),
  an_phrase(Ph2, _, Y),
  cmp(Ph1, Ph2, Ans), !.

cmp(X, Y, Ans):-
  X = Y, Ans = 'yes', !.
cmp(_,_,'no').


% обработка случая, когда несколько существительных соединены союзом
several_agent([X|Ans], Zalog,[H,Uni|T]):-
  an_mest(X, Zalog, H),
  union(Uni),
  several_agent(Ans, Zalog, T).
% вариант, когда существительное одно
several_agent([X], Zalog,[H]):-
  an_mest(X, Zalog, H).



% активный залог
an_phrase(Res, zalog('актив'), L):-
  append([KTO|T], [VERB|KOGO], L),
  an_glag(X2, zalog('актив'), VERB),
  several_agent(X1, pad('именит'), [KTO|T]),
  several_agent(X3, pad('винит'), KOGO),
    sort(X1, S1), sort(X3, S3),
    Res = [X2, S1 ,S3] .

% пассивный залог
an_phrase(Res, zalog('пассив'),L):-
    append([CHTO|T], [VERB|KEM], L),
    an_glag(X2, zalog('пассив'), VERB),
    several_agent(X1, pad('именит'), [CHTO|T]),
    several_agent(X3, pad('творит'), KEM),
  sort(X1, S1), sort(X3, S3),
    Res = [X2, S3 ,S1] .



an_mest(XC, K, X) :- gen_nouns(File1),fid(X, XC, K, File1).
an_glag(XC, K, Y) :- gen_verbs(File2),fid(Y, XC, K, File2).

% поиск словоформы в словаре
fid(Word, CanonWord, Type, File):-
  member(X, File),
  condition(Word, CanonWord, Type, X).

condition(W, CW, T, CW:T:L):-
  member(W, L).

% словарь существительных
gen_nouns(File1):-File1=
    [
    'Петя':pad('именит'):['Петя'],
    'Петя':pad('винит'):['Петю'],
    'Петя':pad('творит'):['Петей'],

    'Саша':pad('именит'):['Саша'],
    'Саша':pad('винит'):['Сашу'],
    'Саша':pad('творит'):['Сашей'],

    'Лена':pad('именит'):['Лена'],
    'Лена':pad('винит'):['Лену'],
    'Лена':pad('творит'):['Леной'],

    'шоколад':pad('именит'):['шоколад'],
    'шоколад':pad('винит'):['шоколад'],
    'шоколад':pad('творит'):['шоколадом']
    ].

% словарь глаголов
gen_verbs(File2):-File2=
    [
    'likes':zalog('актив'):['любит', 'любят'],
    'likes':zalog('пассив'):['любим', 'любима', 'любимо', 'любимы']
    ].

% предикат союза
union('и').










