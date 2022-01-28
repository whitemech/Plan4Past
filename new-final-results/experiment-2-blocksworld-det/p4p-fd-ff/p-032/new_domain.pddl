(define (domain blocks-domain)
    (:requirements :conditional-effects :derived-predicates :negative-preconditions :strips)
    (:types block)
    (:predicates (clear ?x) (emptyhand) (holding ?x) (on ?x ?y) (ontable ?x) (val_on_a_b) (val_on_b_c) (val_on_c_n) (val_on_d_g) (val_on_d_g-and-on_g_f-and-on_f_k-and-on_k_j-and-on_j_e-and-on_e_m-and-on_m_a-and-on_a_b-and-on_b_c-and-on_c_n-and-on_n_o-and-on_o_i-and-on_i_l-and-on_l_h) (val_on_e_m) (val_on_f_k) (val_on_g_f) (val_on_i_l) (val_on_j_e) (val_on_k_j) (val_on_l_h) (val_on_m_a) (val_on_n_o) (val_on_o_i))
    (:derived (val_on_a_b) (on a b))
     (:derived (val_on_b_c) (on b c))
     (:derived (val_on_c_n) (on c n))
     (:derived (val_on_d_g) (on d g))
     (:derived (val_on_d_g-and-on_g_f-and-on_f_k-and-on_k_j-and-on_j_e-and-on_e_m-and-on_m_a-and-on_a_b-and-on_b_c-and-on_c_n-and-on_n_o-and-on_o_i-and-on_i_l-and-on_l_h) (and (val_on_d_g) (val_on_g_f) (val_on_f_k) (val_on_k_j) (val_on_j_e) (val_on_e_m) (val_on_m_a) (val_on_a_b) (val_on_b_c) (val_on_c_n) (val_on_n_o) (val_on_o_i) (val_on_i_l) (val_on_l_h)))
     (:derived (val_on_e_m) (on e m))
     (:derived (val_on_f_k) (on f k))
     (:derived (val_on_g_f) (on g f))
     (:derived (val_on_i_l) (on i l))
     (:derived (val_on_j_e) (on j e))
     (:derived (val_on_k_j) (on k j))
     (:derived (val_on_l_h) (on l h))
     (:derived (val_on_m_a) (on m a))
     (:derived (val_on_n_o) (on n o))
     (:derived (val_on_o_i) (on o i))
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