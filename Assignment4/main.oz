functor 
import 
    Application 
    System 
    OS
define
    \insert task1_3.oz
    \insert task5.oz

    {System.showInfo "\n******************Task 1*******************"}
    {System.printInfo "GenerateOdd ~3 10: "}{System.show {GenerateOdd ~3 10}}
    {System.printInfo "GenerateOdd 3 3: "}{System.show {GenerateOdd 3 3}}
    {System.printInfo "GenerateOdd 2 2: "}{System.show {GenerateOdd 2 2}}
    {System.showInfo "*******************************************\n"}

    {System.showInfo "\n******************Task 2*******************"}
    {System.printInfo "Product [1 2 3 4]: "}{System.show {Product [1 2 3 4]}}
    {System.showInfo "*******************************************\n"}

    {System.showInfo "\n******************Task 3*******************"}
    local Odds Prod in
        thread Odds = {GenerateOdd 0 1000} end %producer thread
        thread Prod = {Product Odds} end %consumer thread 
        {System.printInfo "Product of lazy stream: "}{System.showInfo Prod}
    end
    {System.showInfo "*******************************************\n"}

    {System.showInfo "\n******************Task 5*******************"}
    {System.showInfo "5a:"}
    {System.showInfo "Stream of hammers, working or defect (4 sec):"}
    local HammerTime in
        HammerTime = {HammerFactory}
        _ = HammerTime.2.2.2.1
        {System.show HammerTime}
    end

    {System.showInfo "\n5b:"}
    {System.showInfo "How many working hammers in stream of 10 hammers (10 sec):"}
    local HammerTime Consumer in
        HammerTime = {HammerFactory}
        Consumer = {HammerConsumer HammerTime 10}
        {System.show Consumer}
    end

    {System.showInfo "\n5c (How many working hammers in stream of 10 hammers?):"}
    {System.showInfo "With bounded buffer (10 sec):"}
    local HammerStream Buffer Consumer in
        HammerStream = {HammerFactory}
        Buffer = {BoundedBuffer HammerStream 6}
        {Delay 6000}
        Consumer = {HammerConsumer Buffer 10}
        {System.show Consumer}
    end

    {System.showInfo "\nWithout bounded buffer (16 sec):"}
    local HammerStream Consumer in
        HammerStream = {HammerFactory}
        {Delay 6000}
        Consumer = {HammerConsumer HammerStream 10}
        {System.show Consumer}
    end
    {System.showInfo "*******************************************\n"}

    {Application.exit 0}
end