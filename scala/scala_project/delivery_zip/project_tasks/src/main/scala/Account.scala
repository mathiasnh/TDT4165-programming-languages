import exceptions._

class Account(val bank: Bank, initialBalance: Double) {

    class Balance(var amount: Double) {}

    val balance = new Balance(initialBalance)

    // TODO
    // for project task 1.2: implement functions
    // for project task 1.3: change return type and update function bodies
    def withdraw(amount: Double): Either[String, String] = {
        balance synchronized {
            if (balance.amount - amount < 0) {
                return Right("No sufficient funds!")
            }
            if (amount < 0) {
                return Right("Illegal input! Please use a positive amount.")
            }
            balance.amount -= amount
            Left("Success!")
        }
    }

    def deposit (amount: Double): Either[String, String] = {
        balance synchronized {
            if (amount < 0) {
                return Right("Illegal input! Please use a positive amount.")
            }
            balance.amount += amount
            Left("Success!")
        }
    }

    def getBalanceAmount: Double       = balance.amount

    def transferTo(account: Account, amount: Double) = {
        bank addTransactionToQueue (this, account, amount)
    }


}
