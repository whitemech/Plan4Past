(define (problem bw_10_13)
  (:domain blocks-domain)
  (:objects b1 b2 b3 b4 b5 b6 b7 b8 b9 b10 - block)
  (:init (emptyhand) (on b1 b7) (on b2 b8) (ontable b3) (on b4 b2) (on b5 b10) (on b6 b3) (ontable b7) (on b8 b5) (ontable b9) (ontable b10) (clear b1) (clear b4) (clear b6) (clear b9))
  (:goal (and (emptyhand) (on b1 b7) (on b2 b8) (on b3 b10) (ontable b4) (on b5 b4) (on b6 b3) (on b7 b6) (ontable b8) (ontable b9) (on b10 b5) (clear b1) (clear b2) (clear b9)))
)
