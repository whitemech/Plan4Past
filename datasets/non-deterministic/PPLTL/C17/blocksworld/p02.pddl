(define (problem sussman-anomaly)       ; graphplan 3 steps
    (:domain blocks-world-domain)
  (:objects A B C D)
  (:init (block A) (block B) (block C) (block Table) (block D)
	 (on C A) (on A Table) (on B Table) (on D C)
	 (clear D) (clear B) (clear Table))
  ; (:goal (and(eventually(on A Table))
  ; 	     (eventually(on B Table))
	;      (eventually(on C Table))

	;  ) 
  ; )
  (:goal (and  ))
)
