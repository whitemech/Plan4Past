(define (problem beam-walk-32)
(:domain beam-walk)
(:objects
p0 p1 p2 p3 p4 p5 p6 p7 p8 p9 p10 p11 p12 p13 p14 p15 p16 p17 p18 p19 p20 p21 p22 p23 p24 p25 p26 p27 p28 p29 p30 p31 - location
)
(:init
(nextfwd p0 p1) (nextfwd p1 p2) (nextfwd p2 p3) (nextfwd p3 p4) (nextfwd p4 p5) (nextfwd p5 p6) (nextfwd p6 p7) (nextfwd p7 p8) (nextfwd p8 p9) (nextfwd p9 p10) (nextfwd p10 p11) (nextfwd p11 p12) (nextfwd p12 p13) (nextfwd p13 p14) (nextfwd p14 p15) (nextfwd p15 p16) (nextfwd p16 p17) (nextfwd p17 p18) (nextfwd p18 p19) (nextfwd p19 p20) (nextfwd p20 p21) (nextfwd p21 p22) (nextfwd p22 p23) (nextfwd p23 p24) (nextfwd p24 p25) (nextfwd p25 p26) (nextfwd p26 p27) (nextfwd p27 p28) (nextfwd p28 p29) (nextfwd p29 p30) (nextfwd p30 p31)
(nextbwd p1 p0) (nextbwd p2 p1) (nextbwd p3 p2) (nextbwd p4 p3) (nextbwd p5 p4) (nextbwd p6 p5) (nextbwd p7 p6) (nextbwd p8 p7) (nextbwd p9 p8) (nextbwd p10 p9) (nextbwd p11 p10) (nextbwd p12 p11) (nextbwd p13 p12) (nextbwd p14 p13) (nextbwd p15 p14) (nextbwd p16 p15) (nextbwd p17 p16) (nextbwd p18 p17) (nextbwd p19 p18) (nextbwd p20 p19) (nextbwd p21 p20) (nextbwd p22 p21) (nextbwd p23 p22) (nextbwd p24 p23) (nextbwd p25 p24) (nextbwd p26 p25) (nextbwd p27 p26) (nextbwd p28 p27) (nextbwd p29 p28) (nextbwd p30 p29) (nextbwd p31 p30)
(ladderat p0)
(position p0)
)

(:goal
(and (up) (position p31) )
)

)
