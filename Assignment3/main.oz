functor
import
    Application(exit:Exit)
    System
define
    \insert task1.oz
    \insert task2.oz
    \insert task3.oz
    \insert task4.oz
    \insert task5.oz
    \insert task6.oz
    

    {System.showInfo "\n******************Task 1*******************"}
    local 
        RS1 X11 X12 RS2 X21 X22 
    in
        {System.printInfo "A = 2, B = 1 and C = -1:\n"}
        {QuadraticEquation 2.0 1.0 ~1.0 RS1 X11 X12}
        {System.printInfo "Real solution? "}{System.show RS1}
        {System.printInfo "X1: "}{System.show X11}
        {System.printInfo "X2: "}{System.show X12}

        {System.printInfo "A = 2, B = 1 and C = 2:\n"}
        {QuadraticEquation 2.0 1.0 2.0 RS2 X21 X22}
        {System.printInfo "Real solution? "}{System.show RS2}
        {System.printInfo "X1: "}{System.show X21}
        {System.printInfo "X2: "}{System.show X22}
    end
    {System.showInfo "*******************************************\n"}

    {System.showInfo "\n******************Task 2*******************"}
    {System.printInfo "Sum [1 2 3 4]: "}{System.show {Sum [1 2 3 4]}}
    {System.showInfo "*******************************************\n"}

    {System.showInfo "\n******************Task 3*******************"}
    {System.printInfo "FoldLength [1 2 3 4 5]: "}{System.show {FoldLength [1 2 3 4 5]}}
    {System.printInfo "FoldSum [1 2 3 4 5]: "}{System.show {FoldSum [1 2 3 4 5]}}
    {System.showInfo "*******************************************\n"}

    {System.showInfo "\n******************Task 4*******************"}
    {System.printInfo "Quadratic: "}{System.show {{Quadratic 3 2 1} 2}}
    {System.showInfo "*******************************************\n"}

    {System.showInfo "\n******************Task 5*******************"}
    {System.printInfo "LazyNumberGenerator (0): "}{System.show {LazyNumberGenerator 0}.1}
    {System.printInfo "LazyNumberGenerator (1): "}{System.show {{LazyNumberGenerator 0}.2}.1}
    {System.printInfo "LazyNumberGenerator (5): "}{System.show {{{{{{LazyNumberGenerator 0}.2}.2}.2}.2}.2}.1}
    {System.showInfo "*******************************************\n"}

    {System.showInfo "\n******************Task 6*******************"}
    {System.printInfo "TailSum [3 3 4 4 5]: "}{System.show {TailSum [3 3 4 4 5]}}
    {System.showInfo "*******************************************\n"}
    
    {Exit 0}
end