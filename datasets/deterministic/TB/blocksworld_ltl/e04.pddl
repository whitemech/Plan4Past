(define (problem bw_6)
  (:domain blocks-domain)
  (:objects b1 b2 b3 b4 b5 b6 - block)
  (:init (emptyhand) (ontable b1) (ontable b2) (ontable b3) (ontable b4) (ontable b5) (ontable b6) (clear b1) (clear b2) (clear b3) (clear b4) (clear b5) (clear b6))
  

 (:goal (and 
(eventually 
		(and (eventually (on b1 b2)) (eventually (on b2 b3)) (eventually (on b3 b4)) (eventually (on b4 b5)))))) 

)