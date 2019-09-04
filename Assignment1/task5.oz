functor
import
    Application(exit:Exit)
    System
define
    local 
        A D C
        Pi = 355.0 / 113.0
    in 
        proc {Circle R}
            A = Pi * R * R
            D = 2.0 * R
            C = Pi * D
            {System.showInfo "Area: "#A}
            {System.showInfo "Diameter: "#D}
            {System.showInfo "Circumference: "#C}
        end
    end
    {Circle 1.0}
    {Exit 0}
end 