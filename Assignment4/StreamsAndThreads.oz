functor 
import 
    Application 
    System 
define
    fun {GenerateOdd S E}
        if S < E+1 then
            if {Int.isOdd S} then
                S|{GenerateOdd S+1 E}
            else
                {GenerateOdd S+1 E}
            end
        else nil end
    end

    fun {Product S}
        case S of Head|Tail then 
            Head * {Product Tail}
        [] nil then 1
        end
    end

    local
        List Prod
    in 
        thread List = {GenerateOdd 0 1000} end
        thread Prod = {Product List} end
        {System.showInfo Prod}
    end

    {System.show {GenerateOdd ~3 10}}
    {System.show {GenerateOdd 3 3}}
    {System.show {GenerateOdd 2 2}}
    {System.show {Product [1 2 3 4]}}

    {Application.exit 0}
end