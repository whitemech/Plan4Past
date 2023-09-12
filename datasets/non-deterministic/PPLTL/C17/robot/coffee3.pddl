(define (problem coffee1)
   (:domain robot_coffee)
   (:objects o1 o2 o3 lab - office
             c - kitchen)
   (:init (robotat lab)
          (connected lab o1)
          (connected o1 lab)
          (connected o1 o2)
          (connected o2 o1)
          (connected o1 o3)
          (connected o3 o1)
          (connected o3 o2)
          (connected o2 o3)
          (connected c o3)
          (connected o3 c))
;    (:goal (eventually (not (robotat lab)))

; )

(:goal (and (robotat c)))

)
