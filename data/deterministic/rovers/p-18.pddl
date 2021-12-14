(define (problem roverprob4621) (:domain Rover)
(:objects
	general - Lander
	colour high_res low_res - Mode
	rover0 rover1 rover2 rover3 rover4 rover5 - Rover
	rover0store rover1store rover2store rover3store rover4store rover5store - Store
	waypoint0 waypoint1 waypoint2 waypoint3 waypoint4 waypoint5 waypoint6 waypoint7 waypoint8 waypoint9 waypoint10 waypoint11 waypoint12 waypoint13 waypoint14 waypoint15 waypoint16 waypoint17 waypoint18 waypoint19 - Waypoint
	camera0 camera1 camera2 camera3 camera4 camera5 camera6 - Camera
	objective0 objective1 objective2 objective3 objective4 objective5 objective6 - Objective
	)
(:init
	(visible waypoint0 waypoint1)
	(visible waypoint1 waypoint0)
	(visible waypoint0 waypoint2)
	(visible waypoint2 waypoint0)
	(visible waypoint0 waypoint12)
	(visible waypoint12 waypoint0)
	(visible waypoint0 waypoint13)
	(visible waypoint13 waypoint0)
	(visible waypoint1 waypoint2)
	(visible waypoint2 waypoint1)
	(visible waypoint1 waypoint6)
	(visible waypoint6 waypoint1)
	(visible waypoint1 waypoint11)
	(visible waypoint11 waypoint1)
	(visible waypoint1 waypoint15)
	(visible waypoint15 waypoint1)
	(visible waypoint2 waypoint6)
	(visible waypoint6 waypoint2)
	(visible waypoint2 waypoint9)
	(visible waypoint9 waypoint2)
	(visible waypoint2 waypoint14)
	(visible waypoint14 waypoint2)
	(visible waypoint2 waypoint16)
	(visible waypoint16 waypoint2)
	(visible waypoint2 waypoint18)
	(visible waypoint18 waypoint2)
	(visible waypoint3 waypoint7)
	(visible waypoint7 waypoint3)
	(visible waypoint3 waypoint11)
	(visible waypoint11 waypoint3)
	(visible waypoint3 waypoint13)
	(visible waypoint13 waypoint3)
	(visible waypoint3 waypoint15)
	(visible waypoint15 waypoint3)
	(visible waypoint4 waypoint5)
	(visible waypoint5 waypoint4)
	(visible waypoint4 waypoint9)
	(visible waypoint9 waypoint4)
	(visible waypoint4 waypoint12)
	(visible waypoint12 waypoint4)
	(visible waypoint4 waypoint18)
	(visible waypoint18 waypoint4)
	(visible waypoint5 waypoint6)
	(visible waypoint6 waypoint5)
	(visible waypoint5 waypoint10)
	(visible waypoint10 waypoint5)
	(visible waypoint5 waypoint12)
	(visible waypoint12 waypoint5)
	(visible waypoint5 waypoint14)
	(visible waypoint14 waypoint5)
	(visible waypoint6 waypoint3)
	(visible waypoint3 waypoint6)
	(visible waypoint6 waypoint12)
	(visible waypoint12 waypoint6)
	(visible waypoint6 waypoint13)
	(visible waypoint13 waypoint6)
	(visible waypoint6 waypoint14)
	(visible waypoint14 waypoint6)
	(visible waypoint6 waypoint19)
	(visible waypoint19 waypoint6)
	(visible waypoint7 waypoint1)
	(visible waypoint1 waypoint7)
	(visible waypoint7 waypoint2)
	(visible waypoint2 waypoint7)
	(visible waypoint7 waypoint5)
	(visible waypoint5 waypoint7)
	(visible waypoint7 waypoint9)
	(visible waypoint9 waypoint7)
	(visible waypoint8 waypoint14)
	(visible waypoint14 waypoint8)
	(visible waypoint9 waypoint0)
	(visible waypoint0 waypoint9)
	(visible waypoint9 waypoint3)
	(visible waypoint3 waypoint9)
	(visible waypoint9 waypoint5)
	(visible waypoint5 waypoint9)
	(visible waypoint9 waypoint6)
	(visible waypoint6 waypoint9)
	(visible waypoint9 waypoint8)
	(visible waypoint8 waypoint9)
	(visible waypoint9 waypoint12)
	(visible waypoint12 waypoint9)
	(visible waypoint10 waypoint3)
	(visible waypoint3 waypoint10)
	(visible waypoint10 waypoint7)
	(visible waypoint7 waypoint10)
	(visible waypoint10 waypoint8)
	(visible waypoint8 waypoint10)
	(visible waypoint10 waypoint9)
	(visible waypoint9 waypoint10)
	(visible waypoint10 waypoint16)
	(visible waypoint16 waypoint10)
	(visible waypoint11 waypoint4)
	(visible waypoint4 waypoint11)
	(visible waypoint11 waypoint5)
	(visible waypoint5 waypoint11)
	(visible waypoint11 waypoint7)
	(visible waypoint7 waypoint11)
	(visible waypoint11 waypoint12)
	(visible waypoint12 waypoint11)
	(visible waypoint11 waypoint16)
	(visible waypoint16 waypoint11)
	(visible waypoint12 waypoint1)
	(visible waypoint1 waypoint12)
	(visible waypoint12 waypoint8)
	(visible waypoint8 waypoint12)
	(visible waypoint12 waypoint14)
	(visible waypoint14 waypoint12)
	(visible waypoint12 waypoint19)
	(visible waypoint19 waypoint12)
	(visible waypoint13 waypoint4)
	(visible waypoint4 waypoint13)
	(visible waypoint13 waypoint19)
	(visible waypoint19 waypoint13)
	(visible waypoint14 waypoint9)
	(visible waypoint9 waypoint14)
	(visible waypoint14 waypoint15)
	(visible waypoint15 waypoint14)
	(visible waypoint15 waypoint6)
	(visible waypoint6 waypoint15)
	(visible waypoint16 waypoint0)
	(visible waypoint0 waypoint16)
	(visible waypoint16 waypoint12)
	(visible waypoint12 waypoint16)
	(visible waypoint16 waypoint13)
	(visible waypoint13 waypoint16)
	(visible waypoint17 waypoint0)
	(visible waypoint0 waypoint17)
	(visible waypoint17 waypoint11)
	(visible waypoint11 waypoint17)
	(visible waypoint18 waypoint0)
	(visible waypoint0 waypoint18)
	(visible waypoint18 waypoint9)
	(visible waypoint9 waypoint18)
	(visible waypoint18 waypoint11)
	(visible waypoint11 waypoint18)
	(visible waypoint19 waypoint9)
	(visible waypoint9 waypoint19)
	(visible waypoint19 waypoint14)
	(visible waypoint14 waypoint19)
	(visible waypoint19 waypoint15)
	(visible waypoint15 waypoint19)
	(visible waypoint19 waypoint16)
	(visible waypoint16 waypoint19)
	(visible waypoint19 waypoint17)
	(visible waypoint17 waypoint19)
	(atsoilsample waypoint0)
	(atrocksample waypoint1)
	(atrocksample waypoint2)
	(atsoilsample waypoint3)
	(atrocksample waypoint4)
	(atrocksample waypoint5)
	(atrocksample waypoint6)
	(atrocksample waypoint7)
	(atsoilsample waypoint8)
	(atsoilsample waypoint9)
	(atrocksample waypoint9)
	(atsoilsample waypoint10)
	(atsoilsample waypoint11)
	(atsoilsample waypoint12)
	(atrocksample waypoint12)
	(atsoilsample waypoint13)
	(atrocksample waypoint13)
	(atsoilsample waypoint14)
	(atsoilsample waypoint15)
	(atsoilsample waypoint17)
	(atrocksample waypoint17)
	(atsoilsample waypoint18)
	(atrocksample waypoint18)
	(atsoilsample waypoint19)
	(atlander general waypoint17)
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
	(cantraverse rover0 waypoint2 waypoint6)
	(cantraverse rover0 waypoint6 waypoint2)
	(cantraverse rover0 waypoint2 waypoint7)
	(cantraverse rover0 waypoint7 waypoint2)
	(cantraverse rover0 waypoint2 waypoint9)
	(cantraverse rover0 waypoint9 waypoint2)
	(cantraverse rover0 waypoint2 waypoint14)
	(cantraverse rover0 waypoint14 waypoint2)
	(cantraverse rover0 waypoint2 waypoint18)
	(cantraverse rover0 waypoint18 waypoint2)
	(cantraverse rover0 waypoint0 waypoint12)
	(cantraverse rover0 waypoint12 waypoint0)
	(cantraverse rover0 waypoint0 waypoint13)
	(cantraverse rover0 waypoint13 waypoint0)
	(cantraverse rover0 waypoint6 waypoint1)
	(cantraverse rover0 waypoint1 waypoint6)
	(cantraverse rover0 waypoint6 waypoint15)
	(cantraverse rover0 waypoint15 waypoint6)
	(cantraverse rover0 waypoint6 waypoint19)
	(cantraverse rover0 waypoint19 waypoint6)
	(cantraverse rover0 waypoint7 waypoint3)
	(cantraverse rover0 waypoint3 waypoint7)
	(cantraverse rover0 waypoint7 waypoint11)
	(cantraverse rover0 waypoint11 waypoint7)
	(cantraverse rover0 waypoint9 waypoint4)
	(cantraverse rover0 waypoint4 waypoint9)
	(cantraverse rover0 waypoint9 waypoint5)
	(cantraverse rover0 waypoint5 waypoint9)
	(cantraverse rover0 waypoint9 waypoint8)
	(cantraverse rover0 waypoint8 waypoint9)
	(cantraverse rover0 waypoint13 waypoint16)
	(cantraverse rover0 waypoint16 waypoint13)
	(cantraverse rover0 waypoint5 waypoint10)
	(cantraverse rover0 waypoint10 waypoint5)
	(at rover1 waypoint9)
	(available rover1)
	(storeof rover1store rover1)
	(empty rover1store)
	(equippedforrockanalysis rover1)
	(equippedforimaging rover1)
	(cantraverse rover1 waypoint9 waypoint0)
	(cantraverse rover1 waypoint0 waypoint9)
	(cantraverse rover1 waypoint9 waypoint3)
	(cantraverse rover1 waypoint3 waypoint9)
	(cantraverse rover1 waypoint9 waypoint4)
	(cantraverse rover1 waypoint4 waypoint9)
	(cantraverse rover1 waypoint9 waypoint7)
	(cantraverse rover1 waypoint7 waypoint9)
	(cantraverse rover1 waypoint9 waypoint10)
	(cantraverse rover1 waypoint10 waypoint9)
	(cantraverse rover1 waypoint9 waypoint12)
	(cantraverse rover1 waypoint12 waypoint9)
	(cantraverse rover1 waypoint9 waypoint14)
	(cantraverse rover1 waypoint14 waypoint9)
	(cantraverse rover1 waypoint9 waypoint18)
	(cantraverse rover1 waypoint18 waypoint9)
	(cantraverse rover1 waypoint9 waypoint19)
	(cantraverse rover1 waypoint19 waypoint9)
	(cantraverse rover1 waypoint0 waypoint2)
	(cantraverse rover1 waypoint2 waypoint0)
	(cantraverse rover1 waypoint0 waypoint13)
	(cantraverse rover1 waypoint13 waypoint0)
	(cantraverse rover1 waypoint0 waypoint16)
	(cantraverse rover1 waypoint16 waypoint0)
	(cantraverse rover1 waypoint3 waypoint6)
	(cantraverse rover1 waypoint6 waypoint3)
	(cantraverse rover1 waypoint4 waypoint11)
	(cantraverse rover1 waypoint11 waypoint4)
	(cantraverse rover1 waypoint7 waypoint5)
	(cantraverse rover1 waypoint5 waypoint7)
	(cantraverse rover1 waypoint10 waypoint8)
	(cantraverse rover1 waypoint8 waypoint10)
	(cantraverse rover1 waypoint12 waypoint1)
	(cantraverse rover1 waypoint1 waypoint12)
	(cantraverse rover1 waypoint14 waypoint15)
	(cantraverse rover1 waypoint15 waypoint14)
	(cantraverse rover1 waypoint19 waypoint17)
	(cantraverse rover1 waypoint17 waypoint19)
	(at rover2 waypoint0)
	(available rover2)
	(storeof rover2store rover2)
	(empty rover2store)
	(equippedforsoilanalysis rover2)
	(equippedforimaging rover2)
	(cantraverse rover2 waypoint0 waypoint1)
	(cantraverse rover2 waypoint1 waypoint0)
	(cantraverse rover2 waypoint0 waypoint9)
	(cantraverse rover2 waypoint9 waypoint0)
	(cantraverse rover2 waypoint0 waypoint13)
	(cantraverse rover2 waypoint13 waypoint0)
	(cantraverse rover2 waypoint0 waypoint16)
	(cantraverse rover2 waypoint16 waypoint0)
	(cantraverse rover2 waypoint0 waypoint17)
	(cantraverse rover2 waypoint17 waypoint0)
	(cantraverse rover2 waypoint0 waypoint18)
	(cantraverse rover2 waypoint18 waypoint0)
	(cantraverse rover2 waypoint1 waypoint2)
	(cantraverse rover2 waypoint2 waypoint1)
	(cantraverse rover2 waypoint1 waypoint6)
	(cantraverse rover2 waypoint6 waypoint1)
	(cantraverse rover2 waypoint1 waypoint11)
	(cantraverse rover2 waypoint11 waypoint1)
	(cantraverse rover2 waypoint1 waypoint12)
	(cantraverse rover2 waypoint12 waypoint1)
	(cantraverse rover2 waypoint1 waypoint15)
	(cantraverse rover2 waypoint15 waypoint1)
	(cantraverse rover2 waypoint9 waypoint3)
	(cantraverse rover2 waypoint3 waypoint9)
	(cantraverse rover2 waypoint9 waypoint4)
	(cantraverse rover2 waypoint4 waypoint9)
	(cantraverse rover2 waypoint9 waypoint5)
	(cantraverse rover2 waypoint5 waypoint9)
	(cantraverse rover2 waypoint9 waypoint7)
	(cantraverse rover2 waypoint7 waypoint9)
	(cantraverse rover2 waypoint9 waypoint10)
	(cantraverse rover2 waypoint10 waypoint9)
	(cantraverse rover2 waypoint9 waypoint14)
	(cantraverse rover2 waypoint14 waypoint9)
	(cantraverse rover2 waypoint9 waypoint19)
	(cantraverse rover2 waypoint19 waypoint9)
	(at rover3 waypoint18)
	(available rover3)
	(storeof rover3store rover3)
	(empty rover3store)
	(equippedforrockanalysis rover3)
	(equippedforimaging rover3)
	(cantraverse rover3 waypoint18 waypoint0)
	(cantraverse rover3 waypoint0 waypoint18)
	(cantraverse rover3 waypoint18 waypoint4)
	(cantraverse rover3 waypoint4 waypoint18)
	(cantraverse rover3 waypoint18 waypoint11)
	(cantraverse rover3 waypoint11 waypoint18)
	(cantraverse rover3 waypoint0 waypoint1)
	(cantraverse rover3 waypoint1 waypoint0)
	(cantraverse rover3 waypoint0 waypoint2)
	(cantraverse rover3 waypoint2 waypoint0)
	(cantraverse rover3 waypoint0 waypoint9)
	(cantraverse rover3 waypoint9 waypoint0)
	(cantraverse rover3 waypoint0 waypoint12)
	(cantraverse rover3 waypoint12 waypoint0)
	(cantraverse rover3 waypoint0 waypoint17)
	(cantraverse rover3 waypoint17 waypoint0)
	(cantraverse rover3 waypoint11 waypoint16)
	(cantraverse rover3 waypoint16 waypoint11)
	(cantraverse rover3 waypoint1 waypoint6)
	(cantraverse rover3 waypoint6 waypoint1)
	(cantraverse rover3 waypoint1 waypoint7)
	(cantraverse rover3 waypoint7 waypoint1)
	(cantraverse rover3 waypoint1 waypoint15)
	(cantraverse rover3 waypoint15 waypoint1)
	(cantraverse rover3 waypoint2 waypoint14)
	(cantraverse rover3 waypoint14 waypoint2)
	(cantraverse rover3 waypoint9 waypoint3)
	(cantraverse rover3 waypoint3 waypoint9)
	(cantraverse rover3 waypoint9 waypoint5)
	(cantraverse rover3 waypoint5 waypoint9)
	(cantraverse rover3 waypoint9 waypoint8)
	(cantraverse rover3 waypoint8 waypoint9)
	(cantraverse rover3 waypoint12 waypoint19)
	(cantraverse rover3 waypoint19 waypoint12)
	(cantraverse rover3 waypoint16 waypoint13)
	(cantraverse rover3 waypoint13 waypoint16)
	(cantraverse rover3 waypoint7 waypoint10)
	(cantraverse rover3 waypoint10 waypoint7)
	(at rover4 waypoint3)
	(available rover4)
	(storeof rover4store rover4)
	(empty rover4store)
	(equippedforsoilanalysis rover4)
	(equippedforimaging rover4)
	(cantraverse rover4 waypoint3 waypoint6)
	(cantraverse rover4 waypoint6 waypoint3)
	(cantraverse rover4 waypoint3 waypoint7)
	(cantraverse rover4 waypoint7 waypoint3)
	(cantraverse rover4 waypoint3 waypoint9)
	(cantraverse rover4 waypoint9 waypoint3)
	(cantraverse rover4 waypoint3 waypoint10)
	(cantraverse rover4 waypoint10 waypoint3)
	(cantraverse rover4 waypoint3 waypoint11)
	(cantraverse rover4 waypoint11 waypoint3)
	(cantraverse rover4 waypoint3 waypoint13)
	(cantraverse rover4 waypoint13 waypoint3)
	(cantraverse rover4 waypoint3 waypoint15)
	(cantraverse rover4 waypoint15 waypoint3)
	(cantraverse rover4 waypoint6 waypoint5)
	(cantraverse rover4 waypoint5 waypoint6)
	(cantraverse rover4 waypoint6 waypoint12)
	(cantraverse rover4 waypoint12 waypoint6)
	(cantraverse rover4 waypoint6 waypoint14)
	(cantraverse rover4 waypoint14 waypoint6)
	(cantraverse rover4 waypoint9 waypoint0)
	(cantraverse rover4 waypoint0 waypoint9)
	(cantraverse rover4 waypoint9 waypoint4)
	(cantraverse rover4 waypoint4 waypoint9)
	(cantraverse rover4 waypoint9 waypoint8)
	(cantraverse rover4 waypoint8 waypoint9)
	(cantraverse rover4 waypoint9 waypoint19)
	(cantraverse rover4 waypoint19 waypoint9)
	(cantraverse rover4 waypoint10 waypoint16)
	(cantraverse rover4 waypoint16 waypoint10)
	(cantraverse rover4 waypoint11 waypoint17)
	(cantraverse rover4 waypoint17 waypoint11)
	(cantraverse rover4 waypoint11 waypoint18)
	(cantraverse rover4 waypoint18 waypoint11)
	(cantraverse rover4 waypoint15 waypoint1)
	(cantraverse rover4 waypoint1 waypoint15)
	(cantraverse rover4 waypoint14 waypoint2)
	(cantraverse rover4 waypoint2 waypoint14)
	(at rover5 waypoint0)
	(available rover5)
	(storeof rover5store rover5)
	(empty rover5store)
	(equippedforrockanalysis rover5)
	(equippedforimaging rover5)
	(cantraverse rover5 waypoint0 waypoint1)
	(cantraverse rover5 waypoint1 waypoint0)
	(cantraverse rover5 waypoint0 waypoint12)
	(cantraverse rover5 waypoint12 waypoint0)
	(cantraverse rover5 waypoint0 waypoint13)
	(cantraverse rover5 waypoint13 waypoint0)
	(cantraverse rover5 waypoint0 waypoint17)
	(cantraverse rover5 waypoint17 waypoint0)
	(cantraverse rover5 waypoint0 waypoint18)
	(cantraverse rover5 waypoint18 waypoint0)
	(cantraverse rover5 waypoint1 waypoint2)
	(cantraverse rover5 waypoint2 waypoint1)
	(cantraverse rover5 waypoint1 waypoint6)
	(cantraverse rover5 waypoint6 waypoint1)
	(cantraverse rover5 waypoint1 waypoint7)
	(cantraverse rover5 waypoint7 waypoint1)
	(cantraverse rover5 waypoint1 waypoint11)
	(cantraverse rover5 waypoint11 waypoint1)
	(cantraverse rover5 waypoint1 waypoint15)
	(cantraverse rover5 waypoint15 waypoint1)
	(cantraverse rover5 waypoint12 waypoint4)
	(cantraverse rover5 waypoint4 waypoint12)
	(cantraverse rover5 waypoint12 waypoint5)
	(cantraverse rover5 waypoint5 waypoint12)
	(cantraverse rover5 waypoint12 waypoint8)
	(cantraverse rover5 waypoint8 waypoint12)
	(cantraverse rover5 waypoint12 waypoint9)
	(cantraverse rover5 waypoint9 waypoint12)
	(cantraverse rover5 waypoint12 waypoint14)
	(cantraverse rover5 waypoint14 waypoint12)
	(cantraverse rover5 waypoint12 waypoint19)
	(cantraverse rover5 waypoint19 waypoint12)
	(cantraverse rover5 waypoint13 waypoint16)
	(cantraverse rover5 waypoint16 waypoint13)
	(cantraverse rover5 waypoint7 waypoint3)
	(cantraverse rover5 waypoint3 waypoint7)
	(cantraverse rover5 waypoint7 waypoint10)
	(cantraverse rover5 waypoint10 waypoint7)
	(onboard camera0 rover1)
	(calibrationtarget camera0 objective4)
	(supports camera0 high_res)
	(onboard camera1 rover2)
	(calibrationtarget camera1 objective6)
	(supports camera1 colour)
	(supports camera1 low_res)
	(onboard camera2 rover4)
	(calibrationtarget camera2 objective0)
	(supports camera2 colour)
	(supports camera2 high_res)
	(onboard camera3 rover3)
	(calibrationtarget camera3 objective6)
	(supports camera3 colour)
	(onboard camera4 rover3)
	(calibrationtarget camera4 objective4)
	(supports camera4 high_res)
	(supports camera4 low_res)
	(onboard camera5 rover0)
	(calibrationtarget camera5 objective2)
	(supports camera5 colour)
	(onboard camera6 rover5)
	(calibrationtarget camera6 objective6)
	(supports camera6 high_res)
	(supports camera6 low_res)
	(visiblefrom objective0 waypoint0)
	(visiblefrom objective0 waypoint1)
	(visiblefrom objective0 waypoint2)
	(visiblefrom objective0 waypoint3)
	(visiblefrom objective0 waypoint4)
	(visiblefrom objective0 waypoint5)
	(visiblefrom objective0 waypoint6)
	(visiblefrom objective0 waypoint7)
	(visiblefrom objective0 waypoint8)
	(visiblefrom objective0 waypoint9)
	(visiblefrom objective0 waypoint10)
	(visiblefrom objective1 waypoint0)
	(visiblefrom objective1 waypoint1)
	(visiblefrom objective1 waypoint2)
	(visiblefrom objective1 waypoint3)
	(visiblefrom objective1 waypoint4)
	(visiblefrom objective1 waypoint5)
	(visiblefrom objective1 waypoint6)
	(visiblefrom objective1 waypoint7)
	(visiblefrom objective1 waypoint8)
	(visiblefrom objective1 waypoint9)
	(visiblefrom objective1 waypoint10)
	(visiblefrom objective1 waypoint11)
	(visiblefrom objective1 waypoint12)
	(visiblefrom objective2 waypoint0)
	(visiblefrom objective2 waypoint1)
	(visiblefrom objective2 waypoint2)
	(visiblefrom objective2 waypoint3)
	(visiblefrom objective2 waypoint4)
	(visiblefrom objective2 waypoint5)
	(visiblefrom objective2 waypoint6)
	(visiblefrom objective2 waypoint7)
	(visiblefrom objective2 waypoint8)
	(visiblefrom objective2 waypoint9)
	(visiblefrom objective2 waypoint10)
	(visiblefrom objective2 waypoint11)
	(visiblefrom objective2 waypoint12)
	(visiblefrom objective2 waypoint13)
	(visiblefrom objective2 waypoint14)
	(visiblefrom objective3 waypoint0)
	(visiblefrom objective3 waypoint1)
	(visiblefrom objective3 waypoint2)
	(visiblefrom objective3 waypoint3)
	(visiblefrom objective3 waypoint4)
	(visiblefrom objective3 waypoint5)
	(visiblefrom objective3 waypoint6)
	(visiblefrom objective3 waypoint7)
	(visiblefrom objective3 waypoint8)
	(visiblefrom objective3 waypoint9)
	(visiblefrom objective3 waypoint10)
	(visiblefrom objective3 waypoint11)
	(visiblefrom objective3 waypoint12)
	(visiblefrom objective3 waypoint13)
	(visiblefrom objective3 waypoint14)
	(visiblefrom objective3 waypoint15)
	(visiblefrom objective3 waypoint16)
	(visiblefrom objective3 waypoint17)
	(visiblefrom objective3 waypoint18)
	(visiblefrom objective3 waypoint19)
	(visiblefrom objective4 waypoint0)
	(visiblefrom objective4 waypoint1)
	(visiblefrom objective4 waypoint2)
	(visiblefrom objective4 waypoint3)
	(visiblefrom objective4 waypoint4)
	(visiblefrom objective4 waypoint5)
	(visiblefrom objective4 waypoint6)
	(visiblefrom objective4 waypoint7)
	(visiblefrom objective4 waypoint8)
	(visiblefrom objective4 waypoint9)
	(visiblefrom objective4 waypoint10)
	(visiblefrom objective4 waypoint11)
	(visiblefrom objective4 waypoint12)
	(visiblefrom objective4 waypoint13)
	(visiblefrom objective4 waypoint14)
	(visiblefrom objective4 waypoint15)
	(visiblefrom objective5 waypoint0)
	(visiblefrom objective5 waypoint1)
	(visiblefrom objective5 waypoint2)
	(visiblefrom objective6 waypoint0)
	(visiblefrom objective6 waypoint1)
	(visiblefrom objective6 waypoint2)
	(visiblefrom objective6 waypoint3)
	(visiblefrom objective6 waypoint4)
	(visiblefrom objective6 waypoint5)
	(visiblefrom objective6 waypoint6)
	(visiblefrom objective6 waypoint7)
	(visiblefrom objective6 waypoint8)
	(visiblefrom objective6 waypoint9)
	(visiblefrom objective6 waypoint10)
)

(:goal (and
(communicatedsoildata waypoint14)
(communicatedsoildata waypoint0)
(communicatedrockdata waypoint4)
(communicatedrockdata waypoint7)
(communicatedrockdata waypoint2)
(communicatedrockdata waypoint5)
(communicatedrockdata waypoint6)
(communicatedimagedata objective5 colour)
(communicatedimagedata objective3 low_res)
(communicatedimagedata objective2 colour)
(communicatedimagedata objective4 high_res)
	)
)
)