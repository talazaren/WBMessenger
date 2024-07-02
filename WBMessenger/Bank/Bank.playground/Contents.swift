import UIKit



final class BankAccount {
    //Соблюдаем инкапсуляцию свойства
    private let number = UUID()
    var accountNumber: UUID {
        number
    }
    //Соблюдаем инкапсуляцию свойства
    private var balance = 0.0
    var accountBalance: Double {
        balance
    }
    
    func deposit(amount: Double) {
        print("\n---- DEPOSIT PROCCESSING ----")
        print("Account: \(accountNumber). Your balance: \(accountBalance)")
        balance += amount
        print("Deposit successful ↗️ Account: \(accountNumber). Your balance: \(accountBalance)")
    }
    
    func withdraw(amount: Double) {
        print("\n---- WITHDRAW PROCCESSING ----")
        print("Account: \(accountNumber). Your balance: \(accountBalance)")
        if amount <= accountBalance {
            balance -= amount
            print("Withdraw successful ↘️ Account: \(accountNumber). Your balance: \(accountBalance)")
        } else {
            print("Withdraw unsuccessful❗️Insufficient funds")
        }
    }
}

final class Bank {
    var accounts: [BankAccount] = []
    
    func addAccount() -> BankAccount {
        let account = BankAccount()
        accounts.append(account)
        return account
    }
    
    func getTotalBalance() {
        var balance: Double {
            accounts.reduce(0.0) { result, account in
                result + account.accountBalance
            }
        }
        print("\n💰Your total balance: \(balance)")
    }
    
    func transfer(fromAccount: BankAccount, toAccount: BankAccount, amount: Double) {
        print("\n---- TRANSFER PROCCESSING ----")
        if amount <= fromAccount.accountBalance {
            fromAccount.withdraw(amount: amount)
            toAccount.deposit(amount: amount)
            print("\nTransfer successful ↗️ \nAccount: \(fromAccount.accountNumber). Your balance: \(fromAccount.accountBalance) \nAccount: \(toAccount.accountNumber). Your balance: \(toAccount.accountBalance)")
        } else {
            print("Transfer unsuccessful❗️Insufficient funds")
        }
    }
}

let bank = Bank()

var account1 = bank.addAccount()
account1.deposit(amount: 1000)
account1.withdraw(amount: 500)
account1.withdraw(amount: 2000)

var account2 = bank.addAccount()
account2.deposit(amount: 5000)

bank.transfer(fromAccount: account2, toAccount: account1, amount: 7000)
bank.transfer(fromAccount: account2, toAccount: account1, amount: 1000)

bank.getTotalBalance()

