import scala.concurrent._

class Bank(val allowedAttempts: Integer = 3) {

    private val transactionsQueue: TransactionQueue = new TransactionQueue()
    private val processedTransactions: TransactionQueue = new TransactionQueue()

    def addTransactionToQueue(from: Account, to: Account, amount: Double): Unit = {
        val t = new Transaction(transactionsQueue, processedTransactions, from, to, amount, allowedAttempts) // creates a new transaction object 
        transactionsQueue push t // puts the transaction object in the queue
        val thread: Thread = new Thread { // spawns a thread
            override def run() = processTransactions
        }
        thread.start // runs the thread and calls processTransactions
    }

    private def processTransactions: Unit = {
        val t: Transaction = transactionsQueue.pop // pops a transaction from the queue
        t.run() // executes the transaction
        if (t synchronized { t.status == TransactionStatus.PENDING }) {
            transactionsQueue push t 
            processTransactions
        } else { // if transaction succeeds 
            processedTransactions push t
        }
    }

    def addAccount(initialBalance: Double): Account = {
        new Account(this, initialBalance)
    }

    def getProcessedTransactionsAsList: List[Transaction] = {
        processedTransactions.iterator.toList
    }

}
