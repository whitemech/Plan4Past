(define (problem BLOCKS-12-1)
(:domain blocks-domain)
(:objects E L A B F I H G D J K C )
(:INIT (CLEAR C) (CLEAR K) (ONTABLE J) (ONTABLE D) (ON C G) (ON G H) (ON H I)
 (ON I F) (ON F B) (ON B A) (ON A L) (ON L E) (ON E J) (ON K D) (EMPTYHAND))
(:goal (AND (ON J C) (ON C E) (ON E K) (ON K H) (ON H A) (ON A F) (ON F L)
            (ON L G) (ON G B) (ON B I) (ON I D)))
)