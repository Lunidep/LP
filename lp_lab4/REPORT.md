#№ Отчет по лабораторной работе №4
## по курсу "Логическое программирование"

## Обработка естественного языка

### студент: Попов И. П.

## Результат проверки

| Преподаватель     | Дата         |  Оценка       |
|-------------------|--------------|---------------|
| Сошников Д.В. |              |               |
| Левинская М.А.|     25.12    |    5          |

> *Комментарии проверяющих (обратите внимание, что более подробные комментарии возможны непосредственно в репозитории по тексту программы)*


## Введение

Одной из основных задач искусственного интеллекта является анализ естественного языка. Процесс обработки естественного языка сложен тем, что язык довольно трудно полностью формализовать (несмотря на попытки множества гуманитарных наук) и представить в виде, понятному компьютеру.

Но некоторые задачи, обладающие достаточной формализацией, такие как грамматический анализ предложения, будет естественно реализовать с использованием логических языков из-за того, что во многих случаях возможно применение сразу нескольких правил и необходимо применять перебор всех вариантов.

Для обработки естественных и искусственных языков обычно применяются следующие методы:
1. предварительный анализ (поиск границ слов и предложений);
2. морфологический анализ (установление словарных форм слов и приписывание им морфологических признаков);
3. синтаксический анализ (зависимости между словами);
4. семантический анализ (смысл предложения или отдельных слов).

Для решений подобных задач как нельзя лучше подойдут такие языки, как Prolog, в которых реализован процесс перебора с возвратами.

В данной лабораторной работе будет исследована ограниченная часть языка, с достаточно формализованой грамматикой. Грамматика в таком случае будет характеризоваться двумя множествами - терминальными и не терминальными элементами, а также правилами перехода, которые будут учитывать контекст.

## Задание

8. Реализовать преобразователь активных и пассивных форм типа:
[’Саша’, ’и’, ’Лена’, ’любят’, ‘шоколад’] и
[’шоколад’, ’любим’, ’Сашей’, ’и’, ’Петей’]
в глубинные структуры типа и сравнить полученные глубинные структуры.
```Prolog
Запрос: ?- compare([’Саша’, ’и’, ’Лена’, ’любят’, ‘шоколад’] ,
[’шоколад’, ’любим’, ’Сашей’, ’и’, ’Леной’], Ph1, Ph2, Y).
Результат: Ph1=likes([agent(’Саша’), agent(’Лена’)], object(’шоколад’)),
Ph2=likes([agent(’Саша’), agent(’Лена’)], object(’шоколад’)), Y=yes.
```

## Принцип решения

Для начала, введем два важных понятия:
1. Глубинная форма  - форма содержащая в себе только смысл части предложения, без морфологических признаков, не требующая пояснения форм слов.
2. Залог — глагольная категория, которая выражает отношение действия к субъекту (производителю действия) и объекту действия (предмету, над которым действие производится) с основными именными частями предложения — подлежащим и прямым дополнением. Обычно выделяют два основных залога: активный (действительный залог) и пассивный (страдательный залог).
Также в зависимости от того, какой залог имеет глагол, различаются падежи существительных. 

Собственно, для преобразования активных и пассивных форм в глубинные структуры будем использовать эти закономерности.

Из-за специфики данной задачи, движение от частного к общему упростит понимание решения. Последним этапом программы является сравнение двух глубинных форм:

```Prolog
compare(X, Y, Ph1, Ph2, Ans):-
  % составление глубинных форм
  an_phrase(Ph1, _, X),
  an_phrase(Ph2, _, Y),
  cmp(Ph1, Ph2, Ans), !.

cmp(X, Y, Ans):-
  X = Y, Ans = 'yes', !.
cmp(_,_,'no').
```

Углубимся в предикат составления глубинных форм
```Prolog
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
```
Используя оператор append и тот факт, что с одной стороны от глагола находятся только объекты, а с другой - только субъекты, получаем подсписки объектов и субъектов. Сортируем их, чтобы фразы считались равными независимо от порядка объектов и субъектов и формируем результирующий список, содержащий глубинную форму. 

Одним из "подводных камней" моей задачи было то, что объектов или субъектов может быть больше, чем один. С этой целью были написаны предикаты 'several_agent':
```Prolog
% обработка случая, когда несколько существительных соединены союзом
several_agent([X|Ans], Zalog,[H,Uni|T]):-
  an_mest(X, Zalog, H),
  union(Uni), %предикат союза "и"
  several_agent(Ans, Zalog, T).
  
% вариант, когда существительное одно
several_agent([X], Zalog,[H]):-
  an_mest(X, Zalog, H).
```

Из фразы формируется список с существительными в глубинной форме.
```Prolog
% получение глубинной формы существительного
an_mest(XC, K, X) :- gen_nouns(File1),fid(X, XC, K, File1).

% получение глубинной формы глагола
an_glag(XC, K, Y) :- gen_verbs(File2),fid(Y, XC, K, File2).
```

Поиск глубинных форм использует заранее написанные словари, для которых был реализован предикат поиска
```Prolog
% поиск словоформы в словаре
fid(Word, CanonWord, Type, File):-
  member(X, File),
  condition(Word, CanonWord, Type, X).

condition(W, CW, T, CW:T:L):-
  member(W, L).
```

Для структуры словаря зарезервирован оператор op(200, xfy, ':').

Каждая запись файла-словаря представляет собой структуру Пролога вида:
<Каноническая форма>: <Контекст>: <Список словоформ>.
```Prolog
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
```

## Результаты
```Prolog
?- compare(['Лена', 'и', 'Саша', 'любят', 'шоколад'] , ['шоколад', 'любим', 'Сашей', 'и', 'Леной'], Ph1,Ph2, Y).
Ph1 = Ph2, Ph2 = [likes, ['Лена', 'Саша'], [шоколад]],
Y = yes.

?- compare(['Саша', 'и', 'Лена', 'любят', 'шоколад'] , ['шоколад', 'любим', 'Сашей', 'и', 'Леной'], Ph1,Ph2, Y).
Ph1 = Ph2, Ph2 = [likes, ['Лена', 'Саша'], [шоколад]],
Y = yes.

?- compare(['Саша', 'и', 'Петя', 'любят', 'шоколад'] , ['шоколад', 'любим', 'Сашей', 'и', 'Петей'], Ph1,Ph2, Y).
Ph1 = Ph2, Ph2 = [likes, ['Петя', 'Саша'], [шоколад]],
Y = yes.

?- compare(['Саша', 'и', 'Петя', 'любят', 'шоколад'] , ['шоколад', 'любим', 'Сашей', 'и', 'Леной'], Ph1,Ph2, Y).
Ph1 = [likes, ['Петя', 'Саша'], [шоколад]],
Ph2 = [likes, ['Лена', 'Саша'], [шоколад]],
Y = no.
```

## Выводы

В ходе выполнения данной лабораторной работы был реализован фрагмент естественного-языкового интерфейса к модельной задаче. Также была реализована грамматика для активных и пассивных форм глаголов.

Выделение глубинной формы является важнейшей задачей не только для подобных задач, но и для лингвистики в целом. Однако реализация полноценной программы, способной выделить глубинную форму у любой фразы на данный момент невозможна в связи с нешаблонностью и гибкостью естественных языков.

Prolog очень удобен для решения задач естественного-языкового интерфейса, так как эта задача естественна для логических языков, надо лишь задать два необходимых множества - терминальных и нетерминальных элементов, а также правил перехода, которые будут учитывать контекст.
