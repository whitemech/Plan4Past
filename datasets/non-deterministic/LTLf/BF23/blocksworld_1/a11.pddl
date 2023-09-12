(define (problem sussman-anomaly)       ; graphplan 3 steps
    (:domain blocks-world-domain)
  (:objects A B C D E F G H I L M N)
  (:init (block A) (block B) (block C) (block Table) (block D) (block E) (block F)
	 (on C A) (on A Table) (on B Table) (on D C) (on E Table) (on F Table)
	 (clear D) (clear B) (clear Table) (clear E) (clear F)
     (block G) (on G Table) (clear G)
     (block H) (on H Table) (clear H)
     (block I) (on I Table) (clear I)
     (block L) (on L Table) (clear L)
     (block M) (on M Table) (clear M)
     (block N) (on N Table) (clear N) )
  (:goal  (and (on A B)))
)
