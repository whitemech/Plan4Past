(define (problem bw_5_1)
    (:domain blocks-domain)
    (:objects b1 b2 b3 b4 b5)
    (:init (act) (clear b2) (clear b5) (emptyhand) (on b1 b3) (on b2 b1) (on b5 b4) (on-table b3) (on-table b4))
    (:goal (and (val_emptyhand-and-on_b1_b2-and-on_b2_b5-and-on-table_b3-and-on-table_b4-and-on-table_b5-and-clear_b1-and-clear_b3-and-clear_b4) (act)))
)