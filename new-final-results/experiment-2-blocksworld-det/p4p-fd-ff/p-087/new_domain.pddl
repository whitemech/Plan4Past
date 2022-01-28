(define (domain blocks-domain)
    (:requirements :conditional-effects :derived-predicates :negative-preconditions :strips)
    (:types block)
    (:predicates (clear ?x) (emptyhand) (holding ?x) (on ?x ?y) (ontable ?x) (val_on_a1_n) (val_on_a_x) (val_on_b1_c1) (val_on_b_q) (val_on_c1_y) (val_on_c_l) (val_on_d1_e1) (val_on_d_f) (val_on_e1_z) (val_on_e_t) (val_on_f1_l1) (val_on_f_q1) (val_on_g1_p1) (val_on_g_a1) (val_on_h1_v) (val_on_h_w) (val_on_i1_u) (val_on_i_d1) (val_on_j1_b) (val_on_j_d) (val_on_j_d-and-on_d_f-and-on_f_q1-and-on_q1_g-and-on_g_a1-and-on_a1_n-and-on_n_g1-and-on_g1_p1-and-on_p1_f1-and-on_f1_l1-and-on_l1_i1-and-on_i1_u-and-on_u_b1-and-on_b1_c1-and-on_c1_y-and-on_y_k1-and-on_k1_h1-and-on_h1_v-and-on_v_c-and-on_c_l-and-on_l_e-and-on_e_t-and-on_t_o1-and-on_o1_o-and-on_o_s-and-on_s_h-and-on_h_w-and-on_w_i-and-on_i_d1-and-on_d1_e1-and-on_e1_z-and-on_z_a-and-on_a_x-and-on_x_p-and-on_p_m-and-on_m_k-and-on_k_m1-and-on_m1_r-and-on_r_j1-and-on_j1_b-and-on_b_q-and-on_q_n1) (val_on_k1_h1) (val_on_k_m1) (val_on_l1_i1) (val_on_l_e) (val_on_m1_r) (val_on_m_k) (val_on_n_g1) (val_on_o1_o) (val_on_o_s) (val_on_p1_f1) (val_on_p_m) (val_on_q1_g) (val_on_q_n1) (val_on_r_j1) (val_on_s_h) (val_on_t_o1) (val_on_u_b1) (val_on_v_c) (val_on_w_i) (val_on_x_p) (val_on_y_k1) (val_on_z_a))
    (:derived (val_on_a1_n) (on a1 n))
     (:derived (val_on_a_x) (on a x))
     (:derived (val_on_b1_c1) (on b1 c1))
     (:derived (val_on_b_q) (on b q))
     (:derived (val_on_c1_y) (on c1 y))
     (:derived (val_on_c_l) (on c l))
     (:derived (val_on_d1_e1) (on d1 e1))
     (:derived (val_on_d_f) (on d f))
     (:derived (val_on_e1_z) (on e1 z))
     (:derived (val_on_e_t) (on e t))
     (:derived (val_on_f1_l1) (on f1 l1))
     (:derived (val_on_f_q1) (on f q1))
     (:derived (val_on_g1_p1) (on g1 p1))
     (:derived (val_on_g_a1) (on g a1))
     (:derived (val_on_h1_v) (on h1 v))
     (:derived (val_on_h_w) (on h w))
     (:derived (val_on_i1_u) (on i1 u))
     (:derived (val_on_i_d1) (on i d1))
     (:derived (val_on_j1_b) (on j1 b))
     (:derived (val_on_j_d) (on j d))
     (:derived (val_on_j_d-and-on_d_f-and-on_f_q1-and-on_q1_g-and-on_g_a1-and-on_a1_n-and-on_n_g1-and-on_g1_p1-and-on_p1_f1-and-on_f1_l1-and-on_l1_i1-and-on_i1_u-and-on_u_b1-and-on_b1_c1-and-on_c1_y-and-on_y_k1-and-on_k1_h1-and-on_h1_v-and-on_v_c-and-on_c_l-and-on_l_e-and-on_e_t-and-on_t_o1-and-on_o1_o-and-on_o_s-and-on_s_h-and-on_h_w-and-on_w_i-and-on_i_d1-and-on_d1_e1-and-on_e1_z-and-on_z_a-and-on_a_x-and-on_x_p-and-on_p_m-and-on_m_k-and-on_k_m1-and-on_m1_r-and-on_r_j1-and-on_j1_b-and-on_b_q-and-on_q_n1) (and (val_on_j_d) (val_on_d_f) (val_on_f_q1) (val_on_q1_g) (val_on_g_a1) (val_on_a1_n) (val_on_n_g1) (val_on_g1_p1) (val_on_p1_f1) (val_on_f1_l1) (val_on_l1_i1) (val_on_i1_u) (val_on_u_b1) (val_on_b1_c1) (val_on_c1_y) (val_on_y_k1) (val_on_k1_h1) (val_on_h1_v) (val_on_v_c) (val_on_c_l) (val_on_l_e) (val_on_e_t) (val_on_t_o1) (val_on_o1_o) (val_on_o_s) (val_on_s_h) (val_on_h_w) (val_on_w_i) (val_on_i_d1) (val_on_d1_e1) (val_on_e1_z) (val_on_z_a) (val_on_a_x) (val_on_x_p) (val_on_p_m) (val_on_m_k) (val_on_k_m1) (val_on_m1_r) (val_on_r_j1) (val_on_j1_b) (val_on_b_q) (val_on_q_n1)))
     (:derived (val_on_k1_h1) (on k1 h1))
     (:derived (val_on_k_m1) (on k m1))
     (:derived (val_on_l1_i1) (on l1 i1))
     (:derived (val_on_l_e) (on l e))
     (:derived (val_on_m1_r) (on m1 r))
     (:derived (val_on_m_k) (on m k))
     (:derived (val_on_n_g1) (on n g1))
     (:derived (val_on_o1_o) (on o1 o))
     (:derived (val_on_o_s) (on o s))
     (:derived (val_on_p1_f1) (on p1 f1))
     (:derived (val_on_p_m) (on p m))
     (:derived (val_on_q1_g) (on q1 g))
     (:derived (val_on_q_n1) (on q n1))
     (:derived (val_on_r_j1) (on r j1))
     (:derived (val_on_s_h) (on s h))
     (:derived (val_on_t_o1) (on t o1))
     (:derived (val_on_u_b1) (on u b1))
     (:derived (val_on_v_c) (on v c))
     (:derived (val_on_w_i) (on w i))
     (:derived (val_on_x_p) (on x p))
     (:derived (val_on_y_k1) (on y k1))
     (:derived (val_on_z_a) (on z a))
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