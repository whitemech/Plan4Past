
(define (problem triangle-tire-1)
  (:domain triangle-tire)
  (:objects l-1-1 l-1-2 l-1-3 l-2-1 l-2-2 l-2-3 l-3-1 l-3-2 l-3-3 - location)
  (:init (vehicleat l-1-1)(road l-1-1 l-1-2)(road l-1-2 l-1-3)(road l-1-1 l-2-1)(road l-1-2 l-2-2)(road l-2-1 l-1-2)(road l-2-2 l-1-3)(sparein l-2-1)(sparein l-2-2)(road l-2-1 l-3-1)(road l-3-1 l-2-2)(sparein l-3-1)(sparein l-3-1)(notflattire))
  (:goal (vehicleat l-1-3)))

