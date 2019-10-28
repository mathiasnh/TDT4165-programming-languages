object Task2 extends App {
    def thread(f: () => Unit): Thread = {
        new Thread {
            override def run {
                f()
            }
        }
    }
}