(define (domain blocks-domain)
	(:requirements :non-deterministic :equality :typing)
	(:types block)
	(:predicates (holding ?b - block) (emptyhand) (on-table ?b - block) (on ?b1 - block ?b2 - block) (clear ?b - block) (q1 ?b1-00 - block ?b2-01 - block ?b1-02 - block ?b1-03 - block ?b1-04 - block ?b1-05 - block ?b1-06 - block) (q2 ?b1-00 - block ?b2-01 - block ?b1-02 - block ?b1-03 - block ?b1-04 - block ?b1-05 - block ?b1-06 - block) (q3 ?b1-00 - block ?b2-01 - block ?b1-02 - block ?b1-03 - block ?b1-04 - block ?b1-05 - block ?b1-06 - block) (q4 ?b1-00 - block ?b2-01 - block ?b1-02 - block ?b1-03 - block ?b1-04 - block ?b1-05 - block ?b1-06 - block) (q5 ?b1-00 - block ?b2-01 - block ?b1-02 - block ?b1-03 - block ?b1-04 - block ?b1-05 - block ?b1-06 - block) (q6 ?b1-00 - block ?b2-01 - block ?b1-02 - block ?b1-03 - block ?b1-04 - block ?b1-05 - block ?b1-06 - block) (q7 ?b1-00 - block ?b2-01 - block ?b1-02 - block ?b1-03 - block ?b1-04 - block ?b1-05 - block ?b1-06 - block) (turnDomain))
	(:action pick-up
		:parameters (?b1 - block ?b2 - block)
		:precondition (and (not (= ?b1 ?b2)) (emptyhand) (clear ?b1) (on ?b1 ?b2) (turnDomain))
		:effect (and (oneof (and (holding ?b1) (clear ?b2) (not (emptyhand)) (not (clear ?b1)) (not (on ?b1 ?b2))) (and (clear ?b2) (on-table ?b1) (not (on ?b1 ?b2)))) (not (turnDomain)))
	)
	(:action pick-up-from-table
		:parameters (?b - block)
		:precondition (and (emptyhand) (clear ?b) (on-table ?b) (turnDomain))
		:effect (and (oneof (and) (and (holding ?b) (not (emptyhand)) (not (on-table ?b)))) (not (turnDomain)))
	)
	(:action put-on-block
		:parameters (?b1 - block ?b2 - block)
		:precondition (and (holding ?b1) (clear ?b2) (turnDomain))
		:effect (and (oneof (and (on ?b1 ?b2) (emptyhand) (clear ?b1) (not (holding ?b1)) (not (clear ?b2))) (and (on-table ?b1) (emptyhand) (clear ?b1) (not (holding ?b1)))) (not (turnDomain)))
	)
	(:action put-down
		:parameters (?b - block)
		:precondition (and (holding ?b) (turnDomain))
		:effect (and (on-table ?b) (emptyhand) (clear ?b) (not (holding ?b)) (not (turnDomain)))
	)
	(:action pick-tower
		:parameters (?b1 - block ?b2 - block ?b3 - block)
		:precondition (and (emptyhand) (on ?b1 ?b2) (on ?b2 ?b3) (turnDomain))
		:effect (and (oneof (and) (and (holding ?b2) (clear ?b3) (not (emptyhand)) (not (on ?b2 ?b3)))) (not (turnDomain)))
	)
	(:action put-tower-on-block
		:parameters (?b1 - block ?b2 - block ?b3 - block)
		:precondition (and (holding ?b2) (on ?b1 ?b2) (clear ?b3) (turnDomain))
		:effect (and (oneof (and (on ?b2 ?b3) (emptyhand) (not (holding ?b2)) (not (clear ?b3))) (and (on-table ?b2) (emptyhand) (not (holding ?b2)))) (not (turnDomain)))
	)
	(:action put-tower-down
		:parameters (?b1 - block ?b2 - block)
		:precondition (and (holding ?b2) (on ?b1 ?b2) (turnDomain))
		:effect (and (on-table ?b2) (emptyhand) (not (holding ?b2)) (not (turnDomain)))
	)
	(:action trans-0
		:parameters (?b1-00 - block ?b2-01 - block ?b1-02 - block ?b1-03 - block ?b1-04 - block ?b1-05 - block ?b1-06 - block)
		:precondition (and (q1 ?b1-00 ?b2-01 ?b1-02 ?b1-03 ?b1-04 ?b1-05 ?b1-06) (not (on ?b1-06 ?b1-05)) (not (turnDomain)))
		:effect (and (q1 ?b1-00 ?b2-01 ?b1-02 ?b1-03 ?b1-04 ?b1-05 ?b1-06) (not (q2 ?b1-00 ?b2-01 ?b1-02 ?b1-03 ?b1-04 ?b1-05 ?b1-06)) (not (q3 ?b1-00 ?b2-01 ?b1-02 ?b1-03 ?b1-04 ?b1-05 ?b1-06)) (not (q4 ?b1-00 ?b2-01 ?b1-02 ?b1-03 ?b1-04 ?b1-05 ?b1-06)) (not (q5 ?b1-00 ?b2-01 ?b1-02 ?b1-03 ?b1-04 ?b1-05 ?b1-06)) (not (q6 ?b1-00 ?b2-01 ?b1-02 ?b1-03 ?b1-04 ?b1-05 ?b1-06)) (not (q7 ?b1-00 ?b2-01 ?b1-02 ?b1-03 ?b1-04 ?b1-05 ?b1-06)) (turnDomain))
	)
	(:action trans-1
		:parameters (?b1-00 - block ?b2-01 - block ?b1-02 - block ?b1-03 - block ?b1-04 - block ?b1-05 - block ?b1-06 - block)
		:precondition (and (or (and (q1 ?b1-00 ?b2-01 ?b1-02 ?b1-03 ?b1-04 ?b1-05 ?b1-06) (on ?b1-06 ?b1-05)) (and (q2 ?b1-00 ?b2-01 ?b1-02 ?b1-03 ?b1-04 ?b1-05 ?b1-06) (not (on ?b1-05 ?b1-04)))) (not (turnDomain)))
		:effect (and (q2 ?b1-00 ?b2-01 ?b1-02 ?b1-03 ?b1-04 ?b1-05 ?b1-06) (not (q1 ?b1-00 ?b2-01 ?b1-02 ?b1-03 ?b1-04 ?b1-05 ?b1-06)) (not (q3 ?b1-00 ?b2-01 ?b1-02 ?b1-03 ?b1-04 ?b1-05 ?b1-06)) (not (q4 ?b1-00 ?b2-01 ?b1-02 ?b1-03 ?b1-04 ?b1-05 ?b1-06)) (not (q5 ?b1-00 ?b2-01 ?b1-02 ?b1-03 ?b1-04 ?b1-05 ?b1-06)) (not (q6 ?b1-00 ?b2-01 ?b1-02 ?b1-03 ?b1-04 ?b1-05 ?b1-06)) (not (q7 ?b1-00 ?b2-01 ?b1-02 ?b1-03 ?b1-04 ?b1-05 ?b1-06)) (turnDomain))
	)
	(:action trans-2
		:parameters (?b1-00 - block ?b2-01 - block ?b1-02 - block ?b1-03 - block ?b1-04 - block ?b1-05 - block ?b1-06 - block)
		:precondition (and (or (and (q2 ?b1-00 ?b2-01 ?b1-02 ?b1-03 ?b1-04 ?b1-05 ?b1-06) (on ?b1-05 ?b1-04)) (and (q3 ?b1-00 ?b2-01 ?b1-02 ?b1-03 ?b1-04 ?b1-05 ?b1-06) (not (on ?b1-04 ?b1-03)))) (not (turnDomain)))
		:effect (and (q3 ?b1-00 ?b2-01 ?b1-02 ?b1-03 ?b1-04 ?b1-05 ?b1-06) (not (q1 ?b1-00 ?b2-01 ?b1-02 ?b1-03 ?b1-04 ?b1-05 ?b1-06)) (not (q2 ?b1-00 ?b2-01 ?b1-02 ?b1-03 ?b1-04 ?b1-05 ?b1-06)) (not (q4 ?b1-00 ?b2-01 ?b1-02 ?b1-03 ?b1-04 ?b1-05 ?b1-06)) (not (q5 ?b1-00 ?b2-01 ?b1-02 ?b1-03 ?b1-04 ?b1-05 ?b1-06)) (not (q6 ?b1-00 ?b2-01 ?b1-02 ?b1-03 ?b1-04 ?b1-05 ?b1-06)) (not (q7 ?b1-00 ?b2-01 ?b1-02 ?b1-03 ?b1-04 ?b1-05 ?b1-06)) (turnDomain))
	)
	(:action trans-3
		:parameters (?b1-00 - block ?b2-01 - block ?b1-02 - block ?b1-03 - block ?b1-04 - block ?b1-05 - block ?b1-06 - block)
		:precondition (and (or (and (q3 ?b1-00 ?b2-01 ?b1-02 ?b1-03 ?b1-04 ?b1-05 ?b1-06) (on ?b1-04 ?b1-03)) (and (q4 ?b1-00 ?b2-01 ?b1-02 ?b1-03 ?b1-04 ?b1-05 ?b1-06) (not (on ?b1-03 ?b1-02)))) (not (turnDomain)))
		:effect (and (q4 ?b1-00 ?b2-01 ?b1-02 ?b1-03 ?b1-04 ?b1-05 ?b1-06) (not (q1 ?b1-00 ?b2-01 ?b1-02 ?b1-03 ?b1-04 ?b1-05 ?b1-06)) (not (q2 ?b1-00 ?b2-01 ?b1-02 ?b1-03 ?b1-04 ?b1-05 ?b1-06)) (not (q3 ?b1-00 ?b2-01 ?b1-02 ?b1-03 ?b1-04 ?b1-05 ?b1-06)) (not (q5 ?b1-00 ?b2-01 ?b1-02 ?b1-03 ?b1-04 ?b1-05 ?b1-06)) (not (q6 ?b1-00 ?b2-01 ?b1-02 ?b1-03 ?b1-04 ?b1-05 ?b1-06)) (not (q7 ?b1-00 ?b2-01 ?b1-02 ?b1-03 ?b1-04 ?b1-05 ?b1-06)) (turnDomain))
	)
	(:action trans-4
		:parameters (?b1-00 - block ?b2-01 - block ?b1-02 - block ?b1-03 - block ?b1-04 - block ?b1-05 - block ?b1-06 - block)
		:precondition (and (or (and (q4 ?b1-00 ?b2-01 ?b1-02 ?b1-03 ?b1-04 ?b1-05 ?b1-06) (on ?b1-03 ?b1-02)) (and (q5 ?b1-00 ?b2-01 ?b1-02 ?b1-03 ?b1-04 ?b1-05 ?b1-06) (not (on ?b1-02 ?b1-00)))) (not (turnDomain)))
		:effect (and (q5 ?b1-00 ?b2-01 ?b1-02 ?b1-03 ?b1-04 ?b1-05 ?b1-06) (not (q1 ?b1-00 ?b2-01 ?b1-02 ?b1-03 ?b1-04 ?b1-05 ?b1-06)) (not (q2 ?b1-00 ?b2-01 ?b1-02 ?b1-03 ?b1-04 ?b1-05 ?b1-06)) (not (q3 ?b1-00 ?b2-01 ?b1-02 ?b1-03 ?b1-04 ?b1-05 ?b1-06)) (not (q4 ?b1-00 ?b2-01 ?b1-02 ?b1-03 ?b1-04 ?b1-05 ?b1-06)) (not (q6 ?b1-00 ?b2-01 ?b1-02 ?b1-03 ?b1-04 ?b1-05 ?b1-06)) (not (q7 ?b1-00 ?b2-01 ?b1-02 ?b1-03 ?b1-04 ?b1-05 ?b1-06)) (turnDomain))
	)
	(:action trans-5
		:parameters (?b1-00 - block ?b2-01 - block ?b1-02 - block ?b1-03 - block ?b1-04 - block ?b1-05 - block ?b1-06 - block)
		:precondition (and (or (and (q5 ?b1-00 ?b2-01 ?b1-02 ?b1-03 ?b1-04 ?b1-05 ?b1-06) (on ?b1-02 ?b1-00)) (and (q6 ?b1-00 ?b2-01 ?b1-02 ?b1-03 ?b1-04 ?b1-05 ?b1-06) (not (on ?b1-00 ?b2-01)))) (not (turnDomain)))
		:effect (and (q6 ?b1-00 ?b2-01 ?b1-02 ?b1-03 ?b1-04 ?b1-05 ?b1-06) (not (q1 ?b1-00 ?b2-01 ?b1-02 ?b1-03 ?b1-04 ?b1-05 ?b1-06)) (not (q2 ?b1-00 ?b2-01 ?b1-02 ?b1-03 ?b1-04 ?b1-05 ?b1-06)) (not (q3 ?b1-00 ?b2-01 ?b1-02 ?b1-03 ?b1-04 ?b1-05 ?b1-06)) (not (q4 ?b1-00 ?b2-01 ?b1-02 ?b1-03 ?b1-04 ?b1-05 ?b1-06)) (not (q5 ?b1-00 ?b2-01 ?b1-02 ?b1-03 ?b1-04 ?b1-05 ?b1-06)) (not (q7 ?b1-00 ?b2-01 ?b1-02 ?b1-03 ?b1-04 ?b1-05 ?b1-06)) (turnDomain))
	)
	(:action trans-6
		:parameters (?b1-00 - block ?b2-01 - block ?b1-02 - block ?b1-03 - block ?b1-04 - block ?b1-05 - block ?b1-06 - block)
		:precondition (and (or (and (q6 ?b1-00 ?b2-01 ?b1-02 ?b1-03 ?b1-04 ?b1-05 ?b1-06) (on ?b1-00 ?b2-01)) (q7 ?b1-00 ?b2-01 ?b1-02 ?b1-03 ?b1-04 ?b1-05 ?b1-06)) (not (turnDomain)))
		:effect (and (q7 ?b1-00 ?b2-01 ?b1-02 ?b1-03 ?b1-04 ?b1-05 ?b1-06) (not (q1 ?b1-00 ?b2-01 ?b1-02 ?b1-03 ?b1-04 ?b1-05 ?b1-06)) (not (q2 ?b1-00 ?b2-01 ?b1-02 ?b1-03 ?b1-04 ?b1-05 ?b1-06)) (not (q3 ?b1-00 ?b2-01 ?b1-02 ?b1-03 ?b1-04 ?b1-05 ?b1-06)) (not (q4 ?b1-00 ?b2-01 ?b1-02 ?b1-03 ?b1-04 ?b1-05 ?b1-06)) (not (q5 ?b1-00 ?b2-01 ?b1-02 ?b1-03 ?b1-04 ?b1-05 ?b1-06)) (not (q6 ?b1-00 ?b2-01 ?b1-02 ?b1-03 ?b1-04 ?b1-05 ?b1-06)) (turnDomain))
	)
)