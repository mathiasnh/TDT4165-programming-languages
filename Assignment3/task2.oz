/*
Calculates the sum of the elements in List
*/
fun {Sum List}
    case List of Head|Tail then 
        Head + {Sum Tail}
    else 
        0
    end
end