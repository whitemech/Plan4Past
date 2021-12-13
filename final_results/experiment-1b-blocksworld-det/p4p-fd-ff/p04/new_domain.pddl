(define (domain blocks-domain)
    (:requirements :conditional-effects :derived-predicates :negative-preconditions :strips)
    (:types block)
    (:predicates (Oon_b1_b2-and-YOon_b2_b3-and-YOon_b3_b4) (Oon_b2_b3-and-YOon_b3_b4) (Oon_b3_b4) (clear ?x) (emptyhand) (holding ?x) (on ?x ?y) (ontable ?x) (val_Oon_b1_b2-and-YOon_b2_b3-and-YOon_b3_b4) (val_Oon_b2_b3-and-YOon_b3_b4) (val_Oon_b3_b4) (val_YOon_b2_b3-and-YOon_b3_b4) (val_YOon_b3_b4) (val_on_b1_b2) (val_on_b1_b2-and-YOon_b2_b3-and-YOon_b3_b4) (val_on_b2_b3) (val_on_b2_b3-and-YOon_b3_b4) (val_on_b3_b4))
    (:derived (val_Oon_b1_b2-and-YOon_b2_b3-and-YOon_b3_b4) (or (val_on_b1_b2-and-YOon_b2_b3-and-YOon_b3_b4) (Oon_b1_b2-and-YOon_b2_b3-and-YOon_b3_b4)))
     (:derived (val_Oon_b2_b3-and-YOon_b3_b4) (or (val_on_b2_b3-and-YOon_b3_b4) (Oon_b2_b3-and-YOon_b3_b4)))
     (:derived (val_Oon_b3_b4) (or (val_on_b3_b4) (Oon_b3_b4)))
     (:derived (val_YOon_b2_b3-and-YOon_b3_b4) (Oon_b2_b3-and-YOon_b3_b4))
     (:derived (val_YOon_b3_b4) (Oon_b3_b4))
     (:derived (val_on_b1_b2) (on b1 b2))
     (:derived (val_on_b1_b2-and-YOon_b2_b3-and-YOon_b3_b4) (and (val_on_b1_b2) (val_YOon_b2_b3-and-YOon_b3_b4)))
     (:derived (val_on_b2_b3) (on b2 b3))
     (:derived (val_on_b2_b3-and-YOon_b3_b4) (and (val_on_b2_b3) (val_YOon_b3_b4)))
     (:derived (val_on_b3_b4) (on b3 b4))
    (:action pick-up
        :parameters (?x)
        :precondition (and (clear ?x) (ontable ?x) (emptyhand))
        :effect (and (and (not (ontable ?x)) (not (clear ?x)) (not (emptyhand)) (holding ?x)) (when (val_Oon_b2_b3-and-YOon_b3_b4) (Oon_b2_b3-and-YOon_b3_b4)) (when (val_Oon_b1_b2-and-YOon_b2_b3-and-YOon_b3_b4) (Oon_b1_b2-and-YOon_b2_b3-and-YOon_b3_b4)) (when (val_Oon_b3_b4) (Oon_b3_b4)))
    )
     (:action put-down
        :parameters (?x)
        :precondition (holding ?x)
        :effect (and (and (not (holding ?x)) (clear ?x) (emptyhand) (ontable ?x)) (when (val_Oon_b2_b3-and-YOon_b3_b4) (Oon_b2_b3-and-YOon_b3_b4)) (when (val_Oon_b1_b2-and-YOon_b2_b3-and-YOon_b3_b4) (Oon_b1_b2-and-YOon_b2_b3-and-YOon_b3_b4)) (when (val_Oon_b3_b4) (Oon_b3_b4)))
    )
     (:action stack
        :parameters (?x ?y)
        :precondition (and (holding ?x) (clear ?y))
        :effect (and (and (not (holding ?x)) (not (clear ?y)) (clear ?x) (emptyhand) (on ?x ?y)) (when (val_Oon_b2_b3-and-YOon_b3_b4) (Oon_b2_b3-and-YOon_b3_b4)) (when (val_Oon_b1_b2-and-YOon_b2_b3-and-YOon_b3_b4) (Oon_b1_b2-and-YOon_b2_b3-and-YOon_b3_b4)) (when (val_Oon_b3_b4) (Oon_b3_b4)))
    )
     (:action unstack
        :parameters (?x ?y)
        :precondition (and (on ?x ?y) (clear ?x) (emptyhand))
        :effect (and (and (holding ?x) (clear ?y) (not (clear ?x)) (not (emptyhand)) (not (on ?x ?y))) (when (val_Oon_b2_b3-and-YOon_b3_b4) (Oon_b2_b3-and-YOon_b3_b4)) (when (val_Oon_b1_b2-and-YOon_b2_b3-and-YOon_b3_b4) (Oon_b1_b2-and-YOon_b2_b3-and-YOon_b3_b4)) (when (val_Oon_b3_b4) (Oon_b3_b4)))
    )
)