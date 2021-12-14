(define (problem beam-walk-64)
(:domain beam-walk)
(:objects
p0 p1 p2 p3 p4 p5 p6 p7 p8 p9 p10 p11 p12 p13 p14 p15 p16 p17 p18 p19 p20 p21 p22 p23 p24 p25 p26 p27 p28 p29 p30 p31 p32 p33 p34 p35 p36 p37 p38 p39 p40 p41 p42 p43 p44 p45 p46 p47 p48 p49 p50 p51 p52 p53 p54 p55 p56 p57 p58 p59 p60 p61 p62 p63 - location
)
(:init
(nextfwd p0 p1) (nextfwd p1 p2) (nextfwd p2 p3) (nextfwd p3 p4) (nextfwd p4 p5) (nextfwd p5 p6) (nextfwd p6 p7) (nextfwd p7 p8) (nextfwd p8 p9) (nextfwd p9 p10) (nextfwd p10 p11) (nextfwd p11 p12) (nextfwd p12 p13) (nextfwd p13 p14) (nextfwd p14 p15) (nextfwd p15 p16) (nextfwd p16 p17) (nextfwd p17 p18) (nextfwd p18 p19) (nextfwd p19 p20) (nextfwd p20 p21) (nextfwd p21 p22) (nextfwd p22 p23) (nextfwd p23 p24) (nextfwd p24 p25) (nextfwd p25 p26) (nextfwd p26 p27) (nextfwd p27 p28) (nextfwd p28 p29) (nextfwd p29 p30) (nextfwd p30 p31) (nextfwd p31 p32) (nextfwd p32 p33) (nextfwd p33 p34) (nextfwd p34 p35) (nextfwd p35 p36) (nextfwd p36 p37) (nextfwd p37 p38) (nextfwd p38 p39) (nextfwd p39 p40) (nextfwd p40 p41) (nextfwd p41 p42) (nextfwd p42 p43) (nextfwd p43 p44) (nextfwd p44 p45) (nextfwd p45 p46) (nextfwd p46 p47) (nextfwd p47 p48) (nextfwd p48 p49) (nextfwd p49 p50) (nextfwd p50 p51) (nextfwd p51 p52) (nextfwd p52 p53) (nextfwd p53 p54) (nextfwd p54 p55) (nextfwd p55 p56) (nextfwd p56 p57) (nextfwd p57 p58) (nextfwd p58 p59) (nextfwd p59 p60) (nextfwd p60 p61) (nextfwd p61 p62) (nextfwd p62 p63)
(nextbwd p1 p0) (nextbwd p2 p1) (nextbwd p3 p2) (nextbwd p4 p3) (nextbwd p5 p4) (nextbwd p6 p5) (nextbwd p7 p6) (nextbwd p8 p7) (nextbwd p9 p8) (nextbwd p10 p9) (nextbwd p11 p10) (nextbwd p12 p11) (nextbwd p13 p12) (nextbwd p14 p13) (nextbwd p15 p14) (nextbwd p16 p15) (nextbwd p17 p16) (nextbwd p18 p17) (nextbwd p19 p18) (nextbwd p20 p19) (nextbwd p21 p20) (nextbwd p22 p21) (nextbwd p23 p22) (nextbwd p24 p23) (nextbwd p25 p24) (nextbwd p26 p25) (nextbwd p27 p26) (nextbwd p28 p27) (nextbwd p29 p28) (nextbwd p30 p29) (nextbwd p31 p30) (nextbwd p32 p31) (nextbwd p33 p32) (nextbwd p34 p33) (nextbwd p35 p34) (nextbwd p36 p35) (nextbwd p37 p36) (nextbwd p38 p37) (nextbwd p39 p38) (nextbwd p40 p39) (nextbwd p41 p40) (nextbwd p42 p41) (nextbwd p43 p42) (nextbwd p44 p43) (nextbwd p45 p44) (nextbwd p46 p45) (nextbwd p47 p46) (nextbwd p48 p47) (nextbwd p49 p48) (nextbwd p50 p49) (nextbwd p51 p50) (nextbwd p52 p51) (nextbwd p53 p52) (nextbwd p54 p53) (nextbwd p55 p54) (nextbwd p56 p55) (nextbwd p57 p56) (nextbwd p58 p57) (nextbwd p59 p58) (nextbwd p60 p59) (nextbwd p61 p60) (nextbwd p62 p61) (nextbwd p63 p62)
(ladderat p0)
(position p0)
)

(:goal
(and (up) (position p63) )
)

)
