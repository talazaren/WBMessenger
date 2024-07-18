import Foundation

final class Person {
    let fullName: String
    let age: Int
    var passport: Passport?

    init(fullName: String, age: Int) {
        self.fullName = fullName
        self.age = age
        print("\(fullName) is being initialized")
    }

    deinit {
        print("✅\(fullName) is being deinitialized")
    }
}

final class Passport {
    let series: Int
    let number: Int
    let issueDate: Date
    var owner: Person?

    init(series: Int, number: Int, issueDate: Date, owner: Person) {
        self.series = series
        self.number = number
        self.issueDate = issueDate
        self.owner = owner
        print("Passport \(series) \(number) is being initialized")
    }

    deinit {
        print("✅Passport \(series) \(number) is being deinitialized")
    }
}

final class Factory {
    var employees: [Person] = []
    
    func hireEmployee(newEmployee: Person) {
            employees.append(newEmployee)
            print("\(newEmployee.fullName) is hired at the Factory")
        }

    func fireEmployee(fullName: String) {
        if let index = employees.firstIndex(where: { $0.fullName == fullName }) {
            let employee = employees.remove(at: index)
            print("\(fullName) is fired from the Factory")
            employee.passport = nil
        } else {
            print("Employee \(fullName) not found")
        }
    }
}

// MARK: Testing
func testFactory() {
    let factory = Factory()

    print("\n----INITIALIZING PROCESS----")
    let person1 = Person(fullName: "Tim Cook", age: 40)
    let person2 = Person(fullName: "Taylor Swift", age: 30)

    person1.passport = Passport(series: 2244, number: 335577, issueDate: Date(), owner: person1)
    person2.passport = Passport(series: 1133, number: 224466, issueDate: Date(), owner: person2)

    print("\n----HIRING PROCESS----")
    factory.hireEmployee(newEmployee: person1)
    factory.hireEmployee(newEmployee: person2)

    print("\n----FIRING PROCESS----")
    factory.fireEmployee(fullName: "Saylor Twift")
    factory.fireEmployee(fullName: "Taylor Swift")
}

testFactory()



