fun {RightFold List Op U}               % Function definition
    case List of Head|Tail then         % Case for when the list os not empty. List comprehensions: Head is first element, Tail is the rest of List
        {Op Head {RightFold Tail Op U}} /* The bread and butter of RightFold. We assume that the Op function always takes two parameters.
                                            The input List is traversed recursively, and the Head of the list is popped (and "saved") at every 
                                            recursive call. When the List is empty, the Op function is applied to the whole list from right to left,
                                            starting with the neutral element U, like this: Head1 (Head2 (Head3(...(U)))). In the case of Sum, each
                                            individual Head would be added to the accumulated sum at each step on the way up to the proverbial "surface",
                                            while in the case of Length, the Heads would be ignored and instead 1 is added at each step. */
    else                                % If the list is empty
        U                               % The rightmost value - the first on which the Op function is applied. Naturally 0 for both Length and Sum.
    end                                 % No other relevant matches
end                                     % End of function

/*
Length implemented with RightFold. An anonymous function is passed as a parameter to RightFold and used to calculate the length of List. 
U = 0 because we want to ignore when the list is empty 
*/
fun {FoldLength List}
    {RightFold List fun {$ _ Y} 1 + Y end 0}
end

/* 
Sum implemented with RightFold. An anonymous function is passed as a parameter to RightFold and used to calculate the sum of the elements in List. 
U = 0 because we want to ignore when the list is empty
*/
fun {FoldSum List}
    {RightFold List fun {$ X Y} X + Y end 0}
end