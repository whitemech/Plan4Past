(define (problem beam-walk-4)
(:domain beam-walk)
(:objects
p0 p1 p2 p3 - location
)
(:init
(nextfwd p0 p1) (nextfwd p1 p2) (nextfwd p2 p3)
(nextbwd p1 p0) (nextbwd p2 p1) (nextbwd p3 p2)
(ladderat p0)
(position p0)
)

(:goal
(and (up) (position p3) )
)

)
