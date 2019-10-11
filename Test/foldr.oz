functor 
import 
    Application 
    System 
define
    fun {FoldR L F U}
        fun {FoldRIter List}
            case List of nil then U
            [] H|T then
                {FoldR T F {F H U}}
            end
        end
    in 
        {FoldRIter {Reverse L}}
    end 

    {System.show {FoldR [1 2 3 4] fun {$ X Y} X + Y end 0}}
    {Application.exit 0}
end