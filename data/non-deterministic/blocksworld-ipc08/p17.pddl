(define (problem bw_10_17)
  (:domain blocks-domain)
  (:objects b1 b2 b3 b4 b5 b6 b7 b8 b9 b10 - block)
  (:init (emptyhand) (ontable b1) (on b2 b1) (on b3 b8) (ontable b4) (ontable b5) (on b6 b9) (on b7 b10) (ontable b8) (on b9 b4) (on b10 b5) (clear b2) (clear b3) (clear b6) (clear b7))
  (:goal (and (emptyhand) (on b1 b8) (ontable b2) (on b3 b6) (on b4 b2) (ontable b5) (on b6 b10) (on b7 b1) (on b8 b5) (ontable b9) (ontable b10) (clear b3) (clear b4) (clear b7) (clear b9)))
)
