(define (problem beam-walk-8)
(:domain beam-walk)
(:objects
p0 p1 p2 p3 p4 p5 p6 p7 - location
)
(:init
(nextfwd p0 p1) (nextfwd p1 p2) (nextfwd p2 p3) (nextfwd p3 p4) (nextfwd p4 p5) (nextfwd p5 p6) (nextfwd p6 p7)
(nextbwd p1 p0) (nextbwd p2 p1) (nextbwd p3 p2) (nextbwd p4 p3) (nextbwd p5 p4) (nextbwd p6 p5) (nextbwd p7 p6)
(ladderat p0)
(position p0)
)

(:goal
(and (up) (position p7) )
)

)
