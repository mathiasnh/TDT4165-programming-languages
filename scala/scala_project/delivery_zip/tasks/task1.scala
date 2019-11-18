object Task1 extends App {
    // (a)
    var xs: Array[Int] = Array()
    for (i <- 1 to 50) xs :+= i
    //Test (prints numbers 1-50):
    //for (x <- xs) println(x)

    // (b)
    def sum(xs: Array[Int]): Int = {
        var sum: Int = 0 
        for (x <- xs) sum += x
        sum
    }
    //Test (prints sum of 1,2,3,4 = 10):
    //println(sum(Array(1,2,3,4)))

    // (c)
    def sum_recursive(xs: Array[Int]): Int = {
        if (xs.isEmpty) {
            0
        } else {
            xs(0) + sum_recursive(xs.drop(1))
        }
    }
    //Test (Prints sum of 1,2,3,4,5 = 15)
    //println(sum_recursive(Array(1,2,3,4,5)))

    // (d)
    def fib(n: BigInt): BigInt = {
        if (n == 0 || n == 1) {
            n
        } else {
            fib(n-1) + fib(n-2)
        }
    }
    //Test (prints the 10th fibonacci number)
    //println(fib(10))
    
    // What is the difference between BigInt and Int?
    // The difference is the amount of space they take up in memory and the different ranges of acceptable values. An Int is 4 bytes while a BigInt is 8 bytes.
    // You would want to use BigInt in cases of integer arithmetic where the values can exceed the range supported by regular Int, so you can prevent overflow.
}