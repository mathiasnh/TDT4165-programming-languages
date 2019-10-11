functor 
import 
    Application 
    System 
    OS
define

    fun lazy {HammerFactory}
        {Delay 1000}
        if {RandomInt 1 100} < 90 then
            working|{HammerFactory}
        else 
            defect|{HammerFactory}
        end
    end

    fun {RandomInt Min Max}
        X = {OS.rand}
        MinOS
        MaxOS 
    in
        {OS.randLimits ?MinOS ?MaxOS}
        Min + X*(Max - Min) div (MaxOS - MinOS)
    end

    fun {HammerConsumer HammerStream N}
        if N > 0 then
            case HammerStream of working|Tail then
                1 + {HammerConsumer Tail N - 1}
            [] defect|Tail then
                {HammerConsumer Tail N - 1}
            end
        else 
            0
        end
    end

    fun {BoundedBuffer HammerStream N}
        
    end

    local 
        HammerTime 
    in
        {System.showInfo "Start (4 sec)"}
        HammerTime = {HammerFactory}
        _ = HammerTime.2.2.2.1
        {System.show HammerTime}
    end

    local 
        HammerTime Consumer 
    in
        {System.showInfo "Start (10 sec)"}
        HammerTime = {HammerFactory}
        Consumer = {HammerConsumer HammerTime 10}
        {System.show Consumer}
end

    {Application.exit 0}
end