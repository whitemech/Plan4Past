(define (domain blocks-domain)
	(:requirements :strips)
	(:constants )
	(:types block qstate)
	(:predicates (ontable ?x - block) (on ?x ?y - block) (clear ?x - block) (emptyhand) (holding ?x - block) (prev_autstate ?q - qstate) (is_accepting ?q - qstate) (dummy_goal))
	(:action pick-up
		:parameters (?x - block)
		:precondition (and (clear ?x) (ontable ?x) (emptyhand) )
		:effect (and 
			(when (prev_autstate q0)
			 (and (not (prev_autstate q0)) (prev_autstate q1))
			) 
			(when (and (prev_autstate q1) (not (on b5 b6)))
			 (and )
			) 
			(when (and (prev_autstate q1) (on b5 b6))
			 (and (not (prev_autstate q1)) (prev_autstate q3))
			) 
			(when (prev_autstate q2)
			 (and )
			) 
			(when (and (prev_autstate q3) (not (on b4 b5)))
			 (and )
			) 
			(when (and (prev_autstate q3) (on b4 b5))
			 (and (not (prev_autstate q3)) (prev_autstate q4))
			) 
			(when (and (prev_autstate q4) (not (on b3 b4)))
			 (and )
			) 
			(when (and (prev_autstate q4) (on b3 b4))
			 (and (not (prev_autstate q4)) (prev_autstate q5))
			) 
			(when (and (prev_autstate q5) (not (on b2 b3)))
			 (and )
			) 
			(when (and (prev_autstate q5) (on b2 b3))
			 (and (not (prev_autstate q5)) (prev_autstate q6))
			) 
			(when (and (prev_autstate q6) (not (on b1 b2)))
			 (and )
			) 
			(when (and (prev_autstate q6) (on b1 b2))
			 (and (not (prev_autstate q6)) (prev_autstate q7))
			) 
			(when (prev_autstate q7)
			 (and )
			) 
			(when (prev_autstate q8)
			 (and (not (prev_autstate q8)) (prev_autstate q2))
			) 
			(when (prev_autstate q0)
			 (and (not (prev_autstate q0)) (prev_autstate q1))
			) 
			(when (and (prev_autstate q1) (not (on b5 b6)))
			 (and )
			) 
			(when (and (prev_autstate q1) (on b5 b6))
			 (and (not (prev_autstate q1)) (prev_autstate q3))
			) 
			(when (prev_autstate q2)
			 (and )
			) 
			(when (and (prev_autstate q3) (not (on b4 b5)))
			 (and )
			) 
			(when (and (prev_autstate q3) (on b4 b5))
			 (and (not (prev_autstate q3)) (prev_autstate q4))
			) 
			(when (and (prev_autstate q4) (not (on b3 b4)))
			 (and )
			) 
			(when (and (prev_autstate q4) (on b3 b4))
			 (and (not (prev_autstate q4)) (prev_autstate q5))
			) 
			(when (and (prev_autstate q5) (not (on b2 b3)))
			 (and )
			) 
			(when (and (prev_autstate q5) (on b2 b3))
			 (and (not (prev_autstate q5)) (prev_autstate q6))
			) 
			(when (and (prev_autstate q6) (not (on b1 b2)))
			 (and )
			) 
			(when (and (prev_autstate q6) (on b1 b2))
			 (and (not (prev_autstate q6)) (prev_autstate q7))
			) 
			(when (prev_autstate q7)
			 (and )
			) 
			(when (prev_autstate q8)
			 (and (not (prev_autstate q8)) (prev_autstate q2))
			) 
			(when (prev_autstate q0)
			 (and (not (prev_autstate q0)) (prev_autstate q1))
			) 
			(when (and (prev_autstate q1) (not (on b5 b6)))
			 (and )
			) 
			(when (and (prev_autstate q1) (on b5 b6))
			 (and (not (prev_autstate q1)) (prev_autstate q3))
			) 
			(when (prev_autstate q2)
			 (and )
			) 
			(when (and (prev_autstate q3) (not (on b4 b5)))
			 (and )
			) 
			(when (and (prev_autstate q3) (on b4 b5))
			 (and (not (prev_autstate q3)) (prev_autstate q4))
			) 
			(when (and (prev_autstate q4) (not (on b3 b4)))
			 (and )
			) 
			(when (and (prev_autstate q4) (on b3 b4))
			 (and (not (prev_autstate q4)) (prev_autstate q5))
			) 
			(when (and (prev_autstate q5) (not (on b2 b3)))
			 (and )
			) 
			(when (and (prev_autstate q5) (on b2 b3))
			 (and (not (prev_autstate q5)) (prev_autstate q6))
			) 
			(when (and (prev_autstate q6) (not (on b1 b2)))
			 (and )
			) 
			(when (and (prev_autstate q6) (on b1 b2))
			 (and (not (prev_autstate q6)) (prev_autstate q7))
			) 
			(when (prev_autstate q7)
			 (and )
			) 
			(when (prev_autstate q8)
			 (and (not (prev_autstate q8)) (prev_autstate q2))
			) 
			(when (prev_autstate q0)
			 (and (not (prev_autstate q0)) (prev_autstate q1))
			) 
			(when (and (prev_autstate q1) (not (on b5 b6)))
			 (and )
			) 
			(when (and (prev_autstate q1) (on b5 b6))
			 (and (not (prev_autstate q1)) (prev_autstate q3))
			) 
			(when (prev_autstate q2)
			 (and )
			) 
			(when (and (prev_autstate q3) (not (on b4 b5)))
			 (and )
			) 
			(when (and (prev_autstate q3) (on b4 b5))
			 (and (not (prev_autstate q3)) (prev_autstate q4))
			) 
			(when (and (prev_autstate q4) (not (on b3 b4)))
			 (and )
			) 
			(when (and (prev_autstate q4) (on b3 b4))
			 (and (not (prev_autstate q4)) (prev_autstate q5))
			) 
			(when (and (prev_autstate q5) (not (on b2 b3)))
			 (and )
			) 
			(when (and (prev_autstate q5) (on b2 b3))
			 (and (not (prev_autstate q5)) (prev_autstate q6))
			) 
			(when (and (prev_autstate q6) (not (on b1 b2)))
			 (and )
			) 
			(when (and (prev_autstate q6) (on b1 b2))
			 (and (not (prev_autstate q6)) (prev_autstate q7))
			) 
			(when (prev_autstate q7)
			 (and )
			) 
			(when (prev_autstate q8)
			 (and (not (prev_autstate q8)) (prev_autstate q2))
			) (holding ?x) (not (ontable ?x)) (not (clear ?x)) (not (emptyhand)))
	)
	(:action put-down
		:parameters (?x - block)
		:precondition (and (holding ?x) )
		:effect (and 
			(when (prev_autstate q0)
			 (and (not (prev_autstate q0)) (prev_autstate q1))
			) 
			(when (and (prev_autstate q1) (not (on b5 b6)))
			 (and )
			) 
			(when (and (prev_autstate q1) (on b5 b6))
			 (and (not (prev_autstate q1)) (prev_autstate q3))
			) 
			(when (prev_autstate q2)
			 (and )
			) 
			(when (and (prev_autstate q3) (not (on b4 b5)))
			 (and )
			) 
			(when (and (prev_autstate q3) (on b4 b5))
			 (and (not (prev_autstate q3)) (prev_autstate q4))
			) 
			(when (and (prev_autstate q4) (not (on b3 b4)))
			 (and )
			) 
			(when (and (prev_autstate q4) (on b3 b4))
			 (and (not (prev_autstate q4)) (prev_autstate q5))
			) 
			(when (and (prev_autstate q5) (not (on b2 b3)))
			 (and )
			) 
			(when (and (prev_autstate q5) (on b2 b3))
			 (and (not (prev_autstate q5)) (prev_autstate q6))
			) 
			(when (and (prev_autstate q6) (not (on b1 b2)))
			 (and )
			) 
			(when (and (prev_autstate q6) (on b1 b2))
			 (and (not (prev_autstate q6)) (prev_autstate q7))
			) 
			(when (prev_autstate q7)
			 (and )
			) 
			(when (prev_autstate q8)
			 (and (not (prev_autstate q8)) (prev_autstate q2))
			) 
			(when (prev_autstate q0)
			 (and (not (prev_autstate q0)) (prev_autstate q1))
			) 
			(when (and (prev_autstate q1) (not (on b5 b6)))
			 (and )
			) 
			(when (and (prev_autstate q1) (on b5 b6))
			 (and (not (prev_autstate q1)) (prev_autstate q3))
			) 
			(when (prev_autstate q2)
			 (and )
			) 
			(when (and (prev_autstate q3) (not (on b4 b5)))
			 (and )
			) 
			(when (and (prev_autstate q3) (on b4 b5))
			 (and (not (prev_autstate q3)) (prev_autstate q4))
			) 
			(when (and (prev_autstate q4) (not (on b3 b4)))
			 (and )
			) 
			(when (and (prev_autstate q4) (on b3 b4))
			 (and (not (prev_autstate q4)) (prev_autstate q5))
			) 
			(when (and (prev_autstate q5) (not (on b2 b3)))
			 (and )
			) 
			(when (and (prev_autstate q5) (on b2 b3))
			 (and (not (prev_autstate q5)) (prev_autstate q6))
			) 
			(when (and (prev_autstate q6) (not (on b1 b2)))
			 (and )
			) 
			(when (and (prev_autstate q6) (on b1 b2))
			 (and (not (prev_autstate q6)) (prev_autstate q7))
			) 
			(when (prev_autstate q7)
			 (and )
			) 
			(when (prev_autstate q8)
			 (and (not (prev_autstate q8)) (prev_autstate q2))
			) 
			(when (prev_autstate q0)
			 (and (not (prev_autstate q0)) (prev_autstate q1))
			) 
			(when (and (prev_autstate q1) (not (on b5 b6)))
			 (and )
			) 
			(when (and (prev_autstate q1) (on b5 b6))
			 (and (not (prev_autstate q1)) (prev_autstate q3))
			) 
			(when (prev_autstate q2)
			 (and )
			) 
			(when (and (prev_autstate q3) (not (on b4 b5)))
			 (and )
			) 
			(when (and (prev_autstate q3) (on b4 b5))
			 (and (not (prev_autstate q3)) (prev_autstate q4))
			) 
			(when (and (prev_autstate q4) (not (on b3 b4)))
			 (and )
			) 
			(when (and (prev_autstate q4) (on b3 b4))
			 (and (not (prev_autstate q4)) (prev_autstate q5))
			) 
			(when (and (prev_autstate q5) (not (on b2 b3)))
			 (and )
			) 
			(when (and (prev_autstate q5) (on b2 b3))
			 (and (not (prev_autstate q5)) (prev_autstate q6))
			) 
			(when (and (prev_autstate q6) (not (on b1 b2)))
			 (and )
			) 
			(when (and (prev_autstate q6) (on b1 b2))
			 (and (not (prev_autstate q6)) (prev_autstate q7))
			) 
			(when (prev_autstate q7)
			 (and )
			) 
			(when (prev_autstate q8)
			 (and (not (prev_autstate q8)) (prev_autstate q2))
			) 
			(when (prev_autstate q0)
			 (and (not (prev_autstate q0)) (prev_autstate q1))
			) 
			(when (and (prev_autstate q1) (not (on b5 b6)))
			 (and )
			) 
			(when (and (prev_autstate q1) (on b5 b6))
			 (and (not (prev_autstate q1)) (prev_autstate q3))
			) 
			(when (prev_autstate q2)
			 (and )
			) 
			(when (and (prev_autstate q3) (not (on b4 b5)))
			 (and )
			) 
			(when (and (prev_autstate q3) (on b4 b5))
			 (and (not (prev_autstate q3)) (prev_autstate q4))
			) 
			(when (and (prev_autstate q4) (not (on b3 b4)))
			 (and )
			) 
			(when (and (prev_autstate q4) (on b3 b4))
			 (and (not (prev_autstate q4)) (prev_autstate q5))
			) 
			(when (and (prev_autstate q5) (not (on b2 b3)))
			 (and )
			) 
			(when (and (prev_autstate q5) (on b2 b3))
			 (and (not (prev_autstate q5)) (prev_autstate q6))
			) 
			(when (and (prev_autstate q6) (not (on b1 b2)))
			 (and )
			) 
			(when (and (prev_autstate q6) (on b1 b2))
			 (and (not (prev_autstate q6)) (prev_autstate q7))
			) 
			(when (prev_autstate q7)
			 (and )
			) 
			(when (prev_autstate q8)
			 (and (not (prev_autstate q8)) (prev_autstate q2))
			) (clear ?x) (emptyhand) (ontable ?x) (not (holding ?x)))
	)
	(:action stack
		:parameters (?x ?y - block)
		:precondition (and (holding ?x) (clear ?y) )
		:effect (and 
			(when (prev_autstate q0)
			 (and (not (prev_autstate q0)) (prev_autstate q1))
			) 
			(when (and (prev_autstate q1) (not (on b5 b6)))
			 (and )
			) 
			(when (and (prev_autstate q1) (on b5 b6))
			 (and (not (prev_autstate q1)) (prev_autstate q3))
			) 
			(when (prev_autstate q2)
			 (and )
			) 
			(when (and (prev_autstate q3) (not (on b4 b5)))
			 (and )
			) 
			(when (and (prev_autstate q3) (on b4 b5))
			 (and (not (prev_autstate q3)) (prev_autstate q4))
			) 
			(when (and (prev_autstate q4) (not (on b3 b4)))
			 (and )
			) 
			(when (and (prev_autstate q4) (on b3 b4))
			 (and (not (prev_autstate q4)) (prev_autstate q5))
			) 
			(when (and (prev_autstate q5) (not (on b2 b3)))
			 (and )
			) 
			(when (and (prev_autstate q5) (on b2 b3))
			 (and (not (prev_autstate q5)) (prev_autstate q6))
			) 
			(when (and (prev_autstate q6) (not (on b1 b2)))
			 (and )
			) 
			(when (and (prev_autstate q6) (on b1 b2))
			 (and (not (prev_autstate q6)) (prev_autstate q7))
			) 
			(when (prev_autstate q7)
			 (and )
			) 
			(when (prev_autstate q8)
			 (and (not (prev_autstate q8)) (prev_autstate q2))
			) 
			(when (prev_autstate q0)
			 (and (not (prev_autstate q0)) (prev_autstate q1))
			) 
			(when (and (prev_autstate q1) (not (on b5 b6)))
			 (and )
			) 
			(when (and (prev_autstate q1) (on b5 b6))
			 (and (not (prev_autstate q1)) (prev_autstate q3))
			) 
			(when (prev_autstate q2)
			 (and )
			) 
			(when (and (prev_autstate q3) (not (on b4 b5)))
			 (and )
			) 
			(when (and (prev_autstate q3) (on b4 b5))
			 (and (not (prev_autstate q3)) (prev_autstate q4))
			) 
			(when (and (prev_autstate q4) (not (on b3 b4)))
			 (and )
			) 
			(when (and (prev_autstate q4) (on b3 b4))
			 (and (not (prev_autstate q4)) (prev_autstate q5))
			) 
			(when (and (prev_autstate q5) (not (on b2 b3)))
			 (and )
			) 
			(when (and (prev_autstate q5) (on b2 b3))
			 (and (not (prev_autstate q5)) (prev_autstate q6))
			) 
			(when (and (prev_autstate q6) (not (on b1 b2)))
			 (and )
			) 
			(when (and (prev_autstate q6) (on b1 b2))
			 (and (not (prev_autstate q6)) (prev_autstate q7))
			) 
			(when (prev_autstate q7)
			 (and )
			) 
			(when (prev_autstate q8)
			 (and (not (prev_autstate q8)) (prev_autstate q2))
			) 
			(when (prev_autstate q0)
			 (and (not (prev_autstate q0)) (prev_autstate q1))
			) 
			(when (and (prev_autstate q1) (not (on b5 b6)))
			 (and )
			) 
			(when (and (prev_autstate q1) (on b5 b6))
			 (and (not (prev_autstate q1)) (prev_autstate q3))
			) 
			(when (prev_autstate q2)
			 (and )
			) 
			(when (and (prev_autstate q3) (not (on b4 b5)))
			 (and )
			) 
			(when (and (prev_autstate q3) (on b4 b5))
			 (and (not (prev_autstate q3)) (prev_autstate q4))
			) 
			(when (and (prev_autstate q4) (not (on b3 b4)))
			 (and )
			) 
			(when (and (prev_autstate q4) (on b3 b4))
			 (and (not (prev_autstate q4)) (prev_autstate q5))
			) 
			(when (and (prev_autstate q5) (not (on b2 b3)))
			 (and )
			) 
			(when (and (prev_autstate q5) (on b2 b3))
			 (and (not (prev_autstate q5)) (prev_autstate q6))
			) 
			(when (and (prev_autstate q6) (not (on b1 b2)))
			 (and )
			) 
			(when (and (prev_autstate q6) (on b1 b2))
			 (and (not (prev_autstate q6)) (prev_autstate q7))
			) 
			(when (prev_autstate q7)
			 (and )
			) 
			(when (prev_autstate q8)
			 (and (not (prev_autstate q8)) (prev_autstate q2))
			) 
			(when (prev_autstate q0)
			 (and (not (prev_autstate q0)) (prev_autstate q1))
			) 
			(when (and (prev_autstate q1) (not (on b5 b6)))
			 (and )
			) 
			(when (and (prev_autstate q1) (on b5 b6))
			 (and (not (prev_autstate q1)) (prev_autstate q3))
			) 
			(when (prev_autstate q2)
			 (and )
			) 
			(when (and (prev_autstate q3) (not (on b4 b5)))
			 (and )
			) 
			(when (and (prev_autstate q3) (on b4 b5))
			 (and (not (prev_autstate q3)) (prev_autstate q4))
			) 
			(when (and (prev_autstate q4) (not (on b3 b4)))
			 (and )
			) 
			(when (and (prev_autstate q4) (on b3 b4))
			 (and (not (prev_autstate q4)) (prev_autstate q5))
			) 
			(when (and (prev_autstate q5) (not (on b2 b3)))
			 (and )
			) 
			(when (and (prev_autstate q5) (on b2 b3))
			 (and (not (prev_autstate q5)) (prev_autstate q6))
			) 
			(when (and (prev_autstate q6) (not (on b1 b2)))
			 (and )
			) 
			(when (and (prev_autstate q6) (on b1 b2))
			 (and (not (prev_autstate q6)) (prev_autstate q7))
			) 
			(when (prev_autstate q7)
			 (and )
			) 
			(when (prev_autstate q8)
			 (and (not (prev_autstate q8)) (prev_autstate q2))
			) (clear ?x) (emptyhand) (on ?x ?y) (not (holding ?x)) (not (clear ?y)))
	)
	(:action unstack
		:parameters (?x ?y - block)
		:precondition (and (on ?x ?y) (clear ?x) (emptyhand) )
		:effect (and 
			(when (prev_autstate q0)
			 (and (not (prev_autstate q0)) (prev_autstate q1))
			) 
			(when (and (prev_autstate q1) (not (on b5 b6)))
			 (and )
			) 
			(when (and (prev_autstate q1) (on b5 b6))
			 (and (not (prev_autstate q1)) (prev_autstate q3))
			) 
			(when (prev_autstate q2)
			 (and )
			) 
			(when (and (prev_autstate q3) (not (on b4 b5)))
			 (and )
			) 
			(when (and (prev_autstate q3) (on b4 b5))
			 (and (not (prev_autstate q3)) (prev_autstate q4))
			) 
			(when (and (prev_autstate q4) (not (on b3 b4)))
			 (and )
			) 
			(when (and (prev_autstate q4) (on b3 b4))
			 (and (not (prev_autstate q4)) (prev_autstate q5))
			) 
			(when (and (prev_autstate q5) (not (on b2 b3)))
			 (and )
			) 
			(when (and (prev_autstate q5) (on b2 b3))
			 (and (not (prev_autstate q5)) (prev_autstate q6))
			) 
			(when (and (prev_autstate q6) (not (on b1 b2)))
			 (and )
			) 
			(when (and (prev_autstate q6) (on b1 b2))
			 (and (not (prev_autstate q6)) (prev_autstate q7))
			) 
			(when (prev_autstate q7)
			 (and )
			) 
			(when (prev_autstate q8)
			 (and (not (prev_autstate q8)) (prev_autstate q2))
			) 
			(when (prev_autstate q0)
			 (and (not (prev_autstate q0)) (prev_autstate q1))
			) 
			(when (and (prev_autstate q1) (not (on b5 b6)))
			 (and )
			) 
			(when (and (prev_autstate q1) (on b5 b6))
			 (and (not (prev_autstate q1)) (prev_autstate q3))
			) 
			(when (prev_autstate q2)
			 (and )
			) 
			(when (and (prev_autstate q3) (not (on b4 b5)))
			 (and )
			) 
			(when (and (prev_autstate q3) (on b4 b5))
			 (and (not (prev_autstate q3)) (prev_autstate q4))
			) 
			(when (and (prev_autstate q4) (not (on b3 b4)))
			 (and )
			) 
			(when (and (prev_autstate q4) (on b3 b4))
			 (and (not (prev_autstate q4)) (prev_autstate q5))
			) 
			(when (and (prev_autstate q5) (not (on b2 b3)))
			 (and )
			) 
			(when (and (prev_autstate q5) (on b2 b3))
			 (and (not (prev_autstate q5)) (prev_autstate q6))
			) 
			(when (and (prev_autstate q6) (not (on b1 b2)))
			 (and )
			) 
			(when (and (prev_autstate q6) (on b1 b2))
			 (and (not (prev_autstate q6)) (prev_autstate q7))
			) 
			(when (prev_autstate q7)
			 (and )
			) 
			(when (prev_autstate q8)
			 (and (not (prev_autstate q8)) (prev_autstate q2))
			) 
			(when (prev_autstate q0)
			 (and (not (prev_autstate q0)) (prev_autstate q1))
			) 
			(when (and (prev_autstate q1) (not (on b5 b6)))
			 (and )
			) 
			(when (and (prev_autstate q1) (on b5 b6))
			 (and (not (prev_autstate q1)) (prev_autstate q3))
			) 
			(when (prev_autstate q2)
			 (and )
			) 
			(when (and (prev_autstate q3) (not (on b4 b5)))
			 (and )
			) 
			(when (and (prev_autstate q3) (on b4 b5))
			 (and (not (prev_autstate q3)) (prev_autstate q4))
			) 
			(when (and (prev_autstate q4) (not (on b3 b4)))
			 (and )
			) 
			(when (and (prev_autstate q4) (on b3 b4))
			 (and (not (prev_autstate q4)) (prev_autstate q5))
			) 
			(when (and (prev_autstate q5) (not (on b2 b3)))
			 (and )
			) 
			(when (and (prev_autstate q5) (on b2 b3))
			 (and (not (prev_autstate q5)) (prev_autstate q6))
			) 
			(when (and (prev_autstate q6) (not (on b1 b2)))
			 (and )
			) 
			(when (and (prev_autstate q6) (on b1 b2))
			 (and (not (prev_autstate q6)) (prev_autstate q7))
			) 
			(when (prev_autstate q7)
			 (and )
			) 
			(when (prev_autstate q8)
			 (and (not (prev_autstate q8)) (prev_autstate q2))
			) 
			(when (prev_autstate q0)
			 (and (not (prev_autstate q0)) (prev_autstate q1))
			) 
			(when (and (prev_autstate q1) (not (on b5 b6)))
			 (and )
			) 
			(when (and (prev_autstate q1) (on b5 b6))
			 (and (not (prev_autstate q1)) (prev_autstate q3))
			) 
			(when (prev_autstate q2)
			 (and )
			) 
			(when (and (prev_autstate q3) (not (on b4 b5)))
			 (and )
			) 
			(when (and (prev_autstate q3) (on b4 b5))
			 (and (not (prev_autstate q3)) (prev_autstate q4))
			) 
			(when (and (prev_autstate q4) (not (on b3 b4)))
			 (and )
			) 
			(when (and (prev_autstate q4) (on b3 b4))
			 (and (not (prev_autstate q4)) (prev_autstate q5))
			) 
			(when (and (prev_autstate q5) (not (on b2 b3)))
			 (and )
			) 
			(when (and (prev_autstate q5) (on b2 b3))
			 (and (not (prev_autstate q5)) (prev_autstate q6))
			) 
			(when (and (prev_autstate q6) (not (on b1 b2)))
			 (and )
			) 
			(when (and (prev_autstate q6) (on b1 b2))
			 (and (not (prev_autstate q6)) (prev_autstate q7))
			) 
			(when (prev_autstate q7)
			 (and )
			) 
			(when (prev_autstate q8)
			 (and (not (prev_autstate q8)) (prev_autstate q2))
			) (holding ?x) (clear ?y) (not (clear ?x)) (not (emptyhand)) (not (on ?x ?y)))
	)
	(:action end
		:parameters (?q - qstate)
		:precondition (and (prev_autstate ?q) (is_accepting ?q) )
		:effect (dummy_goal)
	)
)
