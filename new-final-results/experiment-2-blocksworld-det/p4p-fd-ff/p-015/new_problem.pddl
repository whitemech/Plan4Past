(define (problem blocks-8-2)
    (:domain blocks-domain)
    (:objects a b c d e f g h)
    (:init (clear a) (clear c) (clear d) (clear e) (clear h) (emptyhand) (on b f) (on d b) (on f g) (ontable a) (ontable c) (ontable e) (ontable g) (ontable h))
    (:goal (val_on_c_b-and-on_b_e-and-on_e_g-and-on_g_f-and-on_f_a-and-on_a_d-and-on_d_h))
)