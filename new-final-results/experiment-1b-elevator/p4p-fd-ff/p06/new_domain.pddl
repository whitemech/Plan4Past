(define (domain elevator)
    (:requirements :conditional-effects :derived-predicates :negative-preconditions :strips)
    (:types floor passenger)
    (:predicates (Oserved_p0) (Oserved_p1) (Oserved_p2) (Oserved_p3) (Oserved_p4) (Oserved_p5) (above ?floor1 ?floor2) (boarded ?person) (destin ?person ?floor) (lift-at ?floor) (not-boarded ?person) (not-served ?person) (origin ?person ?floor) (served ?person) (val_Oserved_p0) (val_Oserved_p0-and-Oserved_p1-and-Oserved_p2-and-Oserved_p3-and-Oserved_p4-and-Oserved_p5) (val_Oserved_p1) (val_Oserved_p2) (val_Oserved_p3) (val_Oserved_p4) (val_Oserved_p5) (val_served_p0) (val_served_p1) (val_served_p2) (val_served_p3) (val_served_p4) (val_served_p5))
    (:derived (val_Oserved_p0) (or (val_served_p0) (Oserved_p0)))
     (:derived (val_Oserved_p0-and-Oserved_p1-and-Oserved_p2-and-Oserved_p3-and-Oserved_p4-and-Oserved_p5) (and (val_Oserved_p0) (val_Oserved_p1) (val_Oserved_p2) (val_Oserved_p3) (val_Oserved_p4) (val_Oserved_p5)))
     (:derived (val_Oserved_p1) (or (val_served_p1) (Oserved_p1)))
     (:derived (val_Oserved_p2) (or (val_served_p2) (Oserved_p2)))
     (:derived (val_Oserved_p3) (or (val_served_p3) (Oserved_p3)))
     (:derived (val_Oserved_p4) (or (val_served_p4) (Oserved_p4)))
     (:derived (val_Oserved_p5) (or (val_served_p5) (Oserved_p5)))
     (:derived (val_served_p0) (served p0))
     (:derived (val_served_p1) (served p1))
     (:derived (val_served_p2) (served p2))
     (:derived (val_served_p3) (served p3))
     (:derived (val_served_p4) (served p4))
     (:derived (val_served_p5) (served p5))
    (:action board
        :parameters (?f ?p)
        :precondition (and (lift-at ?f) (origin ?p ?f))
        :effect (and (boarded ?p) (when (val_Oserved_p3) (Oserved_p3)) (when (val_Oserved_p2) (Oserved_p2)) (when (val_Oserved_p5) (Oserved_p5)) (when (val_Oserved_p4) (Oserved_p4)) (when (val_Oserved_p0) (Oserved_p0)) (when (val_Oserved_p1) (Oserved_p1)))
    )
     (:action depart
        :parameters (?f ?p)
        :precondition (and (lift-at ?f) (destin ?p ?f) (boarded ?p))
        :effect (and (and (not (boarded ?p)) (served ?p)) (when (val_Oserved_p3) (Oserved_p3)) (when (val_Oserved_p2) (Oserved_p2)) (when (val_Oserved_p5) (Oserved_p5)) (when (val_Oserved_p4) (Oserved_p4)) (when (val_Oserved_p0) (Oserved_p0)) (when (val_Oserved_p1) (Oserved_p1)))
    )
     (:action down
        :parameters (?f1 ?f2)
        :precondition (and (lift-at ?f1) (above ?f2 ?f1))
        :effect (and (and (lift-at ?f2) (not (lift-at ?f1))) (when (val_Oserved_p3) (Oserved_p3)) (when (val_Oserved_p2) (Oserved_p2)) (when (val_Oserved_p5) (Oserved_p5)) (when (val_Oserved_p4) (Oserved_p4)) (when (val_Oserved_p0) (Oserved_p0)) (when (val_Oserved_p1) (Oserved_p1)))
    )
     (:action up
        :parameters (?f1 ?f2)
        :precondition (and (lift-at ?f1) (above ?f1 ?f2))
        :effect (and (and (lift-at ?f2) (not (lift-at ?f1))) (when (val_Oserved_p3) (Oserved_p3)) (when (val_Oserved_p2) (Oserved_p2)) (when (val_Oserved_p5) (Oserved_p5)) (when (val_Oserved_p4) (Oserved_p4)) (when (val_Oserved_p0) (Oserved_p0)) (when (val_Oserved_p1) (Oserved_p1)))
    )
)