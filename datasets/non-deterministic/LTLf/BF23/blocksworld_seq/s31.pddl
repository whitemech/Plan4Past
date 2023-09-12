(define (problem sussman-anomaly)       ; graphplan 3 steps
    (:domain blocks-world-domain)
  (:objects A B C)
  (:init (block A) (block B) (block C)          
         (clear A) (clear B) (clear C)  
         (on A Table) (on B Table) (on C Table)
         (block Table) (clear Table))
(:goal (and ))
)
