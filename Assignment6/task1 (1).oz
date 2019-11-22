functor
import
    Application(exit:Exit)
    System
    Space
define
    \insert solve.oz
    \insert task1_helpers.oz %Import the relation class
    
    %Defines all the cabins available in the database
    CabinRel={New RelationClass init}
    {CabinRel
        assertall([cabin(1) cabin(2) cabin(3) cabin(4)
                   cabin(5) cabin(6) cabin(7) cabin(8)])}

    %Defines the relation between each cabin in the database, the distance between each pair and if there is a direct path between them,
    % distance(Cabin1 Cabin2 Distance Connected)
    DistanceRel={New RelationClass init}
    {DistanceRel
        assertall([distance(1 2 10 true) distance(2 1 10 true) distance(2 3 14 true) distance(3 4 43 true)
                   distance(2 5 23 true) distance(5 6 13 true) distance(4 6 24 true) distance(6 7 16 true)
                   distance(6 8 32 true) distance(1 5 50 true) distance(5 1 50 true)])}
    
    proc {CabinP A} 
        {CabinRel query(cabin(A))} %Binds A to a cabin in the database
    end

    proc {DistanceP A B Distance Connected} 
        {DistanceRel query(distance(A B Distance Connected))} %Binds a path to a distance relation between cabin A and cabin B in the database 
    end


    % Derived relatio n defined in terms of DistanceP
    fun {Plan Cabin1 Cabin2} 
        {CabinP Cabin1} %Binds Cabin1 to relevant cabin
        {Plan_ Cabin1 Cabin2 [Cabin1] 0} %Helper function with an accumulator Distance
    end
    fun {Plan_ A B Trace Distance}
        choice
            A=B %The path is complete (and acyclic)
            Distance#{Reverse Trace} %Return tuple with total path distance and the trace of cabins
        [] C D in
            {DistanceP A C D true}             %If there is a path between A and C with distance D
            {Member C Trace}=false             %and C is not already part of the trace,
            {Plan_ C B C|Trace Distance+D}     %then then there is a path between C and B
        end
    end

    % Finds all paths between cabin A and B as well as their respective distances using the planner function Plan
    fun {Plans A B}
        {SolveAll fun {$} {Plan A B} end}
    end
    
    % Finds the plan with the shortest distance from Cabin1 to Cabin2
    fun {BestPlan Cabin1 Cabin2} 
        fun {Iterator List Shortest} Dist Path in
            case List of nil then %When the list is empty, return the best plan (shortest distance)
                Shortest 
            [] Head|Tail then
                if (Head.1 < Shortest.1) then %if the distance of the current plan is shorter than that of the temporary best plan
                    {Iterator Tail Head}      %continue iteration with new temporary best plan
                else 
                    {Iterator Tail Shortest}  %continue with the same temporary best plan
                end
            end
        end
        Head|Tail = {Plans Cabin1 Cabin2} %Uses the Plans function defined above to find all paths from Cabin1 to Cabin2, 
                                          %and defines the head and tail of the returned list
    in
        {Iterator Tail Head} %Function to iterate over the list of plans and find the best one 
    end

    % Using Plan from task 1a
    {System.printInfo "Find all paths avalable in database: "}{System.show {SolveAll fun {$} A B in {Plan A B} end}}
    {System.printInfo "Find all paths between 1 and 8: "}{System.show {Plans 1 8}}

    % Task 1b
    {System.printInfo "Find best path between 1 and 8: "}{System.show {BestPlan 1 8}}
    {Exit 0}
end