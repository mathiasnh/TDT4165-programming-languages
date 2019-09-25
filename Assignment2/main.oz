functor
import
    Application(exit:Exit)
    System
define
    \insert task1.oz
    \insert task2.oz
    \insert task3.oz

    {System.showInfo "\n******************Task 1*******************"}
    {System.printInfo "Length: "}{System.show {Length [1 2 3 4 10 123 2 3 1 6]}}
    {System.printInfo "Take: "}{System.show {Take [1 2 3 4] 3}}
    {System.printInfo "Drop: "}{System.show {Drop [1 2 3 4 5] 3}}
    {System.printInfo "Append: "}{System.show {Append [3 42 5] [2]}}
    {System.printInfo "Member (true): "}{System.show {Member [1 2 3 4] 2}} %true
    {System.printInfo "Member (false): "}{System.show {Member [1 2 3 4] 133}} %false
    {System.printInfo "Position: "}{System.show {Position [1 2 3 412] 412}}
    {System.showInfo "*******************************************\n"}

    {System.showInfo "\n******************Task 2*******************"}
    {System.printInfo "2a: "}{System.show {Lex "1 2 + 3 *"}} 
    {System.printInfo "2b: "}{System.show {Tokenize ["1" "2" "+" "3" "*"]}} %2b
    {System.printInfo "2c: "}{System.show {Interpret {Tokenize {Lex "1 2 3 +"}}}} %2c
    {System.printInfo "2d: "}{System.show {Interpret {Tokenize {Lex "1 2 3 p +"}}}} %2d also prints stack [number(1) number(2) number(3)]
    {System.printInfo "2e: "}{System.show {Interpret {Tokenize {Lex "1 2 3 + d"}}}} %2e
    {System.printInfo "2f: "}{System.show {Interpret {Tokenize {Lex "1.0 6.0 3.2 - i"}}}} %2f
    {System.printInfo "2g: "}{System.show {Interpret {Tokenize {Lex "1.0 4.0 1.0 / ^ + 30.0 /"}}}} %2g
    {System.showInfo "*******************************************\n"}

    {System.showInfo "\n******************Task 3*******************"}
    {System.printInfo "3b: "}{System.showInfo {Infix {Tokenize {Lex "3.0 10.0 9.0 * - 3.0 +"}}}}
    {System.showInfo "*******************************************\n"}


    {Exit 0}
end