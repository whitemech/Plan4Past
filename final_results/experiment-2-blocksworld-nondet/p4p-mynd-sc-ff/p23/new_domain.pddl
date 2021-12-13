(define (domain blocks-domain)
    (:requirements :conditional-effects :derived-predicates :equality :negative-preconditions :non-deterministic :typing)
    (:types block)
    (:predicates (act) (clear ?b) (emptyhand) (holding ?b) (on ?b1 ?b2) (on-table ?b) (val_clear_b1) (val_clear_b2) (val_clear_b6) (val_clear_b9) (val_emptyhand) (val_emptyhand-and-on_b1_b12-and-on_b2_b10-and-on-table_b3-and-on_b4_b7-and-on_b5_b15-and-on_b6_b5-and-on-table_b7-and-on-table_b8-and-on_b9_b3-and-on_b10_b13-and-on_b11_b8-and-on-table_b12-and-on_b13_b11-and-on_b14_b4-and-on_b15_b14-and-clear_b1-and-clear_b2-and-clear_b6-and-clear_b9) (val_on-table_b12) (val_on-table_b3) (val_on-table_b7) (val_on-table_b8) (val_on_b10_b13) (val_on_b11_b8) (val_on_b13_b11) (val_on_b14_b4) (val_on_b15_b14) (val_on_b1_b12) (val_on_b2_b10) (val_on_b4_b7) (val_on_b5_b15) (val_on_b6_b5) (val_on_b9_b3))
    (:derived (val_clear_b1) (clear b1))
     (:derived (val_clear_b2) (clear b2))
     (:derived (val_clear_b6) (clear b6))
     (:derived (val_clear_b9) (clear b9))
     (:derived (val_emptyhand) (emptyhand))
     (:derived (val_emptyhand-and-on_b1_b12-and-on_b2_b10-and-on-table_b3-and-on_b4_b7-and-on_b5_b15-and-on_b6_b5-and-on-table_b7-and-on-table_b8-and-on_b9_b3-and-on_b10_b13-and-on_b11_b8-and-on-table_b12-and-on_b13_b11-and-on_b14_b4-and-on_b15_b14-and-clear_b1-and-clear_b2-and-clear_b6-and-clear_b9) (and (val_emptyhand) (val_on_b1_b12) (val_on_b2_b10) (val_on-table_b3) (val_on_b4_b7) (val_on_b5_b15) (val_on_b6_b5) (val_on-table_b7) (val_on-table_b8) (val_on_b9_b3) (val_on_b10_b13) (val_on_b11_b8) (val_on-table_b12) (val_on_b13_b11) (val_on_b14_b4) (val_on_b15_b14) (val_clear_b1) (val_clear_b2) (val_clear_b6) (val_clear_b9)))
     (:derived (val_on-table_b12) (on-table b12))
     (:derived (val_on-table_b3) (on-table b3))
     (:derived (val_on-table_b7) (on-table b7))
     (:derived (val_on-table_b8) (on-table b8))
     (:derived (val_on_b10_b13) (on b10 b13))
     (:derived (val_on_b11_b8) (on b11 b8))
     (:derived (val_on_b13_b11) (on b13 b11))
     (:derived (val_on_b14_b4) (on b14 b4))
     (:derived (val_on_b15_b14) (on b15 b14))
     (:derived (val_on_b1_b12) (on b1 b12))
     (:derived (val_on_b2_b10) (on b2 b10))
     (:derived (val_on_b4_b7) (on b4 b7))
     (:derived (val_on_b5_b15) (on b5 b15))
     (:derived (val_on_b6_b5) (on b6 b5))
     (:derived (val_on_b9_b3) (on b9 b3))
    (:action pick-tower
        :parameters (?b1 ?b2 ?b3)
        :precondition (and (emptyhand) (on ?b1 ?b2) (on ?b2 ?b3) (act))
        :effect (and (oneof (and ) (and (holding ?b2) (clear ?b3) (not (emptyhand)) (not (on ?b2 ?b3)))) (not (act)))
    )
     (:action pick-up
        :parameters (?b1 ?b2)
        :precondition (and (not (Symbols.EQUAL ?b1 ?b2)) (emptyhand) (clear ?b1) (on ?b1 ?b2) (act))
        :effect (and (oneof (and (holding ?b1) (clear ?b2) (not (emptyhand)) (not (clear ?b1)) (not (on ?b1 ?b2))) (and (clear ?b2) (on-table ?b1) (not (on ?b1 ?b2)))) (not (act)))
    )
     (:action pick-up-from-table
        :parameters (?b)
        :precondition (and (emptyhand) (clear ?b) (on-table ?b) (act))
        :effect (and (oneof (and ) (and (holding ?b) (not (emptyhand)) (not (on-table ?b)))) (not (act)))
    )
     (:action prog
        :parameters ()
        :precondition (not (act))
        :effect (act)
    )
     (:action put-down
        :parameters (?b)
        :precondition (and (holding ?b) (act))
        :effect (and (and (on-table ?b) (emptyhand) (clear ?b) (not (holding ?b))) (not (act)))
    )
     (:action put-on-block
        :parameters (?b1 ?b2)
        :precondition (and (holding ?b1) (clear ?b2) (act))
        :effect (and (oneof (and (on ?b1 ?b2) (emptyhand) (clear ?b1) (not (holding ?b1)) (not (clear ?b2))) (and (on-table ?b1) (emptyhand) (clear ?b1) (not (holding ?b1)))) (not (act)))
    )
     (:action put-tower-down
        :parameters (?b1 ?b2)
        :precondition (and (holding ?b2) (on ?b1 ?b2) (act))
        :effect (and (and (on-table ?b2) (emptyhand) (not (holding ?b2))) (not (act)))
    )
     (:action put-tower-on-block
        :parameters (?b1 ?b2 ?b3)
        :precondition (and (holding ?b2) (on ?b1 ?b2) (clear ?b3) (act))
        :effect (and (oneof (and (on ?b2 ?b3) (emptyhand) (not (holding ?b2)) (not (clear ?b3))) (and (on-table ?b2) (emptyhand) (not (holding ?b2)))) (not (act)))
    )
)