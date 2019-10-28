% Generates a stream of odd numbers in a given interval 
fun {GenerateOdd S E}
    if S =< E then
        if {Int.isOdd S} then
            S|{GenerateOdd S+1 E}
        else
            {GenerateOdd S+1 E}
        end
    else nil end
end

% Calculates the product of all elememts in the list S
fun {Product S}
    case S of Elem1|Elem2|Tail then 
        {Product Elem1*Elem2|Tail}
    [] Prod|nil then 
        Prod
    end
end