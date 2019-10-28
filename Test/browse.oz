functor
import
    Application(exit:Exit)
    System
    Browse
define
    local Y T Z in
        try
            local X=bar(baz) Y=boom Z T in
                try
                    raise X end
                    Z=1
                catch bar(Z) then {Browse.browse T#Z} end
            end
        catch bar(Y) then {Browse.browse T#Z} end end
    {Exit 0}
end