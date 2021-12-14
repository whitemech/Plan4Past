(define (problem beam-walk-16)
(:domain beam-walk)
(:objects
p0 p1 p2 p3 p4 p5 p6 p7 p8 p9 p10 p11 p12 p13 p14 p15 - location
)
(:init
(nextfwd p0 p1) (nextfwd p1 p2) (nextfwd p2 p3) (nextfwd p3 p4) (nextfwd p4 p5) (nextfwd p5 p6) (nextfwd p6 p7) (nextfwd p7 p8) (nextfwd p8 p9) (nextfwd p9 p10) (nextfwd p10 p11) (nextfwd p11 p12) (nextfwd p12 p13) (nextfwd p13 p14) (nextfwd p14 p15)
(nextbwd p1 p0) (nextbwd p2 p1) (nextbwd p3 p2) (nextbwd p4 p3) (nextbwd p5 p4) (nextbwd p6 p5) (nextbwd p7 p6) (nextbwd p8 p7) (nextbwd p9 p8) (nextbwd p10 p9) (nextbwd p11 p10) (nextbwd p12 p11) (nextbwd p13 p12) (nextbwd p14 p13) (nextbwd p15 p14)
(ladderat p0)
(position p0)
)

(:goal
(and (up) (position p15) )
)

)
