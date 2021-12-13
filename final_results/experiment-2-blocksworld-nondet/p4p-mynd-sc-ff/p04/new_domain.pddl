(define (domain blocks-domain)
    (:requirements :conditional-effects :derived-predicates :equality :negative-preconditions :non-deterministic :typing)
    (:types block)
    (:predicates (act) (clear ?b) (emptyhand) (holding ?b) (on ?b1 ?b2) (on-table ?b) (val_clear_b4) (val_emptyhand) (val_emptyhand-and-on_b1_b5-and-on_b2_b3-and-on_b3_b1-and-on_b4_b2-and-on-table_b5-and-clear_b4) (val_on-table_b5) (val_on_b1_b5) (val_on_b2_b3) (val_on_b3_b1) (val_on_b4_b2))
    (:derived (val_clear_b4) (clear b4))
     (:derived (val_emptyhand) (emptyhand))
     (:derived (val_emptyhand-and-on_b1_b5-and-on_b2_b3-and-on_b3_b1-and-on_b4_b2-and-on-table_b5-and-clear_b4) (and (val_emptyhand) (val_on_b1_b5) (val_on_b2_b3) (val_on_b3_b1) (val_on_b4_b2) (val_on-table_b5) (val_clear_b4)))
     (:derived (val_on-table_b5) (on-table b5))
     (:derived (val_on_b1_b5) (on b1 b5))
     (:derived (val_on_b2_b3) (on b2 b3))
     (:derived (val_on_b3_b1) (on b3 b1))
     (:derived (val_on_b4_b2) (on b4 b2))
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