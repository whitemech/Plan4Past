(define (problem bw_5_5)
    (:domain blocks-domain)
    (:objects b1 b2 b3 b4 b5)
    (:init (act) (clear b3) (clear b4) (emptyhand) (on b3 b5) (on b4 b2) (on b5 b1) (on-table b1) (on-table b2))
    (:goal (and (val_emptyhand-and-on_b1_b3-and-on_b2_b4-and-on-table_b3-and-on_b4_b1-and-on-table_b5-and-clear_b2-and-clear_b5) (act)))
)