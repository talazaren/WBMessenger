import Foundation

//MARK: - 1. Создание множества целых чисел
var set : Set<Int> = [8, 44, 0, 78, 1, 100, 9999]

//MARK: - 2. Добавление нескольких элементов
set.insert(1) // видим, что еще одна 1 не добавилась, так как это уникальная коллекция
set.insert(25)
set.insert(99)

//MARK: - 3. Удаление одного элемента
set.remove(1)

//MARK: - 4. Проверка, содержится ли определенный элемент в множестве
let number = 1
let check = set.contains(number)

print(check ? "👍 set contains \(number)\n" : "👎 set is not contains \(number)\n")

//MARK: - 5. Применение операции объединения, пересечения и разности на множествах
var anotherSet : Set<Int> = [0, 666, 8, 99, 100, 4]

let unionedSet = set.union(anotherSet) // сеты объединили свои значения без повторов
print("Unioned set: \(unionedSet)\n")

let intersectedSet = set.intersection(anotherSet) // в сет добавились только те значения, которые содержатся в обоих сетах
print("Intersected set: \(intersectedSet)\n")

let substractedSet = set.subtracting(anotherSet) // в сет добавились только те значения, которые НЕ содержатся в обоих сетах
print("Substracted set: \(substractedSet)\n")
