%question([how,many,sisters,does,'Павел Попов',have,?]).
%question([who, is, 'Ирина Гребенюк', "'s", mother,?]).
%question([is, 'Ирина Гребенюк', 'Тамара Кокорева',"'s", daughter,?]).

:-['new_output.pl'].

:- discontiguous question/1.
:- discontiguous mother/2.
:- discontiguous father/2.

%Определение пола - был ли он/она отцом/матерью
%Определение брака - рождение совместного ребенка 

%Z - общий отец для X и Y
common_father(X, Y, Z):-
    father(Z, X), father(Z, Y).

%Z - общая мать для X и Y
common_mother(X, Y, Z):-
    mother(Z, X), mother(Z, Y).

%X - мужчина
sex(X, m):-
    father(X, _).

%X - женщина
sex(X, f):-
    mother(X, _).

%X - сын Y
son(X, Y):-
    (father(Y, X); mother(Y, X)),
    sex(X, m).

%X - дочь Y
daughter(X, Y):-
    (father(Y, X); mother(Y, X)),
    sex(X, f).

%X - ребенок Y
child(X, Y):-
    father(Y, X); mother(Y, X).

%X брат Y
brother(X, Y):-
    sex(X, m),
    common_father(X, Y, _),
    common_mother(X, Y, _),
    X \= Y.

%X сестра Y
sister(X, Y):-
    sex(X, f),
    common_father(X, Y, _),
    common_mother(X, Y, _),
    X \= Y.

%X и Y состоят в браке
spouses(X, Y):-
    father(X,Z),
    mother(Y,Z).
%X - муж Y
husband(X, Y):-
    spouses(X, Y),
    sex(X, m).
%X - жена Y
wife(X, Y):-
    spouses(X, Y),
    sex(X, f).

%заловка - сестра мужчины, являющегося мужем
%X - сестра мужа, Y - муж
zolovka(X, Y):-
    sex(Y, m),
    sister(X, Y),
    spouses(Y,_).

%--------------------------------------------------------------------------
move(X, Y, father):-father(X, Y).
move(X, Y, mother):-mother(X, Y).
move(X, Y, brother):-brother(X, Y).
move(X, Y, sister):-sister(X, Y).
move(X, Y, son):-son(X, Y).
move(X, Y, daughter):-daughter(X, Y).
move(X, Y, child):- child(X, Y).
move(X, Y, husband):-husband(X, Y).
move(X, Y, wife):-wife(X, Y).
move(X, Y, zolovka):-zolovka(X, Y).

prolong([X | T], [Y, X | T], Rel) :-
    move(X, Y, Rel),
    not(member(Y, [X | T])).

int(1).
int(M) :- int(N), M is N + 1.

depth_id([Finish | T], Finish, [Finish | T], 0, []). 
depth_id(Path, Finish, Result, N, [Rel | TRel]):- N > 0,
    prolong(Path, NewPath, Rel), N1 is N - 1,
    depth_id(NewPath, Finish, Result, N1, TRel).

search_id(Start, Finish, Path, Rel):-
    int(DepthLim),
    depth_id([Start], Finish, Path, DepthLim, Rel).

search(Start, Finish, Rel):-
    search_id(Start, Finish, _, Rel).


%--------------------------------------------------------------------------

check_relation(X):-
    member(X, [father, mother, sister, brother, son, daughter, husband, wife, zolovka]).

question_word(X):- member(X, [how, who, whose]).
quantity(X):- member(X, [much, many]).
help_word(X):- member(X, [do, does]).
have_has(X):- member(X, [have, has]).
is(X):- member(X,[is]).
particle(X):- member(X, ["'s"]).
question_mark(X):- member(X, ['?']).
his_her(X):- member(X, [his, her, he, she]).

question(Question):-
    Question = [NAME, WHOSE, ED_REL, QUE],
    (father(_, NAME); mother(_, NAME); father(NAME, _); mother(NAME, _)),
    %his_her(NAME) ->  nb_getval(lastName, NAME); nb_setval(lastName, NAME),
    
    question_word(WHOSE), check_relation(ED_REL), question_mark(QUE), !,
    move(NAME, Res, ED_REL),
    write(NAME),write(" is "), write(Res),write("'s "),write(ED_REL), !.


question(Question):-
    Question = [WHO, IS, NAME, PART, ED_REL, QUE],
    question_word(WHO), is(IS),
    (father(_, NAME); mother(_, NAME); father(NAME, _); mother(NAME, _)),
    %his_her(NAME) ->  nb_getval(lastName, NAME); nb_setval(lastName, NAME),
    
    particle(PART), check_relation(ED_REL), question_mark(QUE), !,
    move(Res, NAME, ED_REL),
    write(Res),write(" is "), write(NAME),write("'s "),write(ED_REL), !.


question(Question):-
    Question = [IS, NAME1, NAME2, PART, ED_REL, QUE],
    is(IS),
    (father(_, NAME1); mother(_, NAME1); father(NAME1, _); mother(NAME1, _)),
    (father(_, NAME2); mother(_, NAME2); father(NAME2, _); mother(NAME2, _)),
    particle(PART), check_relation(ED_REL), question_mark(QUE),
    move(NAME1, NAME2, ED_REL), !.


purals(X):- member(X, [sisters, brothers, sons, daughters]).
pural(sister, sisters).
pural(brother, brothers).
pural(son, sons).
pural(daughter, daughters).


question(Question):-
    Question = [HOW, MANY, MN_REL, D, NAME, H, QUE],
    
    question_word(HOW), quantity(MANY), purals(MN_REL), help_word(D),
    (father(_, NAME); mother(_, NAME); father(NAME, _); mother(NAME, _)),
    %his_her(NAME) ->  nb_getval(lastName, NAME); nb_setval(lastName, NAME),
    have_has(H), question_mark(QUE),

    pural(ED_REL, MN_REL), !,
    setof(X, move(X, NAME, ED_REL), LRes), 
    length(LRes, Res), !,
    
    write(NAME), write(" have "),
    ((Res =:= 1,write(Res),write(" "),write( ED_REL));
    (\+(Res =:= 1),write(Res), write(" "), write(MN_REL))), !.
%--------------------------------------------------------------------------














