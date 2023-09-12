(define (problem sussman-anomaly)       ; graphplan 3 steps
    (:domain blocks-world-domain)
  (:objects A B C D E)
  (:init (block A) (block B) (block C) (block Table) (block D) (block E)
	 (on C A) (on A Table) (on B Table) (on D C) (on E Table)
	 (clear D) (clear B) (clear Table) (clear E))
;   (:goal  (and (until(on C A)(eventually(on A Table)))
;   	       (until(on C A)(eventually(on B Table)))
; 	       (until(on C A)(eventually(on C Table)))
; 	       (until(on C A)(eventually(on E Table)))
; 	  )
	 
;   )
(:goal (and ))

)
