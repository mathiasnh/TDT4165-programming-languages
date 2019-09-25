% In a tail recursive function each function call is the "last thing" in the calling function (nothing remains to be done after the calls return).
% This was not the case for my implementation of Sum in task 2.

% Tail recursive version. Instad of a stack, we have an accumulator variable (Sum) that is returned at the end.
fun {TailSum List}
    fun {Iterate List Sum}
        case List of Head|Tail then
            {Iterate Tail Head + Sum}
        else
            Sum
        end
    end
in
    {Iterate List 0}
end