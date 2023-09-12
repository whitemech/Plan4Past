(define (problem coffee1)
   (:domain robot_coffee)
   (:objects o1 o2 o3 lab - office
             c - kitchen)
   (:init (robot_at lab)
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
   (:goal (and
	  (eventually (coffee_at o1))
	  (eventually (coffee_at o2))
	  (eventually (coffee_at o3))
	  (always ( imp (robot_at o2) (next (not (robot_at o3)) ) ) )
	  (always ( imp (robot_at o3) (next (not (robot_at o2)) ) ) )
	)
	          

)
	
)
