(define (domain blocks-domain)
    (:requirements :conditional-effects :derived-predicates :negative-preconditions :strips)
    (:types block)
    (:predicates (clear ?x) (emptyhand) (holding ?x) (on ?x ?y) (ontable ?x) (val_on_a1_l1) (val_on_a_c1) (val_on_b1_m1) (val_on_b_p1) (val_on_c1_z) (val_on_c_h1) (val_on_d1_g) (val_on_d_i) (val_on_e1_u) (val_on_e_f) (val_on_f1_q) (val_on_f_n) (val_on_g1_o1) (val_on_g_r) (val_on_h1_m) (val_on_h_k1) (val_on_i1_q1) (val_on_i_t) (val_on_j1_c) (val_on_k1_k) (val_on_k_o) (val_on_l1_j1) (val_on_l_n1) (val_on_l_n1-and-on_n1_w-and-on_w_g1-and-on_g1_o1-and-on_o1_e1-and-on_e1_u-and-on_u_i1-and-on_i1_q1-and-on_q1_x-and-on_x_v-and-on_v_y-and-on_y_a1-and-on_a1_l1-and-on_l1_j1-and-on_j1_c-and-on_c_h1-and-on_h1_m-and-on_m_h-and-on_h_k1-and-on_k1_k-and-on_k_o-and-on_o_f1-and-on_f1_q-and-on_q_p-and-on_p_b1-and-on_b1_m1-and-on_m1_b-and-on_b_p1-and-on_p1_s-and-on_s_a-and-on_a_c1-and-on_c1_z-and-on_z_e-and-on_e_f-and-on_f_n-and-on_n_d1-and-on_d1_g-and-on_g_r-and-on_r_d-and-on_d_i-and-on_i_t-and-on_t_j) (val_on_m1_b) (val_on_m_h) (val_on_n1_w) (val_on_n_d1) (val_on_o1_e1) (val_on_o_f1) (val_on_p1_s) (val_on_p_b1) (val_on_q1_x) (val_on_q_p) (val_on_r_d) (val_on_s_a) (val_on_t_j) (val_on_u_i1) (val_on_v_y) (val_on_w_g1) (val_on_x_v) (val_on_y_a1) (val_on_z_e))
    (:derived (val_on_a1_l1) (on a1 l1))
     (:derived (val_on_a_c1) (on a c1))
     (:derived (val_on_b1_m1) (on b1 m1))
     (:derived (val_on_b_p1) (on b p1))
     (:derived (val_on_c1_z) (on c1 z))
     (:derived (val_on_c_h1) (on c h1))
     (:derived (val_on_d1_g) (on d1 g))
     (:derived (val_on_d_i) (on d i))
     (:derived (val_on_e1_u) (on e1 u))
     (:derived (val_on_e_f) (on e f))
     (:derived (val_on_f1_q) (on f1 q))
     (:derived (val_on_f_n) (on f n))
     (:derived (val_on_g1_o1) (on g1 o1))
     (:derived (val_on_g_r) (on g r))
     (:derived (val_on_h1_m) (on h1 m))
     (:derived (val_on_h_k1) (on h k1))
     (:derived (val_on_i1_q1) (on i1 q1))
     (:derived (val_on_i_t) (on i t))
     (:derived (val_on_j1_c) (on j1 c))
     (:derived (val_on_k1_k) (on k1 k))
     (:derived (val_on_k_o) (on k o))
     (:derived (val_on_l1_j1) (on l1 j1))
     (:derived (val_on_l_n1) (on l n1))
     (:derived (val_on_l_n1-and-on_n1_w-and-on_w_g1-and-on_g1_o1-and-on_o1_e1-and-on_e1_u-and-on_u_i1-and-on_i1_q1-and-on_q1_x-and-on_x_v-and-on_v_y-and-on_y_a1-and-on_a1_l1-and-on_l1_j1-and-on_j1_c-and-on_c_h1-and-on_h1_m-and-on_m_h-and-on_h_k1-and-on_k1_k-and-on_k_o-and-on_o_f1-and-on_f1_q-and-on_q_p-and-on_p_b1-and-on_b1_m1-and-on_m1_b-and-on_b_p1-and-on_p1_s-and-on_s_a-and-on_a_c1-and-on_c1_z-and-on_z_e-and-on_e_f-and-on_f_n-and-on_n_d1-and-on_d1_g-and-on_g_r-and-on_r_d-and-on_d_i-and-on_i_t-and-on_t_j) (and (val_on_l_n1) (val_on_n1_w) (val_on_w_g1) (val_on_g1_o1) (val_on_o1_e1) (val_on_e1_u) (val_on_u_i1) (val_on_i1_q1) (val_on_q1_x) (val_on_x_v) (val_on_v_y) (val_on_y_a1) (val_on_a1_l1) (val_on_l1_j1) (val_on_j1_c) (val_on_c_h1) (val_on_h1_m) (val_on_m_h) (val_on_h_k1) (val_on_k1_k) (val_on_k_o) (val_on_o_f1) (val_on_f1_q) (val_on_q_p) (val_on_p_b1) (val_on_b1_m1) (val_on_m1_b) (val_on_b_p1) (val_on_p1_s) (val_on_s_a) (val_on_a_c1) (val_on_c1_z) (val_on_z_e) (val_on_e_f) (val_on_f_n) (val_on_n_d1) (val_on_d1_g) (val_on_g_r) (val_on_r_d) (val_on_d_i) (val_on_i_t) (val_on_t_j)))
     (:derived (val_on_m1_b) (on m1 b))
     (:derived (val_on_m_h) (on m h))
     (:derived (val_on_n1_w) (on n1 w))
     (:derived (val_on_n_d1) (on n d1))
     (:derived (val_on_o1_e1) (on o1 e1))
     (:derived (val_on_o_f1) (on o f1))
     (:derived (val_on_p1_s) (on p1 s))
     (:derived (val_on_p_b1) (on p b1))
     (:derived (val_on_q1_x) (on q1 x))
     (:derived (val_on_q_p) (on q p))
     (:derived (val_on_r_d) (on r d))
     (:derived (val_on_s_a) (on s a))
     (:derived (val_on_t_j) (on t j))
     (:derived (val_on_u_i1) (on u i1))
     (:derived (val_on_v_y) (on v y))
     (:derived (val_on_w_g1) (on w g1))
     (:derived (val_on_x_v) (on x v))
     (:derived (val_on_y_a1) (on y a1))
     (:derived (val_on_z_e) (on z e))
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