(define (problem bw_14)
	(:domain blocks-domain)
	(:objects b1 - block b2 - block b3 - block b4 - block b5 - block b6 - block b7 - block b8 - block b9 - block b10 - block b11 - block b12 - block b13 - block b14 - block)
	(:init (clear b1) (clear b10) (clear b11) (clear b12) (clear b13) (clear b14) (clear b2) (clear b3) (clear b4) (clear b5) (clear b6) (clear b7) (clear b8) (clear b9) (emptyhand) (ontable b1) (ontable b10) (ontable b11) (ontable b12) (ontable b13) (ontable b14) (ontable b2) (ontable b3) (ontable b4) (ontable b5) (ontable b6) (ontable b7) (ontable b8) (ontable b9) (q1 b1 b2 b3 b4 b5 b6 b7 b8 b9 b10 b11 b12 b13 b14) (turnDomain))
(:goal (and (q14 b1 b2 b3 b4 b5 b6 b7 b8 b9 b10 b11 b12 b13 b14) (turnDomain)))
)