(define (problem blocks-9-2)
    (:domain blocks-domain)
    (:objects a b c d e f g h i)
    (:init (clear f) (clear h) (emptyhand) (on a d) (on b g) (on c i) (on d e) (on e c) (on h a) (on i b) (ontable f) (ontable g))
    (:goal (val_on_f_g-and-on_g_h-and-on_h_d-and-on_d_i-and-on_i_e-and-on_e_b-and-on_b_c-and-on_c_a))
)