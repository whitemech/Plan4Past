(define (domain elevator)
    (:requirements :conditional-effects :derived-predicates :negative-preconditions :strips)
    (:types floor passenger)
    (:predicates (Oserved_p0) (Oserved_p1) (Oserved_p10) (Oserved_p11) (Oserved_p12) (Oserved_p13) (Oserved_p14) (Oserved_p15) (Oserved_p2) (Oserved_p3) (Oserved_p4) (Oserved_p5) (Oserved_p6) (Oserved_p7) (Oserved_p8) (Oserved_p9) (above ?floor1 ?floor2) (boarded ?person) (destin ?person ?floor) (lift-at ?floor) (not-boarded ?person) (not-served ?person) (origin ?person ?floor) (served ?person) (val_Oserved_p0) (val_Oserved_p0-and-Oserved_p1-and-Oserved_p2-and-Oserved_p3-and-Oserved_p4-and-Oserved_p5-and-Oserved_p6-and-Oserved_p7-and-Oserved_p8-and-Oserved_p9-and-Oserved_p10-and-Oserved_p11-and-Oserved_p12-and-Oserved_p13-and-Oserved_p14-and-Oserved_p15) (val_Oserved_p1) (val_Oserved_p10) (val_Oserved_p11) (val_Oserved_p12) (val_Oserved_p13) (val_Oserved_p14) (val_Oserved_p15) (val_Oserved_p2) (val_Oserved_p3) (val_Oserved_p4) (val_Oserved_p5) (val_Oserved_p6) (val_Oserved_p7) (val_Oserved_p8) (val_Oserved_p9) (val_served_p0) (val_served_p1) (val_served_p10) (val_served_p11) (val_served_p12) (val_served_p13) (val_served_p14) (val_served_p15) (val_served_p2) (val_served_p3) (val_served_p4) (val_served_p5) (val_served_p6) (val_served_p7) (val_served_p8) (val_served_p9))
    (:derived (val_Oserved_p0) (or (val_served_p0) (Oserved_p0)))
     (:derived (val_Oserved_p0-and-Oserved_p1-and-Oserved_p2-and-Oserved_p3-and-Oserved_p4-and-Oserved_p5-and-Oserved_p6-and-Oserved_p7-and-Oserved_p8-and-Oserved_p9-and-Oserved_p10-and-Oserved_p11-and-Oserved_p12-and-Oserved_p13-and-Oserved_p14-and-Oserved_p15) (and (val_Oserved_p0) (val_Oserved_p1) (val_Oserved_p2) (val_Oserved_p3) (val_Oserved_p4) (val_Oserved_p5) (val_Oserved_p6) (val_Oserved_p7) (val_Oserved_p8) (val_Oserved_p9) (val_Oserved_p10) (val_Oserved_p11) (val_Oserved_p12) (val_Oserved_p13) (val_Oserved_p14) (val_Oserved_p15)))
     (:derived (val_Oserved_p1) (or (val_served_p1) (Oserved_p1)))
     (:derived (val_Oserved_p10) (or (val_served_p10) (Oserved_p10)))
     (:derived (val_Oserved_p11) (or (val_served_p11) (Oserved_p11)))
     (:derived (val_Oserved_p12) (or (val_served_p12) (Oserved_p12)))
     (:derived (val_Oserved_p13) (or (val_served_p13) (Oserved_p13)))
     (:derived (val_Oserved_p14) (or (val_served_p14) (Oserved_p14)))
     (:derived (val_Oserved_p15) (or (val_served_p15) (Oserved_p15)))
     (:derived (val_Oserved_p2) (or (val_served_p2) (Oserved_p2)))
     (:derived (val_Oserved_p3) (or (val_served_p3) (Oserved_p3)))
     (:derived (val_Oserved_p4) (or (val_served_p4) (Oserved_p4)))
     (:derived (val_Oserved_p5) (or (val_served_p5) (Oserved_p5)))
     (:derived (val_Oserved_p6) (or (val_served_p6) (Oserved_p6)))
     (:derived (val_Oserved_p7) (or (val_served_p7) (Oserved_p7)))
     (:derived (val_Oserved_p8) (or (val_served_p8) (Oserved_p8)))
     (:derived (val_Oserved_p9) (or (val_served_p9) (Oserved_p9)))
     (:derived (val_served_p0) (served p0))
     (:derived (val_served_p1) (served p1))
     (:derived (val_served_p10) (served p10))
     (:derived (val_served_p11) (served p11))
     (:derived (val_served_p12) (served p12))
     (:derived (val_served_p13) (served p13))
     (:derived (val_served_p14) (served p14))
     (:derived (val_served_p15) (served p15))
     (:derived (val_served_p2) (served p2))
     (:derived (val_served_p3) (served p3))
     (:derived (val_served_p4) (served p4))
     (:derived (val_served_p5) (served p5))
     (:derived (val_served_p6) (served p6))
     (:derived (val_served_p7) (served p7))
     (:derived (val_served_p8) (served p8))
     (:derived (val_served_p9) (served p9))
    (:action board
        :parameters (?f ?p)
        :precondition (and (lift-at ?f) (origin ?p ?f))
        :effect (and (boarded ?p) (when (val_Oserved_p12) (Oserved_p12)) (when (val_Oserved_p7) (Oserved_p7)) (when (val_Oserved_p1) (Oserved_p1)) (when (val_Oserved_p9) (Oserved_p9)) (when (val_Oserved_p15) (Oserved_p15)) (when (val_Oserved_p2) (Oserved_p2)) (when (val_Oserved_p5) (Oserved_p5)) (when (val_Oserved_p13) (Oserved_p13)) (when (val_Oserved_p10) (Oserved_p10)) (when (val_Oserved_p0) (Oserved_p0)) (when (val_Oserved_p4) (Oserved_p4)) (when (val_Oserved_p8) (Oserved_p8)) (when (val_Oserved_p14) (Oserved_p14)) (when (val_Oserved_p3) (Oserved_p3)) (when (val_Oserved_p6) (Oserved_p6)) (when (val_Oserved_p11) (Oserved_p11)))
    )
     (:action depart
        :parameters (?f ?p)
        :precondition (and (lift-at ?f) (destin ?p ?f) (boarded ?p))
        :effect (and (and (not (boarded ?p)) (served ?p)) (when (val_Oserved_p12) (Oserved_p12)) (when (val_Oserved_p7) (Oserved_p7)) (when (val_Oserved_p1) (Oserved_p1)) (when (val_Oserved_p9) (Oserved_p9)) (when (val_Oserved_p15) (Oserved_p15)) (when (val_Oserved_p2) (Oserved_p2)) (when (val_Oserved_p5) (Oserved_p5)) (when (val_Oserved_p13) (Oserved_p13)) (when (val_Oserved_p10) (Oserved_p10)) (when (val_Oserved_p0) (Oserved_p0)) (when (val_Oserved_p4) (Oserved_p4)) (when (val_Oserved_p8) (Oserved_p8)) (when (val_Oserved_p14) (Oserved_p14)) (when (val_Oserved_p3) (Oserved_p3)) (when (val_Oserved_p6) (Oserved_p6)) (when (val_Oserved_p11) (Oserved_p11)))
    )
     (:action down
        :parameters (?f1 ?f2)
        :precondition (and (lift-at ?f1) (above ?f2 ?f1))
        :effect (and (and (lift-at ?f2) (not (lift-at ?f1))) (when (val_Oserved_p12) (Oserved_p12)) (when (val_Oserved_p7) (Oserved_p7)) (when (val_Oserved_p1) (Oserved_p1)) (when (val_Oserved_p9) (Oserved_p9)) (when (val_Oserved_p15) (Oserved_p15)) (when (val_Oserved_p2) (Oserved_p2)) (when (val_Oserved_p5) (Oserved_p5)) (when (val_Oserved_p13) (Oserved_p13)) (when (val_Oserved_p10) (Oserved_p10)) (when (val_Oserved_p0) (Oserved_p0)) (when (val_Oserved_p4) (Oserved_p4)) (when (val_Oserved_p8) (Oserved_p8)) (when (val_Oserved_p14) (Oserved_p14)) (when (val_Oserved_p3) (Oserved_p3)) (when (val_Oserved_p6) (Oserved_p6)) (when (val_Oserved_p11) (Oserved_p11)))
    )
     (:action up
        :parameters (?f1 ?f2)
        :precondition (and (lift-at ?f1) (above ?f1 ?f2))
        :effect (and (and (lift-at ?f2) (not (lift-at ?f1))) (when (val_Oserved_p12) (Oserved_p12)) (when (val_Oserved_p7) (Oserved_p7)) (when (val_Oserved_p1) (Oserved_p1)) (when (val_Oserved_p9) (Oserved_p9)) (when (val_Oserved_p15) (Oserved_p15)) (when (val_Oserved_p2) (Oserved_p2)) (when (val_Oserved_p5) (Oserved_p5)) (when (val_Oserved_p13) (Oserved_p13)) (when (val_Oserved_p10) (Oserved_p10)) (when (val_Oserved_p0) (Oserved_p0)) (when (val_Oserved_p4) (Oserved_p4)) (when (val_Oserved_p8) (Oserved_p8)) (when (val_Oserved_p14) (Oserved_p14)) (when (val_Oserved_p3) (Oserved_p3)) (when (val_Oserved_p6) (Oserved_p6)) (when (val_Oserved_p11) (Oserved_p11)))
    )
)