(define (problem blocks-5-2)
    (:domain blocks-domain)
    (:objects a b c d e)
    (:init (clear d) (emptyhand) (on a b) (on c a) (on d e) (on e c) (ontable b))
    (:goal (val_on_d_c-and-on_c_b-and-on_b_e-and-on_e_a))
)