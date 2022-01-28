(define (domain blocks-domain)
    (:requirements :conditional-effects :derived-predicates :negative-preconditions :strips)
    (:types block)
    (:predicates (clear ?x) (emptyhand) (holding ?x) (on ?x ?y) (ontable ?x) (val_on_a_e) (val_on_b_d) (val_on_c_b) (val_on_c_b-and-on_b_d-and-on_d_f-and-on_f_i-and-on_i_a-and-on_a_e-and-on_e_h-and-on_h_g-and-on_g_j) (val_on_d_f) (val_on_e_h) (val_on_f_i) (val_on_g_j) (val_on_h_g) (val_on_i_a))
    (:derived (val_on_a_e) (on a e))
     (:derived (val_on_b_d) (on b d))
     (:derived (val_on_c_b) (on c b))
     (:derived (val_on_c_b-and-on_b_d-and-on_d_f-and-on_f_i-and-on_i_a-and-on_a_e-and-on_e_h-and-on_h_g-and-on_g_j) (and (val_on_c_b) (val_on_b_d) (val_on_d_f) (val_on_f_i) (val_on_i_a) (val_on_a_e) (val_on_e_h) (val_on_h_g) (val_on_g_j)))
     (:derived (val_on_d_f) (on d f))
     (:derived (val_on_e_h) (on e h))
     (:derived (val_on_f_i) (on f i))
     (:derived (val_on_g_j) (on g j))
     (:derived (val_on_h_g) (on h g))
     (:derived (val_on_i_a) (on i a))
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