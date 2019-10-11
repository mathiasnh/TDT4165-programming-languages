functor 
import 
    Application 
    System 
define
    fun lazy {LazyGenerateOdd S E}
        if S < E+1 then
            if {Int.isOdd S} then
                S|{GenerateOdd S+1 E}
            else
                {GenerateOdd S+1 E}
            end
        else nil end
    end

    {Application.exit 0}
end