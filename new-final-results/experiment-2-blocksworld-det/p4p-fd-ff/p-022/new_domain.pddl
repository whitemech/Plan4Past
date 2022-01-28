(define (domain blocks-domain)
    (:requirements :conditional-effects :derived-predicates :negative-preconditions :strips)
    (:types block)
    (:predicates (clear ?x) (emptyhand) (holding ?x) (on ?x ?y) (ontable ?x) (val_on_a_j) (val_on_a_j-and-on_j_d-and-on_d_b-and-on_b_h-and-on_h_k-and-on_k_i-and-on_i_f-and-on_f_e-and-on_e_g-and-on_g_c) (val_on_b_h) (val_on_d_b) (val_on_e_g) (val_on_f_e) (val_on_g_c) (val_on_h_k) (val_on_i_f) (val_on_j_d) (val_on_k_i))
    (:derived (val_on_a_j) (on a j))
     (:derived (val_on_a_j-and-on_j_d-and-on_d_b-and-on_b_h-and-on_h_k-and-on_k_i-and-on_i_f-and-on_f_e-and-on_e_g-and-on_g_c) (and (val_on_a_j) (val_on_j_d) (val_on_d_b) (val_on_b_h) (val_on_h_k) (val_on_k_i) (val_on_i_f) (val_on_f_e) (val_on_e_g) (val_on_g_c)))
     (:derived (val_on_b_h) (on b h))
     (:derived (val_on_d_b) (on d b))
     (:derived (val_on_e_g) (on e g))
     (:derived (val_on_f_e) (on f e))
     (:derived (val_on_g_c) (on g c))
     (:derived (val_on_h_k) (on h k))
     (:derived (val_on_i_f) (on i f))
     (:derived (val_on_j_d) (on j d))
     (:derived (val_on_k_i) (on k i))
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