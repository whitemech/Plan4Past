(define (problem bw_15_22)
  (:domain blocks-domain)
  (:objects b1 b2 b3 b4 b5 b6 b7 b8 b9 b10 b11 b12 b13 b14 b15 - block)
  (:init (emptyhand) (on b1 b4) (on b2 b9) (ontable b3) (on b4 b11) (on b5 b3) (on b6 b13) (ontable b7) (on b8 b14) (on b9 b12) (ontable b10) (ontable b11) (on b12 b5) (on b13 b10) (on b14 b1) (on b15 b6) (clear b2) (clear b7) (clear b8) (clear b15))
  (:goal (and (emptyhand) (on b1 b11) (on b2 b12) (on b3 b9) (on b4 b14) (on b5 b7) (ontable b6) (ontable b7) (on b8 b4) (on b9 b10) (on b10 b6) (on b11 b15) (on b12 b3) (on b13 b2) (ontable b14) (on b15 b5) (clear b1) (clear b8) (clear b13)))
)