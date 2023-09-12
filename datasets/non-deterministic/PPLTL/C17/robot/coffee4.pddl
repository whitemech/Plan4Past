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
;    (:goal (and
; 	  (eventually (coffeeat o1))
; 	  (eventually (coffeeat o2))
; 	  (eventually (coffeeat o3))
; 	  (always ( imp (robotat o2) (next (not (robotat o3)) ) ) )
; 	  (always ( imp (robotat o3) (next (not (robotat o2)) ) ) )
; 	)
	          

; )
(:goal (and (robotat c)))

	
)
