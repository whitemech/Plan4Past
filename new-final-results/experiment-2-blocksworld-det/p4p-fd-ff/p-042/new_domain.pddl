(define (domain blocks-domain)
    (:requirements :conditional-effects :derived-predicates :negative-preconditions :strips)
    (:types block)
    (:predicates (clear ?x) (emptyhand) (holding ?x) (on ?x ?y) (ontable ?x) (val_on_a_q) (val_on_b_r) (val_on_c_k) (val_on_d_c) (val_on_f_b) (val_on_g_m) (val_on_h_n) (val_on_h_n-and-on_n_a-and-on_a_q-and-on_q_i-and-on_i_o-and-on_o_s-and-on_s_d-and-on_d_c-and-on_c_k-and-on_k_p-and-on_p_l-and-on_l_j-and-on_j_t-and-on_t_g-and-on_g_m-and-on_m_f-and-on_f_b-and-on_b_r-and-on_r_e) (val_on_i_o) (val_on_j_t) (val_on_k_p) (val_on_l_j) (val_on_m_f) (val_on_n_a) (val_on_o_s) (val_on_p_l) (val_on_q_i) (val_on_r_e) (val_on_s_d) (val_on_t_g))
    (:derived (val_on_a_q) (on a q))
     (:derived (val_on_b_r) (on b r))
     (:derived (val_on_c_k) (on c k))
     (:derived (val_on_d_c) (on d c))
     (:derived (val_on_f_b) (on f b))
     (:derived (val_on_g_m) (on g m))
     (:derived (val_on_h_n) (on h n))
     (:derived (val_on_h_n-and-on_n_a-and-on_a_q-and-on_q_i-and-on_i_o-and-on_o_s-and-on_s_d-and-on_d_c-and-on_c_k-and-on_k_p-and-on_p_l-and-on_l_j-and-on_j_t-and-on_t_g-and-on_g_m-and-on_m_f-and-on_f_b-and-on_b_r-and-on_r_e) (and (val_on_h_n) (val_on_n_a) (val_on_a_q) (val_on_q_i) (val_on_i_o) (val_on_o_s) (val_on_s_d) (val_on_d_c) (val_on_c_k) (val_on_k_p) (val_on_p_l) (val_on_l_j) (val_on_j_t) (val_on_t_g) (val_on_g_m) (val_on_m_f) (val_on_f_b) (val_on_b_r) (val_on_r_e)))
     (:derived (val_on_i_o) (on i o))
     (:derived (val_on_j_t) (on j t))
     (:derived (val_on_k_p) (on k p))
     (:derived (val_on_l_j) (on l j))
     (:derived (val_on_m_f) (on m f))
     (:derived (val_on_n_a) (on n a))
     (:derived (val_on_o_s) (on o s))
     (:derived (val_on_p_l) (on p l))
     (:derived (val_on_q_i) (on q i))
     (:derived (val_on_r_e) (on r e))
     (:derived (val_on_s_d) (on s d))
     (:derived (val_on_t_g) (on t g))
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