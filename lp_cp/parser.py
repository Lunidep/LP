inp = open("input.ged", "r")
out = open("output.pl", "w")

base = {}#создаем словарь

for line in inp.readlines():#делим файл построчно
    words = line.split(" ") #делим строки по пробелам
    
    if len(words) >= 3:#полезная информация для моего представления данных содержится только в строках, состоящих из >= 3 слов
        #т.к. первое "слово" в строке - это номер поколения, который не нужен, то можно считывать строки, начиная со второго слова
        first = words[1] 
        second = words[2]
        
        if second[0] == "I":#индекс человека в дереве используем как key для словаря
            key = first
            
        elif first == "GIVN":#считываем имя
            name = second
            
        elif first == "SURN":#считываем фамилию
            surn = second
            base.update({key:(name[:-1], surn[:-1])})#добавляем имя и фамилию в словарь по key



        #по заданию требуется преобразовать файл в формате GEDCOM в набор утверждений на языке Prolog с использованием предикатов father(отец, потомок) и mother(мать, потомок)
        #для этого из раздела информации о семье связываем по key родителя и ребенка

        elif first == "HUSB":
            husb = second
            
            for k, (n, s) in base.items():
                
                if k == husb[:-1]:
                    father = n + " " + s
                    
        elif first == "WIFE":
            wife = second
            
            for k, (n, s) in base.items():
                
                if k == wife[:-1]:
                    mother = n + " " + s
                    
        elif first == "CHIL":
            chil = second
            
            for k, (n, s) in base.items():
                
                if k == chil[:-1]:
                    child = n + " " + s
                    
            #запишем в прологовский файл интересующие нас предикаты       
            f = "father(%r, %r).\n" % (father, child)
            m = "mother(%r, %r).\n" % (mother, child)

            out.write(f)
            out.write(m)
   
out.close()
inp.close()


