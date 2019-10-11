functor 
import 
    Application 
    System 
define

    local 
        fun {ReverseIter List Stack}
            case List of H|T then
                {ReverseIter T H|Stack}
            [] nil then
                Stack
            end
        end
    in 
        fun {Reverse List} 
            {ReverseIter List nil}
        end
    end

    {System.show {Reverse [1 2 3 4]}}
    {Application.exit 0}
end