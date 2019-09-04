functor
import
    Application(exit:Exit)
    System
define
    fun {Length List}
        case List of _|Tail then
            1 + {Length Tail}
        else 
            0
        end
    end

    fun {Take List Count}
        case List of Head|Tail then
            if Count == 0 then
                nil
            else 
                Head|{Take Tail Count-1}
            end
        else 
            nil
        end
    end

    fun {Drop List Count}
        case List of _|Tail then
            if Count == 0 then
                List
            else 
                {Drop Tail Count-1}
            end
        else 
            nil
        end
    end

    fun {Append List1 List2}
        if {Length List1} \= 0 then
            List1.1|{Append List1.2 List2}
        else if {Length List2} \= 0 then
            List2.1|{Append List1 List2.2}
        else 
            nil end
        end
    end

    % Cheeky version
    fun {Append_ L1 L2}
        case L1#L2 of nil # (H2|T2) then
            H2|{Append_ nil T2}
        [] (H1|T1) # _ then
            H1|{Append_ T1 L2}
        else 
            nil
        end
    end

    fun {Member List Elem}
        case List of H|T then 
            if H == Elem then 
                true
            else 
                {Member T Elem}
            end
        else 
            false
        end
    end
        
    fun {Position List Elem}
        if List.1 == Elem then
            1 % 0 if 0-indexed
        else 
            1 + {Position List.2 Elem}
        end
    end
         
    % {System.showInfo {Length [1 2 3 4 10 123 2 3 1 6]}}
    % {System.show {Take [1 2 3 4] 3}}
    % {System.show {Drop [1 2 3 4 5] 3}}
    % {System.show {Append [3 42 5] [12 2]}}
    % {System.show {Append_ [3 42 5] [12 2]}}
    % {System.show {Member [1 2 3 4] 2}} %true
    % {System.show {Member [1 2 3 4] 133}} %false
    {System.show {Position [1 2 3 412] 412}}
    {Exit 0}
end 