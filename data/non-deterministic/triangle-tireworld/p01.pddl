
(define (problem triangle-tire-1)
  (:domain triangle-tire)
  (:objects l1x1 l1x2 l1x3 l2x1 l2x2 l2x3 l3x1 l3x2 l3x3 - location)
  (:init (vehicleat l1x1)(road l1x1 l1x2)(road l1x2 l1x3)(road l1x1 l2x1)(road l1x2 l2x2)(road l2x1 l1x2)(road l2x2 l1x3)(sparein l2x1)(sparein l2x2)(road l2x1 l3x1)(road l3x1 l2x2)(sparein l3x1)(sparein l3x1)(notflattire))
  (:goal (vehicleat l1x3)))

