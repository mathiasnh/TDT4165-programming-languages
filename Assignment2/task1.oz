
% The Length function recursively traverses through the List until there are no elements left, then it bubbles up
% and adds 1 for for every time the function was called. The function will be called as many times as there are
% elements in the list, and thus Length returns the length of the list. 
fun {Length List}
    case List of _|Tail then %Check if the list has any elements
        1 + {Length Tail} 
    else 
        0
    end
end


% Take recursively traverses to a List, reducing the Count value by 1 every time the function is called, until 
% Count reaches 0. Count = 0 means that we've 'visited' all the List's values that have indexes smaller than Count,
% and when we bubble back up from the base case, we append all those values to the returned list. This will return
% a list of the first Count elements. 
fun {Take List Count}
    case List of Head|Tail then
        if Count == 0 then %Base case
            nil
        else 
            Head|{Take Tail Count-1} %Append the Head of the List to the returned list 
        end
    else 
        nil
    end
end


% Drop works similarly to Take, but it ignores the head of the list at every recursive call. When Count reaches 0, we've
% dropped the first Count elements, and we return the rest of the list.
fun {Drop List Count}
    case List of _|Tail then %_ means that we don't care about that value (in this case the head)
        if Count == 0 then
            List
        else 
            {Drop Tail Count-1}
        end
    else 
        nil
    end
end


% Append recursively travels through two lists (beginning with List1) until both are empty. When, at last, List2 is empty
% we bubble up and append the elements of List2 then the elements of List1 to the returned list. This results in 
% a new list with all elements of List1 followed by all elements of List2.
fun {Append List1 List2}
    case List1#List2 of nil#(Head2|Tail2) then %if List1 is empty but List2 is not
        Head2|{Append nil Tail2}
    [] (Head1|Tail1)#_ then %if List1 is not empty we don't care about List2, because we always want to empty List1 first
        Head1|{Append Tail1 List2}
    else %Base case: both lists are empty
        nil
    end
end


% Member recursively traverses through a List until we find a value that is equal to the input Element. If we find such a value
% we return true, if not we return false.
fun {Member List Elem}
    case List of Head|Tail then %if List is not empty
        if Head == Elem then 
            true
        else 
            {Member Tail Elem} %Head was not the value we wanted, so we continue with the rest of the list 
        end
    else 
        false
    end
end
    

% Position takes in a list and an element, and recursively traverses the list until a value is found that is equal to the element. 
% When that value is found, we bubble back up and add 1 for every time Position is called. The returned value is then the index (i.e.
% the position) of the element.
fun {Position List Elem}
    if List.1 == Elem then %Base case: head of List is equal to Elem
        1 % 0 if 0-indexed
    else 
        1 + {Position List.2 Elem}
    end
end