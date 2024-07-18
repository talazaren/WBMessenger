import Foundation

//MARK: - 1. Создаем словарь [Город : Население]

var dictionary = [
    "Moscow" : 13_149_803,
    "London" : 9_648_110 ,
    "Paris" : 2_102_650,
    "Tokyo": 8_967_680
]

print("🍎 Start dictionary: \(dictionary)\n")

//MARK: - Добавляем несколько пар в словарь
dictionary["New-York"] = 8_467_513
dictionary["Seoul"] = 9_443_722

print("🍋 Dictionary with new key-values: \(dictionary)\n")

//MARK: - Удаляем одну пару ключ-значение с сохранением удаленного значения и без
let removedValue = dictionary.removeValue(forKey: "Seoul") // сохранили удаляемое значение
dictionary["Paris"] = nil // не сохранили

print("🫐 Dictionary after deleting values: \(dictionary)\n")

//MARK: - Обновляем значение для одного из ключей с сохранением старого значения и без
let oldValue = dictionary.updateValue(14_000_000, forKey: "Moscow") // сохранили старое значение
dictionary["Moscow"] = 13_000_000 // просто обновили

print("🥝 Dictionary with updated values: \(dictionary)\n")

//MARK: - Получаем значение для одного из ключей
let value = dictionary["London"]

print("Population of London: \(value ?? 0)")

