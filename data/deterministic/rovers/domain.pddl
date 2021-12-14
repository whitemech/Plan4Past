(define (domain Rover)
(:requirements :typing)
(:types rover waypoint store camera mode lander objective)

(:predicates (at ?x - rover ?y - waypoint) 
             (atlander ?x - lander ?y - waypoint)
             (cantraverse ?r - rover ?x - waypoint ?y - waypoint)
	     (equippedforsoilanalysis ?r - rover)
             (equippedforrockanalysis ?r - rover)
             (equippedforimaging ?r - rover)
             (empty ?s - store)
             (haverockanalysis ?r - rover ?w - waypoint)
             (havesoilanalysis ?r - rover ?w - waypoint)
             (full ?s - store)
	     (calibrated ?c - camera ?r - rover) 
	     (supports ?c - camera ?m - mode)
             (available ?r - rover)
             (visible ?w - waypoint ?p - waypoint)
             (haveimage ?r - rover ?o - objective ?m - mode)
             (communicatedsoildata ?w - waypoint)
             (communicatedrockdata ?w - waypoint)
             (communicatedimagedata ?o - objective ?m - mode)
	     (atsoilsample ?w - waypoint)
	     (atrocksample ?w - waypoint)
             (visiblefrom ?o - objective ?w - waypoint)
	     (storeof ?s - store ?r - rover)
	     (calibrationtarget ?i - camera ?o - objective)
	     (onboard ?i - camera ?r - rover)
	     (channelfree ?l - lander)

)

	
(:action navigate
:parameters (?x - rover ?y - waypoint ?z - waypoint) 
:precondition (and (cantraverse ?x ?y ?z) (available ?x) (at ?x ?y)
                (visible ?y ?z)
	    )
:effect (and (not (at ?x ?y)) (at ?x ?z)
		)
)

(:action sample_soil
:parameters (?x - rover ?s - store ?p - waypoint)
:precondition (and (at ?x ?p) (atsoilsample ?p) (equippedforsoilanalysis ?x) (storeof ?s ?x) (empty ?s)
		)
:effect (and (not (empty ?s)) (full ?s) (havesoilanalysis ?x ?p) (not (atsoilsample ?p))
		)
)

(:action sample_rock
:parameters (?x - rover ?s - store ?p - waypoint)
:precondition (and (at ?x ?p) (atrocksample ?p) (equippedforrockanalysis ?x) (storeof ?s ?x)(empty ?s)
		)
:effect (and (not (empty ?s)) (full ?s) (haverockanalysis ?x ?p) (not (atrocksample ?p))
		)
)

(:action drop
:parameters (?x - rover ?y - store)
:precondition (and (storeof ?y ?x) (full ?y)
		)
:effect (and (not (full ?y)) (empty ?y)
	)
)

(:action calibrate
 :parameters (?r - rover ?i - camera ?t - objective ?w - waypoint)
 :precondition (and (equippedforimaging ?r) (calibrationtarget ?i ?t) (at ?r ?w) (visiblefrom ?t ?w)(onboard ?i ?r)
		)
 :effect (calibrated ?i ?r) 
)




(:action take_image
 :parameters (?r - rover ?p - waypoint ?o - objective ?i - camera ?m - mode)
 :precondition (and (calibrated ?i ?r)
			 (onboard ?i ?r)
                      (equippedforimaging ?r)
                      (supports ?i ?m)
			  (visiblefrom ?o ?p)
                     (at ?r ?p)
               )
 :effect (and (haveimage ?r ?o ?m)(not (calibrated ?i ?r))
		)
)


(:action communicate_soil_data
 :parameters (?r - rover ?l - lander ?p - waypoint ?x - waypoint ?y - waypoint)
 :precondition (and (at ?r ?x)(atlander ?l ?y)(havesoilanalysis ?r ?p)
                   (visible ?x ?y)(available ?r)(channelfree ?l)
            )
 :effect (and (not (available ?r))(not (channelfree ?l))(channelfree ?l)
		(communicatedsoildata ?p)(available ?r)
	)
)

(:action communicate_rock_data
 :parameters (?r - rover ?l - lander ?p - waypoint ?x - waypoint ?y - waypoint)
 :precondition (and (at ?r ?x)(atlander ?l ?y)(haverockanalysis ?r ?p)
                   (visible ?x ?y)(available ?r)(channelfree ?l)
            )
 :effect (and (not (available ?r))(not (channelfree ?l))(channelfree ?l)(communicatedrockdata ?p)(available ?r)
          )
)


(:action communicate_image_data
 :parameters (?r - rover ?l - lander ?o - objective ?m - mode ?x - waypoint ?y - waypoint)
 :precondition (and (at ?r ?x)(atlander ?l ?y)(haveimage ?r ?o ?m)(visible ?x ?y)(available ?r)(channelfree ?l)
            )
 :effect (and (not (available ?r))(not (channelfree ?l))(channelfree ?l)(communicatedimagedata ?o ?m)(available ?r)
          )
)

)
