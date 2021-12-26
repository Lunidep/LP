# Реферат
## по курсу "Логическое программирование"

### студент: Попов И. П.
## ТЕМА "Логические языки как первые языки для обучения программированию"

## Результат проверки

| Преподаватель     | Дата         |  Оценка       |
|-------------------|--------------|---------------|
| Сошников Д.В. |              |               |
| Левинская М.А.|              |               |

> *Комментарии проверяющих (обратите внимание, что более подробные комментарии возможны непосредственно в репозитории по тексту программы)*

## Введение
Выбирая первый язык программирования, обучающийся должен ответить себе на один очень важный вопрос: «решение задач какого рода привлекает меня?».

Исходя из ответа на этот вопрос, он должен будет определиться с направлением своей дальнейшей реализации, как программиста. Это может быть мобильная разработка, frontend, такое направление выбирают те, кто хочет видеть на экране результат своей работы — красиво сверстанную страницу. Или же это будет backend – разработка невидимой пользователю стороны приложений, им интересуются те, кто любит работать непосредственно с логикой, реализовывать сложные алгоритмы. Также существуют такие направления, как разработка игр, Desktop-приложений, Data Science разработка и многие другие.

Разумеется под каждый вид деятельности существуют свои инструменты – языки программирования и, выбрав направление по душе можно начать изучать необходимый язык, становясь настоящим профессионалом в своем деле. 

В данном реферате, будет дана подробная характеристика логическим языкам, как первым языкам для обучения программированию и будут освещены такие темы, как:

1.	Парадигмы программирования;
2.	Prolog и Mercury – основные представители логических языков;
3.	Возможности логических языков;
4.	Преимущества и недостатки логических языков как первых языков для обучения программированию.
 
## Парадигмы программирования
`Парадигма программирования` — это совокупность идей и понятий, определяющих стиль написания компьютерных программ (подход к программированию). Это способ концептуализации, определяющий организацию вычислений и структурирование работы, выполняемой компьютером.

Разберем основные парадигмы программирования.

### Императивная парадигма
Из названия сразу становится понятно, что императивное программирование (англ. imperative — приказ, повелительное наклонение) является способом передачи процессору последовательности команд на выполнение. Оно представляет собой последовательное выполнение некоторых инструкций(команд), с последующей записью в память результатов их выполнения. Результат выполнения предыдущей инструкции может использоваться последующими посредством чтения из памяти.

Основные черты императивных языков заключаются в использовании:
1.	Именованных переменных;
2.	Оператора присваивания;
3.	Составных выражений;
4.	Подпрограмм.

Языкам императивной парадигмы присущ стиль понятный для компьютера, стиль, в котором компьютер выполняет программы. Он в основном применяться для решения задач, связанных с последовательным выполнением команд, такими задачами, например, являются управление современными ЭВМ. Однако, оперирование понятиями, понятными компьютеру делает императивные программы совершенно не свойствеными человеческой природе.

Объектно-ориентируемое программирование или структурное программирование также являются видами императивного программирования.

### Декларативная парадигма
Декларативная парадигма является полной противоположностью императивной. Если в последней человек должен «рассказать» компьютеру на его языке четкую последовательность действий, как получить из входных данных выходные, то декларативные языки позволяют задать лишь спецификацию решения задачи и ожидаемый результат. Иными словами, декларативное программирование идёт от человека к машине, тогда как императивное — от машины к человеку.

Сейчас декларативное программирование широко используется для написания исполнимых спецификаций. Программа представляет собой формальную теорию задает базу фактов, и полный набор всевозможных правил взаимодействия с ними. Выполнение этой программы будет являться доказательством рассматриваемой теории (соответствие Карри — Ховарда).

Также стоит отметить, что многие характерные для императивного программирования составляющие процесса разработки (проектирование, рефакторинг, отладка и другие) попросту исключаются: программа проектирует и доказывает сама себя.

Одной из ветвей декларативной парадигмы является логическое программирование. Оно заключается в использовании теории и аппарата математической логики. Самым известным языком, основанным на логическом программировании, является Prolog.


## Prolog и Mercury – основные представители логических языков

### Prolog (от “PROgramming in LOGic”) 
Prolog является одним из старейших языков, основанных на парадигме логического программирования. Он использует один из самых естественных способов описания задач — математическую логику. Основные области его использования: обработка естественных языков, символьных вычислений, работы в области искусственного интеллекта, онтологиях и других предметных областях, для которых эффективно использование логической парадигмы.

Так как Prolog является декларативным языком, программы, написанные на нем, будут сильно отличаться от программ, написанных на императивных языках. Prolog не содержит каких-либо управляющих конструкций и даже оператора присваивания. Однако влияние декларативной парадигмы будет отражаться не только на коде, но и на способе описания программистом выполняемой задачи. Она задается некоторым набором фактов и правил, исходя из которых, при компиляции программы выполняется поиск решений.

Prolog поддерживается всеми известными ОС: Unix-семейство, Windows, ОС для мобильных платформ.

Наиболее существенными недостатками Prolog’а являются низкая производительность (зачастую решения задач на императивных языках в сочетании с базами данных являются более эффективными, нежели аналогичные решения на Prolog) и трудность отладки (в связи с недостаточным контролем промежуточных этапов вычисления).

Основные черты, которые Prolog позаимствовал от своего предшественника языка Planner:
1.	Ход решения представляет собой построение дерева и поиск в нем нужного элемента;
2.	При обнаружении неуспеха, выполняется откат назад с использованием механизма бэктрекинга;
3.	Используется принцип “отрицание как неудача”;
4.	Одной из основных составляющих программ на данном языке являются предложения, состоящие из термов и заканчивающиеся точкой;

         Типы термов:
         1.Числа и строки;
         2.Атомы;
         3.Переменные;
         4.Составной терм.
 
Логику Prolog программы можно описать при помощи клауз Хорна, они могут быть представлены в виде *Голова*: - *Тело*, читается это как «для доказательства истинности головы необходимо доказать истинность тела». Тело состоит из нескольких предикатов, соединенных конъюнкцией или дизъюнкцией. Предикаты выражают отношения между своими аргументами и могут работать в любых направлениях, в зависимости от исходных данных.

В качестве примера кода на двух рассматриваемых языках логического программирования, будут приведены программы нахождения факториала числа и задачи про числа Фиббоначчи.

Следующий пример, взят из книги «Парадигма логического программирования» Дмитрия Валерьевича Сошникова, демонстрирует, как Prolog позволяет естественно представить задачу:

Рассмотрим задачу `вычисления факториала`, сформулированную на языке логического программирования Prolog.
```prolog
fact(0, 1).
fact(N, F) :-
    N > 0,
    N1 is N - 1,
    fact(N1, F1), F is N * F1.
```
Данный пример является практически дословной перефразировкой определения факториала: 0! = 1, n! = (n — 1)! * n, (n > 0).

`Числа Фиббоначи` на языке Prolog можно подсчитать различными способами, например, обычной рекурсией, хвостовой рекурсией или корекурсией. Ниже приведен пример программы использующей корекурсию.
```prolog
corec_fib(0, 0):-!.
corec_fib(1, 1):-!.
corec_fib(N,RESULT):-func2(2,N,1,1,RESULT).

func2(N_RES, N_RES, _, RESULT, RESULT):-!.
func2(N, N_RES, Prev1, Prev2,F):-
    New_Prev1 is Prev2,
    New_Prev2 is Prev1+Prev2,
    N1 is N+1,
    func2(N1, N_RES, New_Prev1, New_Prev2, F).
```
 
### Mercury
В 2014 году Университет Мельбурна представил миру новый функционально-логический язык программирования со строгой типизацией, системой режимов аргументов и детерминизмом предикатов – язык Mercury. Он унаследовал от языка Prolog некоторые элементы синтаксиса и систему типов от Haskell.

Что же послужило целью создания нового логического языка программирования, когда имелся уже готовый вариант – Prolog? Казалось бы, на нем можно успешно и относительно легко решать различные задачи анализа естественного языка, задач символьных вычислений и задач искусственного интеллекта, однако он так и не получил широкого применения в коммерческом программировании и используется в основном в целях обучения парадигме логического программирования. На то есть две главные причины:

1.	Проблема производительности. Логические языки программирования существенно уступают в скорости своим императивным собратьям, потому что являются интерпретируемыми языками;
2.	Стремясь увеличить производительность, разработчикам пришлось внедрять в язык некоторые не декларативные возможности, такие как циклы по неуспеху и отсечения. В итоге при создании производительной программы теряются преимущества декларативного программирования, что значительно усложняет понимание кода, его отладку и поддержку.

Основная цель создания Mercury состояла в том, чтобы решить обе эти проблемы.

Этот язык получился полностью декларативным, и лишенным императивных возможностей, что получилось реализовать путем объединения в одной парадигме элементы логического и функционального программирования. В нем также присутствует обширная система типов, режимы аргументов, категории детерминизма предикатов и условные операторы. Данная реализация показала себя очень удачной и цель создания языка была достигнута. Также стоит отметить, что оптимизация программы выполняется, непосредственно, компилятором, что, несомненно, облегчает работу программиста с языком.

Название Mercury было выбрано не случайно, разработчики хотели подчеркнуть основное преимущество своего творения, а именно высокую для логических языков программирования скорость, поэтому назвали язык в бога скорости Меркурия. Это название полностью себя оправдывает, Mercury в разы опережает по производительности современные реализации Prolog.

Из дополнительных особенностей можно выделить:
1.	Значительно более «умный» компилятор, нежели в Prolog, который может обращать внимание программиста на многие логические ошибки, что повышает надежность кода;
2.	Возможность транслировать код, написанный на Mercury во многие популярные языки программирования, такие как: C, Java, Erlang и др.

Программа, `вычисляющая факториал` числа 5 на языке Mercury

```mercury
:- module factorial.
:- interface.
:- import_module io.
:- pred main(io::di, io::uo) is det.
:- implementation.
:- import_module int.
:- func factorial(int) = int.
factorial(N) = ( if N = 0 then 1 else N * factorial(N - 1)).
main(!IO) :-
    io.write_string("factorial(5)= ", !IO),
    io.write_int(factorial(5), !IO),
    io.nl(!IO).
```

Программа, вычисляющая 10-ое `число Фибоначчи`
```mercury
 :- module fib.
 :- interface.
 :- import_module io.
 :- pred main(io::di, io::uo) is det.
 :- implementation.
 :- import_module int.
 :-func fib(int) = int.
 fib(N) = (if N =< 2 then 1 else fib(N - 1) + fib(N - 2)).
 main(!IO) :-
        io.write_string("fib(10) = ", !IO),
        io.write_int(fib(10), !IO),
        io.nl(!IO).
```


## Возможности логических языков

### Анализ естественного языка.

Одной из основных задач искусственного интеллекта является анализ естественного языка. Процесс обработки естественного языка сложен тем, что язык довольно трудно полностью формализовать (несмотря на попытки множества гуманитарных наук) и представить в виде, понятному компьютеру.

Но некоторые задачи, обладающие достаточной формализацией, такие как грамматический анализ предложения, будет естественно реализовать с использованием логических языков из-за того, что во многих случаях возможно применение сразу нескольких правил и необходимо применять перебор всех вариантов. Для решений подобных задач как нельзя лучше подойдут такие языки, как Prolog, в которых реализован процесс перебора с возвратами.

По этим же причинам, логические языки программирования удобны для решения задач символьных вычислений, грамматического разбора и анализа естественных и искусственных языков.

### Решение задач искусственного интеллекта.

Основным инструментом для решения задач искусственного интеллекта с помощью логических языков программирования является метод решения логических задач с помощью пространства состояний, которое может быть реализовано в виде графа, вершины которого являются состояниями системы, дуги - правилами перемещения между ними. С помощью алгоритмов поиска мы можем найти путь из начального состояния в конечное, он и будет решением задачи.

В отличии от императивных языков программирования, в которых обычно используют матрицы смежности, в логических языках граф описывается путем задания дуг явным перечислением или при помощи правил, что позволяет описывать таким образом сложные и большие графы, для которых матричное представление нерационально и вообще не всегда возможно.


## Преимущества и недостатки логических языков как первых языков для обучения программированию
Опираясь на приведенную выше информацию, и оперируя полученными знаниями, попробуем выделить преимущества и недостатки логических языков программирования.

Подтверждением того, что логические языки хороши для первого опыта изучения языков программирования, можно отнести следующие факты:
1. Логические языки являются эффективными при решении логических задач, задач искусственного интеллекта, задач символьных вычислений и позволяют анализировать естественный язык;
2. От программиста требуется только описание того, что представляет из себя задача и какой должен быть результат.
Для сравнения, в императивных языках необходимо четко описать компилятору путь решения задачи, то есть, можно сказать, что логические языки более «дружелюбны» по отношению к человеку, так как они позволяют естественно для человека ставить задачу;
3. Скорость разработки программ на логических языках программирования выше, чем на императивных языках, так как программа сама прокладывает себе путь до цели по указанным программистом способам ее достижения из начального состояния;
4. Следствием того, что логические языки позволяют естественно для человека описывать задачу, является легкость чтения кода по сравнению с традиционными языками программирования;
5. Из предыдущего пункта следует, что поддержка и сопровождение программ логической парадигмы будет проще, нежели для программ императивной парадигмы;
6. Логические языки практически не содержат синтаксических конструкций, что ускоряет освоение языка.

Несмотря на то, что логические языки и обладают большим количеством плюсов, они также имеют достаточным количеством недостатков таких, как:
1. Логические языки развиваются значительно медленнее своих императивных собратьев;
2. Логические языки плохо подходят для работы с вычислительными операциями.


## Выводы

Итак, стоит ли начинать обучение программированию с логических языков? 

С одной стороны, они могут быть удобны начинающему программисту с точки зрения своей естественной языковой структуры. Также очень функциональные программы, написанные на логических языках, могут быть невелики по объему, что не может не радовать программистов. С другой стороны, исходя из того факта, что большинство людей изучают свой первый язык программирования еще за школьной скамьей, можно сделать вывод, что логическое программирование с его специфическим подходом к решению задач будет чересчур сложным для юных программистов. 

На мой взгляд, стоит начинать изучать программирование все же с императивных языков, в которых уровень абстракции в разы ниже, нежели в логических. Однако в дальнейшем, по моему мнению, для расширения кругозора и развития логического мышления каждому программисту стоит ознакомиться с парадигмой логического программирования. 

Также если человеку интересны такие направления деятельности, как создание программ искусственного интеллекта или анализа естественного языка, то ему просто необходимо ознакомиться с концепцией логического программирования и владеть языками этой парадигмы. 


## Список литературы

1. Сошников Д. В. Парадигма логического программирования. (2009)
2. Frank Pfenning. Types in Logic Programming. (1992)
3. Братко И. Программирование на языке пролог для искусственного интеллекта.
4. Зюзьков В. М. Математическое введение в декларативное программирование.
4. Prolog [Электронный ресурс].  
URL: https://ru.wikipedia.org/wiki/Пролог_(язык_программирования) (дата обращения:13.12.2021). 
4. Mercury [Электронный ресурс].  
URL: https://ru.wikipedia.org/wiki/Mercury_(язык_программирования) (дата обращения:13.12.2021). 
5. Язык программирования Mercury. Что такое Mercury? [Электронный ресурс].  
URL: https://mercurylanguage.ucoz.ru/ (дата обращения:13.12.2021). 
