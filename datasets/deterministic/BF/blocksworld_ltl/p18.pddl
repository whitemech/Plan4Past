(define (problem bw_18)
  (:domain blocks-domain)
  (:objects b1 b2 b3 b4 b5 b6 b7 b8 b9 b10 b11 b12 b13 b14 b15 b16 b17 b18 - block)
  (:init (emptyhand) (ontable b1) (ontable b2) (ontable b3) (ontable b4) (ontable b5) (ontable b6) (ontable b7) (ontable b8) (ontable b9) (ontable b10) (ontable b11) (ontable b12) (ontable b13) (ontable b14) (ontable b15) (ontable b16) (ontable b17) (ontable b18) (clear b1) (clear b2) (clear b3) (clear b4) (clear b5) (clear b6) (clear b7) (clear b8) (clear b9) (clear b10) (clear b11) (clear b12) (clear b13) (clear b14) (clear b15) (clear b16) (clear b17) (clear b18))
  

 (:goal (and 

            (eventually (and (on b2 b1) (next 
                (eventually (and (on b3 b2) (next
                    (eventually (and (on b4 b3)
                        (next (eventually (on b6 b5))) (next (eventually (on b8 b7))) (next (eventually (on b10 b9))) (next (eventually (on b12 b11))) (next (eventually (on b14 b13))) (next (eventually (on b16 b15))) (next (eventually (on b18 b17)))
                    ))))))))
            
(eventually (and (on b17 b18) (next (eventually (and (on b16 b17) (next (eventually (and (on b15 b16) (next (eventually (and (on b14 b15) (next (eventually (and (on b13 b14) (next (eventually (and (on b12 b13) (next (eventually (and (on b11 b12) (next (eventually (and (on b10 b11) (next (eventually (and (on b9 b10) (next (eventually (and (on b8 b9) (next (eventually (and (on b7 b8) (next (eventually (and (on b6 b7) (next (eventually (and (on b5 b6) (next (eventually (and (on b4 b5) (next (eventually (and (on b3 b4) (next (eventually (and (on b2 b3) (next (eventually (on b1 b2)))))))))))))))))))))))))))))))))))))))))))))))))))) 

)