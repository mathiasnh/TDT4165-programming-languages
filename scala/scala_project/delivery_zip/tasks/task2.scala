import java.util.concurrent.atomic.AtomicInteger
import scala.concurrent.Future
import scala.concurrent.Await
import scala.concurrent.duration._
import scala.concurrent.ExecutionContext.Implicits.global

object Task2 extends App {
    // (a)
    def createThread(f: => Unit): Thread = {
        new Thread {
            override def run() {
                f
            }
        }
    }

    // (b)
    private var counter: Int = 0
    def increaseCounter(): Unit = {
        counter += 1
    }

    def printCounter(): Unit = {
        println(counter)
    }

    createThread(increaseCounter).start
    createThread(increaseCounter).start
    createThread(printCounter).start

    // This phenomenon is called the race condition, and it happens because the outputs of the program depend on the timing at which the 
    // statements in separate threads get executed. This is problematic in cases where statements from each thread do not happen atomically.
    // An example would be if you were to buy tickets to a movie online. When you check to see if there are any tickets avaiable, it says that 
    // there are. But in the time window between you looking at the tickets and when you pressed purchase, someone else bought them. The interleaving 
    // actions on a shared resource caused an unexpected (and undesired) result. 

    // (c)
    val safeCounter: AtomicInteger = new AtomicInteger
    def safeIncreaseCounter(): Integer = {
        safeCounter.incrementAndGet
    }

    def printSafeCounter(): Unit = {
        println(safeCounter.get)
    }

    createThread(safeIncreaseCounter).start
    createThread(safeIncreaseCounter).start
    createThread(printSafeCounter).start

    // (d)
    // A deadlock occurs when a set of two or more threads acquire resources and then waits for the other threads to release their resources.
    // This typically happens when sending messages. To prevent deadlocks, one has to eliminate any of the four deadlock conditions:
    //  - Mutual exclution
    //  - Hold and Wait
    //  - No preemtion
    //  - Circular wait 

    object A {
		lazy val start = B.accessA
		lazy val x = 10
	}

	object B {
		lazy val accessA = A.x
	}

	object Deadlock {
		def run = {
			val result = Future.sequence(Seq(
			Future { A.start },
			Future { B.accessA } 
			))
			Await.result(result, 5 seconds)
		}
	}
	Deadlock.run

}