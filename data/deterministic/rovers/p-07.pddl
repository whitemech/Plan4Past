(define (problem roverprob4123) (:domain Rover)
(:objects
	general - Lander
	colour high_res low_res - Mode
	rover0 rover1 rover2 - Rover
	rover0store rover1store rover2store - Store
	waypoint0 waypoint1 waypoint2 waypoint3 waypoint4 waypoint5 - Waypoint
	camera0 camera1 - Camera
	objective0 objective1 - Objective
	)
(:init
	(visible waypoint0 waypoint3)
	(visible waypoint3 waypoint0)
	(visible waypoint0 waypoint5)
	(visible waypoint5 waypoint0)
	(visible waypoint1 waypoint0)
	(visible waypoint0 waypoint1)
	(visible waypoint2 waypoint0)
	(visible waypoint0 waypoint2)
	(visible waypoint2 waypoint1)
	(visible waypoint1 waypoint2)
	(visible waypoint2 waypoint5)
	(visible waypoint5 waypoint2)
	(visible waypoint3 waypoint2)
	(visible waypoint2 waypoint3)
	(visible waypoint4 waypoint0)
	(visible waypoint0 waypoint4)
	(visible waypoint4 waypoint3)
	(visible waypoint3 waypoint4)
	(visible waypoint5 waypoint1)
	(visible waypoint1 waypoint5)
	(visible waypoint5 waypoint4)
	(visible waypoint4 waypoint5)
	(atsoilsample waypoint1)
	(atrocksample waypoint2)
	(atrocksample waypoint3)
	(atsoilsample waypoint4)
	(atrocksample waypoint4)
	(atrocksample waypoint5)
	(atlander general waypoint3)
	(channelfree general)
	(at rover0 waypoint2)
	(available rover0)
	(storeof rover0store rover0)
	(empty rover0store)
	(equippedforsoilanalysis rover0)
	(equippedforrockanalysis rover0)
	(equippedforimaging rover0)
	(cantraverse rover0 waypoint2 waypoint0)
	(cantraverse rover0 waypoint0 waypoint2)
	(cantraverse rover0 waypoint2 waypoint1)
	(cantraverse rover0 waypoint1 waypoint2)
	(cantraverse rover0 waypoint2 waypoint3)
	(cantraverse rover0 waypoint3 waypoint2)
	(cantraverse rover0 waypoint2 waypoint5)
	(cantraverse rover0 waypoint5 waypoint2)
	(cantraverse rover0 waypoint0 waypoint4)
	(cantraverse rover0 waypoint4 waypoint0)
	(at rover1 waypoint3)
	(available rover1)
	(storeof rover1store rover1)
	(empty rover1store)
	(equippedforrockanalysis rover1)
	(cantraverse rover1 waypoint3 waypoint0)
	(cantraverse rover1 waypoint0 waypoint3)
	(cantraverse rover1 waypoint3 waypoint2)
	(cantraverse rover1 waypoint2 waypoint3)
	(cantraverse rover1 waypoint3 waypoint4)
	(cantraverse rover1 waypoint4 waypoint3)
	(cantraverse rover1 waypoint0 waypoint1)
	(cantraverse rover1 waypoint1 waypoint0)
	(cantraverse rover1 waypoint0 waypoint5)
	(cantraverse rover1 waypoint5 waypoint0)
	(at rover2 waypoint4)
	(available rover2)
	(storeof rover2store rover2)
	(empty rover2store)
	(equippedforsoilanalysis rover2)
	(equippedforrockanalysis rover2)
	(equippedforimaging rover2)
	(cantraverse rover2 waypoint4 waypoint0)
	(cantraverse rover2 waypoint0 waypoint4)
	(cantraverse rover2 waypoint4 waypoint5)
	(cantraverse rover2 waypoint5 waypoint4)
	(cantraverse rover2 waypoint0 waypoint1)
	(cantraverse rover2 waypoint1 waypoint0)
	(cantraverse rover2 waypoint0 waypoint3)
	(cantraverse rover2 waypoint3 waypoint0)
	(cantraverse rover2 waypoint5 waypoint2)
	(cantraverse rover2 waypoint2 waypoint5)
	(onboard camera0 rover0)
	(calibrationtarget camera0 objective0)
	(supports camera0 colour)
	(supports camera0 high_res)
	(onboard camera1 rover2)
	(calibrationtarget camera1 objective1)
	(supports camera1 high_res)
	(visiblefrom objective0 waypoint0)
	(visiblefrom objective0 waypoint1)
	(visiblefrom objective0 waypoint2)
	(visiblefrom objective0 waypoint3)
	(visiblefrom objective0 waypoint4)
	(visiblefrom objective1 waypoint0)
	(visiblefrom objective1 waypoint1)
	(visiblefrom objective1 waypoint2)
	(visiblefrom objective1 waypoint3)
)

(:goal (and
(communicatedsoildata waypoint4)
(communicatedsoildata waypoint1)
(communicatedrockdata waypoint3)
(communicatedrockdata waypoint2)
(communicatedrockdata waypoint4)
(communicatedimagedata objective0 high_res)
	)
)
)
