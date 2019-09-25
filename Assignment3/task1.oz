/*
Calculates the solution for a quadratic equation (Ax^2 + Bx + C)

Returns: 
RealSol (boolean) - does a real solution exist?
X1 - solution with + in D, nil if no real solution
X2 - solution with - in D, nil if no real solution
*/
proc {QuadraticEquation A B C ?RealSol ?X1 ?X2}
    D = B * B - 4.0 * A * C in
        if (D < 0.0) then
            RealSol = false
            X1 = nil
            X2 = nil
        else
            RealSol = true
            X1 = (~B + {Float.sqrt D})/(2.0 * A)
            X2 = (~B - {Float.sqrt D})/(2.0 * A)
        end
end
