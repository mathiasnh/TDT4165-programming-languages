functor
import
    Application(exit:Exit)
    System
    Space
define
    \insert solve.oz
    \insert task1_helpers.oz
    
    
    CabinRel={New RelationClass init}
    {CabinRel
        assertall([cabin(1) cabin(2) cabin(3) cabin(4)
                   cabin(5) cabin(6) cabin(7) cabin(8)])}

    DistanceRel={New RelationClass init}
    {DistanceRel
        assertall([distance(1 2 10 true) distance(2 1 10 true) distance(2 3 14 true) distance(3 4 43 true)
                   distance(2 5 23 true) distance(5 6 13 true) distance(4 6 24 true) distance(6 7 16 true)
                   distance(6 8 32 true) distance(1 5 50 true) distance(5 1 50 true)])}
    
    proc {CabinP A} {CabinRel query(cabin(A))} end
    proc {DistanceP A B Distance Connected} {DistanceRel query(distance(A B Distance Connected))} end


    % Derived relation defined in terms of DistanceP
    fun {Plan Cabin1 Cabin2} 
        {CabinP Cabin1}
        {Plan_ Cabin1 Cabin2 [Cabin1] 0}
    end
    fun {Plan_ A B Trace Distance}
        choice
            A=B
            Distance#{Reverse Trace}
        [] C D in
            {DistanceP A C D true}
            {Member C Trace}=false
            {Plan_ C B C|Trace Distance+D}
        end
    end

    % Finds all the direct connections from cabin 2 and their respective distances (cabinnr#distance)
    proc {Q ?X} CabTo Dist in 
        {DistanceP 2 CabTo Dist true} 
        X = CabTo#Dist
    end

    % Finds all possible paths and their respective distances
    fun {Q2} A B in
        {Plan A B}
    end


    {System.show {SolveAll Q2}}
    {Exit 0}
end