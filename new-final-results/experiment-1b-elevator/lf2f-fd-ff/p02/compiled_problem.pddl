(define (problem el_2)
(:domain elevator)
(:objects p0 p1 - passenger f0 f1 f2 f3 - floor q0 - qstate q1 - qstate q2 - qstate q3 - qstate q4 - qstate q5 - qstate q6 - qstate)
(:init (lift-at f0) (above f0 f1) (above f0 f2) (above f0 f3) (above f1 f2) (above f1 f3) (above f2 f3) (origin p0 f0) (origin p1 f0) (destin p0 f1) (destin p1 f3) (prev_autstate q1) (is_accepting q5))
(:goal (dummy_goal))
)
