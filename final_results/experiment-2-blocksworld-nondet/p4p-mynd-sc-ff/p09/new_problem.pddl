(define (problem bw_5_9)
    (:domain blocks-domain)
    (:objects b1 b2 b3 b4 b5)
    (:init (act) (clear b4) (emptyhand) (on b2 b1) (on b3 b2) (on b4 b5) (on b5 b3) (on-table b1))
    (:goal (and (val_emptyhand-and-on_b1_b4-and-on-table_b2-and-on_b3_b2-and-on-table_b4-and-on-table_b5-and-clear_b1-and-clear_b3-and-clear_b5) (act)))
)