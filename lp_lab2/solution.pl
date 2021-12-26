%Студент: Попов Илья 
%Группа: М8О-206Б-20
%Вариант: 17

%В семье Семеновых пять человек: муж, жена, их сын, сестра мужа и отец жены. Все они работают. 
%Один инженер, другой юрист, третий слесарь, четвертый экономист, пятый учитель. Вот что еще известно о них. 
%Юрист и учитель не кровные родственники.
%Слесарь хороший спортсмен. 
%Он пошел по стопам экономиста и играет в футбол за сборную завода. Экономист старше, чем слесарь.
%Инженер старше жены своего брата, но моложе, чем учитель.  
%Назовите профессии каждого члена семьи Семеновых.

%предикат решения задачи
solve:-  
    write("SOLVE:"), nl,

    L = [profession("husband", _), 
        profession("wife", _), 
        profession("son", _), 
        profession("husband's sister", _), 
        profession("wife's father", _)],

    %Юрист и учитель не кровные родственники.
    member(profession(X, "lawyer"), L),  
    member(profession(Y, "teacher"), L),
    not_blood_relatives(X, Y), 

    %Слесарь хороший спортсмен. 
    %Он пошел по стопам экономиста и играет в футбол за сборную завода.
    member(profession(Z, "locksmith"), L),
    member(profession(U, "economist"), L),
    male(Z),
    male(U),
    %наличие данного предиката здесь обусловлено только условием, что задача имеет одно решение.
    %в условии задачи напрямую не говорится, что экономист - мужчина, 
    %а то что экономист играет в футбол не является достаточным доказательством этого.
    %при отсутствии данного предиката, появляются еще два решения задачи.
    not(not_blood_relative(Z, U)),
    %Экономист старше, чем слесарь.
    not(younger(U, Z)), 

    member(profession(V, "engineer"), L),
    sibling(HUSB, V),
    spouses(HUSB, WIFE),
    %Инженер старше жены своего брата
    not(younger(V, WIFE)),
    %но моложе, чем учитель.
    younger(V, Y),

    write("lawyer- "), write(X), nl,
    write("teacher- "), write(Y), nl,
    write("locksmith- "), write(Z), nl,
    write("economist- "), write(U), nl,
    write("engineer- "), write(V), nl, nl,
    fail.

%данные для определения пола 
%(в данной задаче используется информация только про лица мужского пола)
male("husband").
male("son").
male("wife's father").

%данные для определения сестры мужа
sibling("husband", "husband's sister").

%данные для определения брака
spouses("husband", "wife").

%данные для определения кровного родства
not_blood_relative("husband", "wife").
not_blood_relative("husband's sister", "wife").
not_blood_relative("wife's father", "husband").
not_blood_relative("husband's sister", "wife's father").

%данные для сравнения по возрасту
younger("son", "husband").
younger("son", "wife").
younger("son", "wife's father").
younger("wife", "wife's father").
younger("wife", "husband's sister").
younger("husband's sister", "husband").

%предикат наличия кровного родства
not_blood_relatives(X, Y):- 
    not_blood_relative(X, Y); 
    not_blood_relative(Y, X).

%предикат принадлежности элемента списку
member(A,[A|_]).
member(A,[_|L]):- member(A,L).
