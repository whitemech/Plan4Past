(define (problem coffee1)
   (:domain robot_coffee)
   (:objects o1 o2 o3 o4 lab - office
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
          (connected o1 o4)
          (connected o4 o1)
          (connected c o3)
          (connected o3 c))
   (:goal (eventually (and (eventually (coffee_at o4))(eventually (coffee_at lab))(eventually (coffee_at o1))(eventually (coffee_at o2))(eventually (coffee_at o3))))
	          

   )
	
)
