(define (domain blocks-domain)
    (:requirements :conditional-effects :derived-predicates :negative-preconditions :strips)
    (:types block)
    (:predicates (clear ?x) (emptyhand) (holding ?x) (on ?x ?y) (ontable ?x) (val_on_a1_l) (val_on_a_t) (val_on_b1_a1) (val_on_b_o) (val_on_c1_z) (val_on_d_c) (val_on_e_i) (val_on_f_a) (val_on_g_r) (val_on_h_j) (val_on_i_f) (val_on_j_d) (val_on_k_p) (val_on_l_k) (val_on_m_c1) (val_on_n_h) (val_on_o_v) (val_on_p_g) (val_on_q_b1) (val_on_q_b1-and-on_b1_a1-and-on_a1_l-and-on_l_k-and-on_k_p-and-on_p_g-and-on_g_r-and-on_r_w-and-on_w_y-and-on_y_b-and-on_b_o-and-on_o_v-and-on_v_s-and-on_s_u-and-on_u_e-and-on_e_i-and-on_i_f-and-on_f_a-and-on_a_t-and-on_t_x-and-on_x_m-and-on_m_c1-and-on_c1_z-and-on_z_n-and-on_n_h-and-on_h_j-and-on_j_d-and-on_d_c) (val_on_r_w) (val_on_s_u) (val_on_t_x) (val_on_u_e) (val_on_v_s) (val_on_w_y) (val_on_x_m) (val_on_y_b) (val_on_z_n))
    (:derived (val_on_a1_l) (on a1 l))
     (:derived (val_on_a_t) (on a t))
     (:derived (val_on_b1_a1) (on b1 a1))
     (:derived (val_on_b_o) (on b o))
     (:derived (val_on_c1_z) (on c1 z))
     (:derived (val_on_d_c) (on d c))
     (:derived (val_on_e_i) (on e i))
     (:derived (val_on_f_a) (on f a))
     (:derived (val_on_g_r) (on g r))
     (:derived (val_on_h_j) (on h j))
     (:derived (val_on_i_f) (on i f))
     (:derived (val_on_j_d) (on j d))
     (:derived (val_on_k_p) (on k p))
     (:derived (val_on_l_k) (on l k))
     (:derived (val_on_m_c1) (on m c1))
     (:derived (val_on_n_h) (on n h))
     (:derived (val_on_o_v) (on o v))
     (:derived (val_on_p_g) (on p g))
     (:derived (val_on_q_b1) (on q b1))
     (:derived (val_on_q_b1-and-on_b1_a1-and-on_a1_l-and-on_l_k-and-on_k_p-and-on_p_g-and-on_g_r-and-on_r_w-and-on_w_y-and-on_y_b-and-on_b_o-and-on_o_v-and-on_v_s-and-on_s_u-and-on_u_e-and-on_e_i-and-on_i_f-and-on_f_a-and-on_a_t-and-on_t_x-and-on_x_m-and-on_m_c1-and-on_c1_z-and-on_z_n-and-on_n_h-and-on_h_j-and-on_j_d-and-on_d_c) (and (val_on_q_b1) (val_on_b1_a1) (val_on_a1_l) (val_on_l_k) (val_on_k_p) (val_on_p_g) (val_on_g_r) (val_on_r_w) (val_on_w_y) (val_on_y_b) (val_on_b_o) (val_on_o_v) (val_on_v_s) (val_on_s_u) (val_on_u_e) (val_on_e_i) (val_on_i_f) (val_on_f_a) (val_on_a_t) (val_on_t_x) (val_on_x_m) (val_on_m_c1) (val_on_c1_z) (val_on_z_n) (val_on_n_h) (val_on_h_j) (val_on_j_d) (val_on_d_c)))
     (:derived (val_on_r_w) (on r w))
     (:derived (val_on_s_u) (on s u))
     (:derived (val_on_t_x) (on t x))
     (:derived (val_on_u_e) (on u e))
     (:derived (val_on_v_s) (on v s))
     (:derived (val_on_w_y) (on w y))
     (:derived (val_on_x_m) (on x m))
     (:derived (val_on_y_b) (on y b))
     (:derived (val_on_z_n) (on z n))
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