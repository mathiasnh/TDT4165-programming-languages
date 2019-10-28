% Generates a stream of hammers. New hammer is made every 1 second on demand.
fun lazy {HammerFactory}
    {Delay 1000}
    if {RandomInt 1 100} < 90 then
        working|{HammerFactory}
    else 
        defect|{HammerFactory}
    end
end

% Helper function to generate random numbers
fun {RandomInt Min Max}
    X = {OS.rand}
    MinOS
    MaxOS 
in
    {OS.randLimits ?MinOS ?MaxOS}
    Min + X*(Max - Min) div (MaxOS - MinOS)
end

% Finds the amount of working hammers in the N first hammers of a hammerstream
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

/*
Bounded buffer is a combination of eager and lazy execution. 
Stores hammers up to a given number N (a buffer bounded by N).
*/
fun {BoundedBuffer HammerStream N}
    End = thread {List.drop HammerStream N} end %Looks ahead N elements wrt HammerStream. Ready to request a new hammer from factory on demand.
    fun lazy {Loop HammerStream End} %Function to provide the next element of the stream whenever it is needed by consumer.
        case HammerStream of Head|Tail then 
            Head|{Loop Tail thread End.2 end} %Returns the Head of HammerStream, while also requesting a new hammer from the producer by calling End.2
        end
    end
in 
    {Loop HammerStream End} %Returns the bounded buffer
end
