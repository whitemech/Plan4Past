(define (problem bw_10)
  (:domain blocks-domain)
  (:objects b1 b2 b3 b4 b5 b6 b7 b8 b9 b10 - block)
  (:init (emptyhand) (ontable b1) (ontable b2) (ontable b3) (ontable b4) (ontable b5) (ontable b6) (ontable b7) (ontable b8) (ontable b9) (ontable b10) (clear b1) (clear b2) (clear b3) (clear b4) (clear b5) (clear b6) (clear b7) (clear b8) (clear b9) (clear b10))
  

 (:goal (and 

            (eventually (and (on b2 b1) (next 
                (eventually (and (on b3 b2) (next
                    (eventually (and (on b4 b3)
                        (next (eventually (on b6 b5))) (next (eventually (on b8 b7))) (next (eventually (on b10 b9)))
                    ))))))))
            
(eventually (and (on b9 b10) (next (eventually (and (on b8 b9) (next (eventually (and (on b7 b8) (next (eventually (and (on b6 b7) (next (eventually (and (on b5 b6) (next (eventually (and (on b4 b5) (next (eventually (and (on b3 b4) (next (eventually (and (on b2 b3) (next (eventually (on b1 b2)))))))))))))))))))))))))))) 

)