object Task1 extends App {
    // (a)
    var generated: Array[Int] = Array()
    for (i <- 1 to 50) generated :+= i
    //for (num <- generated) println(num)

    // (b)
    def sum(array: Array[Int]): Int = {
        var sum: Int = 0 
        for (num <- array) sum += num
        sum
    }
    //println(sum(Array(1,2,3,4)))

    // (c)
    def sum_recursive(array: Array[Int]): Int = {
        if (array.isEmpty) {
            0
        } else {
            array(0) + sum_recursive(array.drop(1))
        }
    }
    //println(sum_recursive(Array(1,2,3,4,5)))

    // (d)
    def nth_fibonacci(n: BigInt): BigInt = {
        if (n == 0 || n == 1) {
            n
        } else {
            nth_fibonacci(n-1) + nth_fibonacci(n-2)
        }
    }
    //println(nth_fibonacci(10))
    
    // Question: bigint vs int difference
	// They take up different amounts of space and they have different ranges of acceptable values. (int has 4 bytes, bigint 8)
	// The bigint data type is intended for use when integer values might exceed the range that is supported by the int data type.
	
}