This is an algorithm for false position. False position is a numerical algorithm that finds the root of a function by approximating it with a linear interpolation and iteratively adjusting the interval based on the sign of the function at the approximation. 

Inputs:

1.  The function you want to find the root of
2. Two initial points that bracket the root (i.e., the function has opposite signs at the two points)
3. A tolerance level for determining when the approximation is "close enough" to the root

Outputs:
An estimate of the root of the function that satisfies the specified tolerance
