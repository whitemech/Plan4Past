(define (problem bw_7)
	(:domain blocks-domain)
	(:objects b1 - block b2 - block b3 - block b4 - block b5 - block b6 - block b7 - block)
	(:init (clear b1) (clear b2) (clear b3) (clear b4) (clear b5) (clear b6) (clear b7) (emptyhand) (ontable b1) (ontable b2) (ontable b3) (ontable b4) (ontable b5) (ontable b6) (ontable b7) (q1 b1 b2 b3) (turnDomain))
(:goal (and (q3 b1 b2 b3) (turnDomain)))
)