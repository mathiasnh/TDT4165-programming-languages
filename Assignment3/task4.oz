/* 
Takes in 3 values and creates a function that can be used to calculate f(x) of a quadratic polynomial.
The returned function is an anonymous function taking X as an argument. 
*/
fun {Quadratic A B C}
    fun {$ X}
        A*X*X + B*X + C 
    end
end