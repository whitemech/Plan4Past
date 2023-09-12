(define (problem sussman-anomaly)       ; graphplan 3 steps
    (:domain blocks-world-domain)
  (:objects A B C D)
  (:init (block A) (block B) (block C) (block D)       
         (clear A) (clear B) (clear C) (clear D)
         (on A Table) (on B Table) (on C Table) (on D Table)
         (block Table) (clear Table))
(:goal (and ))
)
