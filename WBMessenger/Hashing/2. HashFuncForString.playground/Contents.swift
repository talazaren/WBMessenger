import Foundation

private func customSimpleHash(for string: String) -> Int {
    let multiplier = 77 // постоянный множитель, на который будем умножать каждое значение
    let limit = 1_000_000_000 // ограничиваем размер хеша
    var hashValue = 0 // начальное значение хеша
    
    // перебираем строку, для каждого символа находим ASCII значение,
    // далее считаем хеш с помощью побитовых операторов (чтобы избежать переполнения и ошибки)
    string.forEach { char in
        let asciiValue = Int(char.asciiValue ?? 0)
        hashValue = (hashValue &+ asciiValue) &* multiplier
    }
    // возвращаем хеш в пределах заданного диапазона, применяя оператор остатка от деления
    return hashValue % limit
}

let testString = "Hello, David!"
let hashValue = customSimpleHash(for: testString)
print(hashValue)

