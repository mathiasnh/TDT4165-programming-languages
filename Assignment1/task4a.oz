functor
import
    Application(exit:Exit)
    System
define
    fun {Max Number1 Number2}
        if Number1 > Number2 then
            Number1
        else 
            Number2
        end 
    end
    {System.showInfo {Max 100 15}}
    {Exit 0}
end 