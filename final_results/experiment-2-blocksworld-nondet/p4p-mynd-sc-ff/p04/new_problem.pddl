(define (problem bw_5_4)
    (:domain blocks-domain)
    (:objects b1 b2 b3 b4 b5)
    (:init (act) (clear b2) (emptyhand) (on b1 b4) (on b2 b1) (on b4 b5) (on b5 b3) (on-table b3))
    (:goal (and (val_emptyhand-and-on_b1_b5-and-on_b2_b3-and-on_b3_b1-and-on_b4_b2-and-on-table_b5-and-clear_b4) (act)))
)