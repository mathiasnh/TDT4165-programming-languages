% Higher-order programming is the ability to pass functions as arguments

/* 
With the use of an anonymous function we assure the finity of the final list - we only return a list with a length that satisfies our needs. 
In other words, we achieve laziness by returning a list V|f(V+1), where f(V+1) is a function that returns V+1|f(V+1+1) and so on...
*/
fun {LazyNumberGenerator StartValue}
    StartValue|fun {$} {LazyNumberGenerator StartValue + 1} end
end