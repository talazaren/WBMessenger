import Foundation

private func stringToHash(for string: String) -> Int {
    string.hashValue
}

let text = "Бесконечное количество математиков заходят в бар..."
let hashValue = stringToHash(for: text)

print(hashValue.formatted())
