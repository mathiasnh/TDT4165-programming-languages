functor 
import 
    Application 
    System 
define

    proc {Proc A B ?X}
        X = A + B
    end

    local Res = {Proc 1 2 $} in 
        {System.show Res}
    end

    {Application.exit 0}
end