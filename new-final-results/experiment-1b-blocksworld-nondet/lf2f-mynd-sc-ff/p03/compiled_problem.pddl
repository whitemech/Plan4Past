(define (problem bw_3)
(:domain blocks-domain)
(:objects b1 b2 b3 - block q0 - qstate q1 - qstate q2 - qstate q3 - qstate q4 - qstate q5 - qstate)
(:init (emptyhand) (ontable b1) (ontable b2) (ontable b3) (clear b1) (clear b2) (clear b3) (prev_autstate q1) (is_accepting q4))
(:goal (dummy_goal))
)
