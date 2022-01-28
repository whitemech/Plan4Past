(define (domain blocks-domain)
    (:requirements :conditional-effects :derived-predicates :negative-preconditions :strips)
    (:types block)
    (:predicates (clear ?x) (emptyhand) (holding ?x) (on ?x ?y) (ontable ?x) (val_on_a_d) (val_on_b_e) (val_on_c_b) (val_on_c_b-and-on_b_e-and-on_e_g-and-on_g_f-and-on_f_a-and-on_a_d-and-on_d_h) (val_on_d_h) (val_on_e_g) (val_on_f_a) (val_on_g_f))
    (:derived (val_on_a_d) (on a d))
     (:derived (val_on_b_e) (on b e))
     (:derived (val_on_c_b) (on c b))
     (:derived (val_on_c_b-and-on_b_e-and-on_e_g-and-on_g_f-and-on_f_a-and-on_a_d-and-on_d_h) (and (val_on_c_b) (val_on_b_e) (val_on_e_g) (val_on_g_f) (val_on_f_a) (val_on_a_d) (val_on_d_h)))
     (:derived (val_on_d_h) (on d h))
     (:derived (val_on_e_g) (on e g))
     (:derived (val_on_f_a) (on f a))
     (:derived (val_on_g_f) (on g f))
    (:action pick-up
        :parameters (?x)
        :precondition (and (clear ?x) (ontable ?x) (emptyhand))
        :effect (and (and (not (ontable ?x)) (not (clear ?x)) (not (emptyhand)) (holding ?x)))
    )
     (:action put-down
        :parameters (?x)
        :precondition (holding ?x)
        :effect (and (and (not (holding ?x)) (clear ?x) (emptyhand) (ontable ?x)))
    )
     (:action stack
        :parameters (?x ?y)
        :precondition (and (holding ?x) (clear ?y))
        :effect (and (and (not (holding ?x)) (not (clear ?y)) (clear ?x) (emptyhand) (on ?x ?y)))
    )
     (:action unstack
        :parameters (?x ?y)
        :precondition (and (on ?x ?y) (clear ?x) (emptyhand))
        :effect (and (and (holding ?x) (clear ?y) (not (clear ?x)) (not (emptyhand)) (not (on ?x ?y))))
    )
)