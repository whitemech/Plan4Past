begin_version
3.FOND
end_version
begin_metric
0
end_metric
17
begin_variable
var0
-1
2
Atom clear(b1)
NegatedAtom clear(b1)
end_variable
begin_variable
var1
-1
2
Atom clear(b2)
NegatedAtom clear(b2)
end_variable
begin_variable
var2
-1
2
Atom clear(b3)
NegatedAtom clear(b3)
end_variable
begin_variable
var3
-1
2
Atom clear(b4)
NegatedAtom clear(b4)
end_variable
begin_variable
var4
-1
2
Atom clear(b5)
NegatedAtom clear(b5)
end_variable
begin_variable
var5
-1
2
Atom clear(b6)
NegatedAtom clear(b6)
end_variable
begin_variable
var6
-1
2
Atom clear(b7)
NegatedAtom clear(b7)
end_variable
begin_variable
var7
-1
2
Atom emptyhand()
NegatedAtom emptyhand()
end_variable
begin_variable
var8
-1
9
Atom holding(b1)
Atom on(b1, b1)
Atom on(b1, b2)
Atom on(b1, b3)
Atom on(b1, b4)
Atom on(b1, b5)
Atom on(b1, b6)
Atom on(b1, b7)
Atom on-table(b1)
end_variable
begin_variable
var9
-1
9
Atom holding(b2)
Atom on(b2, b1)
Atom on(b2, b2)
Atom on(b2, b3)
Atom on(b2, b4)
Atom on(b2, b5)
Atom on(b2, b6)
Atom on(b2, b7)
Atom on-table(b2)
end_variable
begin_variable
var10
-1
9
Atom holding(b3)
Atom on(b3, b1)
Atom on(b3, b2)
Atom on(b3, b3)
Atom on(b3, b4)
Atom on(b3, b5)
Atom on(b3, b6)
Atom on(b3, b7)
Atom on-table(b3)
end_variable
begin_variable
var11
-1
9
Atom holding(b4)
Atom on(b4, b1)
Atom on(b4, b2)
Atom on(b4, b3)
Atom on(b4, b4)
Atom on(b4, b5)
Atom on(b4, b6)
Atom on(b4, b7)
Atom on-table(b4)
end_variable
begin_variable
var12
-1
9
Atom holding(b5)
Atom on(b5, b1)
Atom on(b5, b2)
Atom on(b5, b3)
Atom on(b5, b4)
Atom on(b5, b5)
Atom on(b5, b6)
Atom on(b5, b7)
Atom on-table(b5)
end_variable
begin_variable
var13
-1
9
Atom holding(b6)
Atom on(b6, b1)
Atom on(b6, b2)
Atom on(b6, b3)
Atom on(b6, b4)
Atom on(b6, b5)
Atom on(b6, b6)
Atom on(b6, b7)
Atom on-table(b6)
end_variable
begin_variable
var14
-1
9
Atom holding(b7)
Atom on(b7, b1)
Atom on(b7, b2)
Atom on(b7, b3)
Atom on(b7, b4)
Atom on(b7, b5)
Atom on(b7, b6)
Atom on(b7, b7)
Atom on-table(b7)
end_variable
begin_variable
var15
-1
3
Atom q1(b1, b2, b3)
Atom q2(b1, b2, b3)
Atom q3(b1, b2, b3)
end_variable
begin_variable
var16
-1
2
Atom turndomain()
NegatedAtom turndomain()
end_variable
16
begin_mutex_group
8
7 0
8 0
9 0
10 0
11 0
12 0
13 0
14 0
end_mutex_group
begin_mutex_group
9
8 0
8 1
8 2
8 3
8 4
8 5
8 6
8 7
8 8
end_mutex_group
begin_mutex_group
9
9 0
9 1
9 2
9 3
9 4
9 5
9 6
9 7
9 8
end_mutex_group
begin_mutex_group
9
10 0
10 1
10 2
10 3
10 4
10 5
10 6
10 7
10 8
end_mutex_group
begin_mutex_group
9
11 0
11 1
11 2
11 3
11 4
11 5
11 6
11 7
11 8
end_mutex_group
begin_mutex_group
9
12 0
12 1
12 2
12 3
12 4
12 5
12 6
12 7
12 8
end_mutex_group
begin_mutex_group
9
13 0
13 1
13 2
13 3
13 4
13 5
13 6
13 7
13 8
end_mutex_group
begin_mutex_group
9
14 0
14 1
14 2
14 3
14 4
14 5
14 6
14 7
14 8
end_mutex_group
begin_mutex_group
2
15 0
15 1
end_mutex_group
begin_mutex_group
2
15 0
15 1
end_mutex_group
begin_mutex_group
2
15 0
15 1
end_mutex_group
begin_mutex_group
2
15 0
15 1
end_mutex_group
begin_mutex_group
3
15 0
15 1
15 2
end_mutex_group
begin_mutex_group
3
15 0
15 1
15 2
end_mutex_group
begin_mutex_group
3
15 0
15 1
15 2
end_mutex_group
begin_mutex_group
3
15 0
15 1
15 2
end_mutex_group
begin_state
0
0
0
0
0
0
0
0
8
8
8
8
8
8
8
0
0
end_state
begin_goal
2
15 2
16 0
end_goal
761
begin_operator
pick-tower b1 b1 b1
3
7 0
8 1
16 0
2
4
0 0 -1 0
0 7 0 1
0 8 1 0
0 16 0 1
1
0 16 0 1
0
end_operator
begin_operator
pick-tower b1 b2 b1
4
7 0
8 2
9 1
16 0
2
4
0 0 -1 0
0 7 0 1
0 9 1 0
0 16 0 1
1
0 16 0 1
0
end_operator
begin_operator
pick-tower b1 b2 b2
4
7 0
8 2
9 2
16 0
2
4
0 1 -1 0
0 7 0 1
0 9 2 0
0 16 0 1
1
0 16 0 1
0
end_operator
begin_operator
pick-tower b1 b2 b3
4
7 0
8 2
9 3
16 0
2
4
0 2 -1 0
0 7 0 1
0 9 3 0
0 16 0 1
1
0 16 0 1
0
end_operator
begin_operator
pick-tower b1 b2 b4
4
7 0
8 2
9 4
16 0
2
4
0 3 -1 0
0 7 0 1
0 9 4 0
0 16 0 1
1
0 16 0 1
0
end_operator
begin_operator
pick-tower b1 b2 b5
4
7 0
8 2
9 5
16 0
2
4
0 4 -1 0
0 7 0 1
0 9 5 0
0 16 0 1
1
0 16 0 1
0
end_operator
begin_operator
pick-tower b1 b2 b6
4
7 0
8 2
9 6
16 0
2
4
0 5 -1 0
0 7 0 1
0 9 6 0
0 16 0 1
1
0 16 0 1
0
end_operator
begin_operator
pick-tower b1 b2 b7
4
7 0
8 2
9 7
16 0
2
4
0 6 -1 0
0 7 0 1
0 9 7 0
0 16 0 1
1
0 16 0 1
0
end_operator
begin_operator
pick-tower b1 b3 b1
4
7 0
8 3
10 1
16 0
2
4
0 0 -1 0
0 7 0 1
0 10 1 0
0 16 0 1
1
0 16 0 1
0
end_operator
begin_operator
pick-tower b1 b3 b2
4
7 0
8 3
10 2
16 0
2
4
0 1 -1 0
0 7 0 1
0 10 2 0
0 16 0 1
1
0 16 0 1
0
end_operator
begin_operator
pick-tower b1 b3 b3
4
7 0
8 3
10 3
16 0
2
4
0 2 -1 0
0 7 0 1
0 10 3 0
0 16 0 1
1
0 16 0 1
0
end_operator
begin_operator
pick-tower b1 b3 b4
4
7 0
8 3
10 4
16 0
2
4
0 3 -1 0
0 7 0 1
0 10 4 0
0 16 0 1
1
0 16 0 1
0
end_operator
begin_operator
pick-tower b1 b3 b5
4
7 0
8 3
10 5
16 0
2
4
0 4 -1 0
0 7 0 1
0 10 5 0
0 16 0 1
1
0 16 0 1
0
end_operator
begin_operator
pick-tower b1 b3 b6
4
7 0
8 3
10 6
16 0
2
4
0 5 -1 0
0 7 0 1
0 10 6 0
0 16 0 1
1
0 16 0 1
0
end_operator
begin_operator
pick-tower b1 b3 b7
4
7 0
8 3
10 7
16 0
2
4
0 6 -1 0
0 7 0 1
0 10 7 0
0 16 0 1
1
0 16 0 1
0
end_operator
begin_operator
pick-tower b1 b4 b1
4
7 0
8 4
11 1
16 0
2
4
0 0 -1 0
0 7 0 1
0 11 1 0
0 16 0 1
1
0 16 0 1
0
end_operator
begin_operator
pick-tower b1 b4 b2
4
7 0
8 4
11 2
16 0
2
4
0 1 -1 0
0 7 0 1
0 11 2 0
0 16 0 1
1
0 16 0 1
0
end_operator
begin_operator
pick-tower b1 b4 b3
4
7 0
8 4
11 3
16 0
2
4
0 2 -1 0
0 7 0 1
0 11 3 0
0 16 0 1
1
0 16 0 1
0
end_operator
begin_operator
pick-tower b1 b4 b4
4
7 0
8 4
11 4
16 0
2
4
0 3 -1 0
0 7 0 1
0 11 4 0
0 16 0 1
1
0 16 0 1
0
end_operator
begin_operator
pick-tower b1 b4 b5
4
7 0
8 4
11 5
16 0
2
4
0 4 -1 0
0 7 0 1
0 11 5 0
0 16 0 1
1
0 16 0 1
0
end_operator
begin_operator
pick-tower b1 b4 b6
4
7 0
8 4
11 6
16 0
2
4
0 5 -1 0
0 7 0 1
0 11 6 0
0 16 0 1
1
0 16 0 1
0
end_operator
begin_operator
pick-tower b1 b4 b7
4
7 0
8 4
11 7
16 0
2
4
0 6 -1 0
0 7 0 1
0 11 7 0
0 16 0 1
1
0 16 0 1
0
end_operator
begin_operator
pick-tower b1 b5 b1
4
7 0
8 5
12 1
16 0
2
4
0 0 -1 0
0 7 0 1
0 12 1 0
0 16 0 1
1
0 16 0 1
0
end_operator
begin_operator
pick-tower b1 b5 b2
4
7 0
8 5
12 2
16 0
2
4
0 1 -1 0
0 7 0 1
0 12 2 0
0 16 0 1
1
0 16 0 1
0
end_operator
begin_operator
pick-tower b1 b5 b3
4
7 0
8 5
12 3
16 0
2
4
0 2 -1 0
0 7 0 1
0 12 3 0
0 16 0 1
1
0 16 0 1
0
end_operator
begin_operator
pick-tower b1 b5 b4
4
7 0
8 5
12 4
16 0
2
4
0 3 -1 0
0 7 0 1
0 12 4 0
0 16 0 1
1
0 16 0 1
0
end_operator
begin_operator
pick-tower b1 b5 b5
4
7 0
8 5
12 5
16 0
2
4
0 4 -1 0
0 7 0 1
0 12 5 0
0 16 0 1
1
0 16 0 1
0
end_operator
begin_operator
pick-tower b1 b5 b6
4
7 0
8 5
12 6
16 0
2
4
0 5 -1 0
0 7 0 1
0 12 6 0
0 16 0 1
1
0 16 0 1
0
end_operator
begin_operator
pick-tower b1 b5 b7
4
7 0
8 5
12 7
16 0
2
4
0 6 -1 0
0 7 0 1
0 12 7 0
0 16 0 1
1
0 16 0 1
0
end_operator
begin_operator
pick-tower b1 b6 b1
4
7 0
8 6
13 1
16 0
2
4
0 0 -1 0
0 7 0 1
0 13 1 0
0 16 0 1
1
0 16 0 1
0
end_operator
begin_operator
pick-tower b1 b6 b2
4
7 0
8 6
13 2
16 0
2
4
0 1 -1 0
0 7 0 1
0 13 2 0
0 16 0 1
1
0 16 0 1
0
end_operator
begin_operator
pick-tower b1 b6 b3
4
7 0
8 6
13 3
16 0
2
4
0 2 -1 0
0 7 0 1
0 13 3 0
0 16 0 1
1
0 16 0 1
0
end_operator
begin_operator
pick-tower b1 b6 b4
4
7 0
8 6
13 4
16 0
2
4
0 3 -1 0
0 7 0 1
0 13 4 0
0 16 0 1
1
0 16 0 1
0
end_operator
begin_operator
pick-tower b1 b6 b5
4
7 0
8 6
13 5
16 0
2
4
0 4 -1 0
0 7 0 1
0 13 5 0
0 16 0 1
1
0 16 0 1
0
end_operator
begin_operator
pick-tower b1 b6 b6
4
7 0
8 6
13 6
16 0
2
4
0 5 -1 0
0 7 0 1
0 13 6 0
0 16 0 1
1
0 16 0 1
0
end_operator
begin_operator
pick-tower b1 b6 b7
4
7 0
8 6
13 7
16 0
2
4
0 6 -1 0
0 7 0 1
0 13 7 0
0 16 0 1
1
0 16 0 1
0
end_operator
begin_operator
pick-tower b1 b7 b1
4
7 0
8 7
14 1
16 0
2
4
0 0 -1 0
0 7 0 1
0 14 1 0
0 16 0 1
1
0 16 0 1
0
end_operator
begin_operator
pick-tower b1 b7 b2
4
7 0
8 7
14 2
16 0
2
4
0 1 -1 0
0 7 0 1
0 14 2 0
0 16 0 1
1
0 16 0 1
0
end_operator
begin_operator
pick-tower b1 b7 b3
4
7 0
8 7
14 3
16 0
2
4
0 2 -1 0
0 7 0 1
0 14 3 0
0 16 0 1
1
0 16 0 1
0
end_operator
begin_operator
pick-tower b1 b7 b4
4
7 0
8 7
14 4
16 0
2
4
0 3 -1 0
0 7 0 1
0 14 4 0
0 16 0 1
1
0 16 0 1
0
end_operator
begin_operator
pick-tower b1 b7 b5
4
7 0
8 7
14 5
16 0
2
4
0 4 -1 0
0 7 0 1
0 14 5 0
0 16 0 1
1
0 16 0 1
0
end_operator
begin_operator
pick-tower b1 b7 b6
4
7 0
8 7
14 6
16 0
2
4
0 5 -1 0
0 7 0 1
0 14 6 0
0 16 0 1
1
0 16 0 1
0
end_operator
begin_operator
pick-tower b1 b7 b7
4
7 0
8 7
14 7
16 0
2
4
0 6 -1 0
0 7 0 1
0 14 7 0
0 16 0 1
1
0 16 0 1
0
end_operator
begin_operator
pick-tower b2 b1 b1
4
7 0
8 1
9 1
16 0
2
4
0 0 -1 0
0 7 0 1
0 8 1 0
0 16 0 1
1
0 16 0 1
0
end_operator
begin_operator
pick-tower b2 b1 b2
4
7 0
8 2
9 1
16 0
2
4
0 1 -1 0
0 7 0 1
0 8 2 0
0 16 0 1
1
0 16 0 1
0
end_operator
begin_operator
pick-tower b2 b1 b3
4
7 0
8 3
9 1
16 0
2
4
0 2 -1 0
0 7 0 1
0 8 3 0
0 16 0 1
1
0 16 0 1
0
end_operator
begin_operator
pick-tower b2 b1 b4
4
7 0
8 4
9 1
16 0
2
4
0 3 -1 0
0 7 0 1
0 8 4 0
0 16 0 1
1
0 16 0 1
0
end_operator
begin_operator
pick-tower b2 b1 b5
4
7 0
8 5
9 1
16 0
2
4
0 4 -1 0
0 7 0 1
0 8 5 0
0 16 0 1
1
0 16 0 1
0
end_operator
begin_operator
pick-tower b2 b1 b6
4
7 0
8 6
9 1
16 0
2
4
0 5 -1 0
0 7 0 1
0 8 6 0
0 16 0 1
1
0 16 0 1
0
end_operator
begin_operator
pick-tower b2 b1 b7
4
7 0
8 7
9 1
16 0
2
4
0 6 -1 0
0 7 0 1
0 8 7 0
0 16 0 1
1
0 16 0 1
0
end_operator
begin_operator
pick-tower b2 b2 b2
3
7 0
9 2
16 0
2
4
0 1 -1 0
0 7 0 1
0 9 2 0
0 16 0 1
1
0 16 0 1
0
end_operator
begin_operator
pick-tower b2 b3 b1
4
7 0
9 3
10 1
16 0
2
4
0 0 -1 0
0 7 0 1
0 10 1 0
0 16 0 1
1
0 16 0 1
0
end_operator
begin_operator
pick-tower b2 b3 b2
4
7 0
9 3
10 2
16 0
2
4
0 1 -1 0
0 7 0 1
0 10 2 0
0 16 0 1
1
0 16 0 1
0
end_operator
begin_operator
pick-tower b2 b3 b3
4
7 0
9 3
10 3
16 0
2
4
0 2 -1 0
0 7 0 1
0 10 3 0
0 16 0 1
1
0 16 0 1
0
end_operator
begin_operator
pick-tower b2 b3 b4
4
7 0
9 3
10 4
16 0
2
4
0 3 -1 0
0 7 0 1
0 10 4 0
0 16 0 1
1
0 16 0 1
0
end_operator
begin_operator
pick-tower b2 b3 b5
4
7 0
9 3
10 5
16 0
2
4
0 4 -1 0
0 7 0 1
0 10 5 0
0 16 0 1
1
0 16 0 1
0
end_operator
begin_operator
pick-tower b2 b3 b6
4
7 0
9 3
10 6
16 0
2
4
0 5 -1 0
0 7 0 1
0 10 6 0
0 16 0 1
1
0 16 0 1
0
end_operator
begin_operator
pick-tower b2 b3 b7
4
7 0
9 3
10 7
16 0
2
4
0 6 -1 0
0 7 0 1
0 10 7 0
0 16 0 1
1
0 16 0 1
0
end_operator
begin_operator
pick-tower b2 b4 b1
4
7 0
9 4
11 1
16 0
2
4
0 0 -1 0
0 7 0 1
0 11 1 0
0 16 0 1
1
0 16 0 1
0
end_operator
begin_operator
pick-tower b2 b4 b2
4
7 0
9 4
11 2
16 0
2
4
0 1 -1 0
0 7 0 1
0 11 2 0
0 16 0 1
1
0 16 0 1
0
end_operator
begin_operator
pick-tower b2 b4 b3
4
7 0
9 4
11 3
16 0
2
4
0 2 -1 0
0 7 0 1
0 11 3 0
0 16 0 1
1
0 16 0 1
0
end_operator
begin_operator
pick-tower b2 b4 b4
4
7 0
9 4
11 4
16 0
2
4
0 3 -1 0
0 7 0 1
0 11 4 0
0 16 0 1
1
0 16 0 1
0
end_operator
begin_operator
pick-tower b2 b4 b5
4
7 0
9 4
11 5
16 0
2
4
0 4 -1 0
0 7 0 1
0 11 5 0
0 16 0 1
1
0 16 0 1
0
end_operator
begin_operator
pick-tower b2 b4 b6
4
7 0
9 4
11 6
16 0
2
4
0 5 -1 0
0 7 0 1
0 11 6 0
0 16 0 1
1
0 16 0 1
0
end_operator
begin_operator
pick-tower b2 b4 b7
4
7 0
9 4
11 7
16 0
2
4
0 6 -1 0
0 7 0 1
0 11 7 0
0 16 0 1
1
0 16 0 1
0
end_operator
begin_operator
pick-tower b2 b5 b1
4
7 0
9 5
12 1
16 0
2
4
0 0 -1 0
0 7 0 1
0 12 1 0
0 16 0 1
1
0 16 0 1
0
end_operator
begin_operator
pick-tower b2 b5 b2
4
7 0
9 5
12 2
16 0
2
4
0 1 -1 0
0 7 0 1
0 12 2 0
0 16 0 1
1
0 16 0 1
0
end_operator
begin_operator
pick-tower b2 b5 b3
4
7 0
9 5
12 3
16 0
2
4
0 2 -1 0
0 7 0 1
0 12 3 0
0 16 0 1
1
0 16 0 1
0
end_operator
begin_operator
pick-tower b2 b5 b4
4
7 0
9 5
12 4
16 0
2
4
0 3 -1 0
0 7 0 1
0 12 4 0
0 16 0 1
1
0 16 0 1
0
end_operator
begin_operator
pick-tower b2 b5 b5
4
7 0
9 5
12 5
16 0
2
4
0 4 -1 0
0 7 0 1
0 12 5 0
0 16 0 1
1
0 16 0 1
0
end_operator
begin_operator
pick-tower b2 b5 b6
4
7 0
9 5
12 6
16 0
2
4
0 5 -1 0
0 7 0 1
0 12 6 0
0 16 0 1
1
0 16 0 1
0
end_operator
begin_operator
pick-tower b2 b5 b7
4
7 0
9 5
12 7
16 0
2
4
0 6 -1 0
0 7 0 1
0 12 7 0
0 16 0 1
1
0 16 0 1
0
end_operator
begin_operator
pick-tower b2 b6 b1
4
7 0
9 6
13 1
16 0
2
4
0 0 -1 0
0 7 0 1
0 13 1 0
0 16 0 1
1
0 16 0 1
0
end_operator
begin_operator
pick-tower b2 b6 b2
4
7 0
9 6
13 2
16 0
2
4
0 1 -1 0
0 7 0 1
0 13 2 0
0 16 0 1
1
0 16 0 1
0
end_operator
begin_operator
pick-tower b2 b6 b3
4
7 0
9 6
13 3
16 0
2
4
0 2 -1 0
0 7 0 1
0 13 3 0
0 16 0 1
1
0 16 0 1
0
end_operator
begin_operator
pick-tower b2 b6 b4
4
7 0
9 6
13 4
16 0
2
4
0 3 -1 0
0 7 0 1
0 13 4 0
0 16 0 1
1
0 16 0 1
0
end_operator
begin_operator
pick-tower b2 b6 b5
4
7 0
9 6
13 5
16 0
2
4
0 4 -1 0
0 7 0 1
0 13 5 0
0 16 0 1
1
0 16 0 1
0
end_operator
begin_operator
pick-tower b2 b6 b6
4
7 0
9 6
13 6
16 0
2
4
0 5 -1 0
0 7 0 1
0 13 6 0
0 16 0 1
1
0 16 0 1
0
end_operator
begin_operator
pick-tower b2 b6 b7
4
7 0
9 6
13 7
16 0
2
4
0 6 -1 0
0 7 0 1
0 13 7 0
0 16 0 1
1
0 16 0 1
0
end_operator
begin_operator
pick-tower b2 b7 b1
4
7 0
9 7
14 1
16 0
2
4
0 0 -1 0
0 7 0 1
0 14 1 0
0 16 0 1
1
0 16 0 1
0
end_operator
begin_operator
pick-tower b2 b7 b2
4
7 0
9 7
14 2
16 0
2
4
0 1 -1 0
0 7 0 1
0 14 2 0
0 16 0 1
1
0 16 0 1
0
end_operator
begin_operator
pick-tower b2 b7 b3
4
7 0
9 7
14 3
16 0
2
4
0 2 -1 0
0 7 0 1
0 14 3 0
0 16 0 1
1
0 16 0 1
0
end_operator
begin_operator
pick-tower b2 b7 b4
4
7 0
9 7
14 4
16 0
2
4
0 3 -1 0
0 7 0 1
0 14 4 0
0 16 0 1
1
0 16 0 1
0
end_operator
begin_operator
pick-tower b2 b7 b5
4
7 0
9 7
14 5
16 0
2
4
0 4 -1 0
0 7 0 1
0 14 5 0
0 16 0 1
1
0 16 0 1
0
end_operator
begin_operator
pick-tower b2 b7 b6
4
7 0
9 7
14 6
16 0
2
4
0 5 -1 0
0 7 0 1
0 14 6 0
0 16 0 1
1
0 16 0 1
0
end_operator
begin_operator
pick-tower b2 b7 b7
4
7 0
9 7
14 7
16 0
2
4
0 6 -1 0
0 7 0 1
0 14 7 0
0 16 0 1
1
0 16 0 1
0
end_operator
begin_operator
pick-tower b3 b1 b1
4
7 0
8 1
10 1
16 0
2
4
0 0 -1 0
0 7 0 1
0 8 1 0
0 16 0 1
1
0 16 0 1
0
end_operator
begin_operator
pick-tower b3 b1 b2
4
7 0
8 2
10 1
16 0
2
4
0 1 -1 0
0 7 0 1
0 8 2 0
0 16 0 1
1
0 16 0 1
0
end_operator
begin_operator
pick-tower b3 b1 b3
4
7 0
8 3
10 1
16 0
2
4
0 2 -1 0
0 7 0 1
0 8 3 0
0 16 0 1
1
0 16 0 1
0
end_operator
begin_operator
pick-tower b3 b1 b4
4
7 0
8 4
10 1
16 0
2
4
0 3 -1 0
0 7 0 1
0 8 4 0
0 16 0 1
1
0 16 0 1
0
end_operator
begin_operator
pick-tower b3 b1 b5
4
7 0
8 5
10 1
16 0
2
4
0 4 -1 0
0 7 0 1
0 8 5 0
0 16 0 1
1
0 16 0 1
0
end_operator
begin_operator
pick-tower b3 b1 b6
4
7 0
8 6
10 1
16 0
2
4
0 5 -1 0
0 7 0 1
0 8 6 0
0 16 0 1
1
0 16 0 1
0
end_operator
begin_operator
pick-tower b3 b1 b7
4
7 0
8 7
10 1
16 0
2
4
0 6 -1 0
0 7 0 1
0 8 7 0
0 16 0 1
1
0 16 0 1
0
end_operator
begin_operator
pick-tower b3 b2 b1
4
7 0
9 1
10 2
16 0
2
4
0 0 -1 0
0 7 0 1
0 9 1 0
0 16 0 1
1
0 16 0 1
0
end_operator
begin_operator
pick-tower b3 b2 b2
4
7 0
9 2
10 2
16 0
2
4
0 1 -1 0
0 7 0 1
0 9 2 0
0 16 0 1
1
0 16 0 1
0
end_operator
begin_operator
pick-tower b3 b2 b3
4
7 0
9 3
10 2
16 0
2
4
0 2 -1 0
0 7 0 1
0 9 3 0
0 16 0 1
1
0 16 0 1
0
end_operator
begin_operator
pick-tower b3 b2 b4
4
7 0
9 4
10 2
16 0
2
4
0 3 -1 0
0 7 0 1
0 9 4 0
0 16 0 1
1
0 16 0 1
0
end_operator
begin_operator
pick-tower b3 b2 b5
4
7 0
9 5
10 2
16 0
2
4
0 4 -1 0
0 7 0 1
0 9 5 0
0 16 0 1
1
0 16 0 1
0
end_operator
begin_operator
pick-tower b3 b2 b6
4
7 0
9 6
10 2
16 0
2
4
0 5 -1 0
0 7 0 1
0 9 6 0
0 16 0 1
1
0 16 0 1
0
end_operator
begin_operator
pick-tower b3 b2 b7
4
7 0
9 7
10 2
16 0
2
4
0 6 -1 0
0 7 0 1
0 9 7 0
0 16 0 1
1
0 16 0 1
0
end_operator
begin_operator
pick-tower b3 b3 b3
3
7 0
10 3
16 0
2
4
0 2 -1 0
0 7 0 1
0 10 3 0
0 16 0 1
1
0 16 0 1
0
end_operator
begin_operator
pick-tower b3 b4 b1
4
7 0
10 4
11 1
16 0
2
4
0 0 -1 0
0 7 0 1
0 11 1 0
0 16 0 1
1
0 16 0 1
0
end_operator
begin_operator
pick-tower b3 b4 b2
4
7 0
10 4
11 2
16 0
2
4
0 1 -1 0
0 7 0 1
0 11 2 0
0 16 0 1
1
0 16 0 1
0
end_operator
begin_operator
pick-tower b3 b4 b3
4
7 0
10 4
11 3
16 0
2
4
0 2 -1 0
0 7 0 1
0 11 3 0
0 16 0 1
1
0 16 0 1
0
end_operator
begin_operator
pick-tower b3 b4 b4
4
7 0
10 4
11 4
16 0
2
4
0 3 -1 0
0 7 0 1
0 11 4 0
0 16 0 1
1
0 16 0 1
0
end_operator
begin_operator
pick-tower b3 b4 b5
4
7 0
10 4
11 5
16 0
2
4
0 4 -1 0
0 7 0 1
0 11 5 0
0 16 0 1
1
0 16 0 1
0
end_operator
begin_operator
pick-tower b3 b4 b6
4
7 0
10 4
11 6
16 0
2
4
0 5 -1 0
0 7 0 1
0 11 6 0
0 16 0 1
1
0 16 0 1
0
end_operator
begin_operator
pick-tower b3 b4 b7
4
7 0
10 4
11 7
16 0
2
4
0 6 -1 0
0 7 0 1
0 11 7 0
0 16 0 1
1
0 16 0 1
0
end_operator
begin_operator
pick-tower b3 b5 b1
4
7 0
10 5
12 1
16 0
2
4
0 0 -1 0
0 7 0 1
0 12 1 0
0 16 0 1
1
0 16 0 1
0
end_operator
begin_operator
pick-tower b3 b5 b2
4
7 0
10 5
12 2
16 0
2
4
0 1 -1 0
0 7 0 1
0 12 2 0
0 16 0 1
1
0 16 0 1
0
end_operator
begin_operator
pick-tower b3 b5 b3
4
7 0
10 5
12 3
16 0
2
4
0 2 -1 0
0 7 0 1
0 12 3 0
0 16 0 1
1
0 16 0 1
0
end_operator
begin_operator
pick-tower b3 b5 b4
4
7 0
10 5
12 4
16 0
2
4
0 3 -1 0
0 7 0 1
0 12 4 0
0 16 0 1
1
0 16 0 1
0
end_operator
begin_operator
pick-tower b3 b5 b5
4
7 0
10 5
12 5
16 0
2
4
0 4 -1 0
0 7 0 1
0 12 5 0
0 16 0 1
1
0 16 0 1
0
end_operator
begin_operator
pick-tower b3 b5 b6
4
7 0
10 5
12 6
16 0
2
4
0 5 -1 0
0 7 0 1
0 12 6 0
0 16 0 1
1
0 16 0 1
0
end_operator
begin_operator
pick-tower b3 b5 b7
4
7 0
10 5
12 7
16 0
2
4
0 6 -1 0
0 7 0 1
0 12 7 0
0 16 0 1
1
0 16 0 1
0
end_operator
begin_operator
pick-tower b3 b6 b1
4
7 0
10 6
13 1
16 0
2
4
0 0 -1 0
0 7 0 1
0 13 1 0
0 16 0 1
1
0 16 0 1
0
end_operator
begin_operator
pick-tower b3 b6 b2
4
7 0
10 6
13 2
16 0
2
4
0 1 -1 0
0 7 0 1
0 13 2 0
0 16 0 1
1
0 16 0 1
0
end_operator
begin_operator
pick-tower b3 b6 b3
4
7 0
10 6
13 3
16 0
2
4
0 2 -1 0
0 7 0 1
0 13 3 0
0 16 0 1
1
0 16 0 1
0
end_operator
begin_operator
pick-tower b3 b6 b4
4
7 0
10 6
13 4
16 0
2
4
0 3 -1 0
0 7 0 1
0 13 4 0
0 16 0 1
1
0 16 0 1
0
end_operator
begin_operator
pick-tower b3 b6 b5
4
7 0
10 6
13 5
16 0
2
4
0 4 -1 0
0 7 0 1
0 13 5 0
0 16 0 1
1
0 16 0 1
0
end_operator
begin_operator
pick-tower b3 b6 b6
4
7 0
10 6
13 6
16 0
2
4
0 5 -1 0
0 7 0 1
0 13 6 0
0 16 0 1
1
0 16 0 1
0
end_operator
begin_operator
pick-tower b3 b6 b7
4
7 0
10 6
13 7
16 0
2
4
0 6 -1 0
0 7 0 1
0 13 7 0
0 16 0 1
1
0 16 0 1
0
end_operator
begin_operator
pick-tower b3 b7 b1
4
7 0
10 7
14 1
16 0
2
4
0 0 -1 0
0 7 0 1
0 14 1 0
0 16 0 1
1
0 16 0 1
0
end_operator
begin_operator
pick-tower b3 b7 b2
4
7 0
10 7
14 2
16 0
2
4
0 1 -1 0
0 7 0 1
0 14 2 0
0 16 0 1
1
0 16 0 1
0
end_operator
begin_operator
pick-tower b3 b7 b3
4
7 0
10 7
14 3
16 0
2
4
0 2 -1 0
0 7 0 1
0 14 3 0
0 16 0 1
1
0 16 0 1
0
end_operator
begin_operator
pick-tower b3 b7 b4
4
7 0
10 7
14 4
16 0
2
4
0 3 -1 0
0 7 0 1
0 14 4 0
0 16 0 1
1
0 16 0 1
0
end_operator
begin_operator
pick-tower b3 b7 b5
4
7 0
10 7
14 5
16 0
2
4
0 4 -1 0
0 7 0 1
0 14 5 0
0 16 0 1
1
0 16 0 1
0
end_operator
begin_operator
pick-tower b3 b7 b6
4
7 0
10 7
14 6
16 0
2
4
0 5 -1 0
0 7 0 1
0 14 6 0
0 16 0 1
1
0 16 0 1
0
end_operator
begin_operator
pick-tower b3 b7 b7
4
7 0
10 7
14 7
16 0
2
4
0 6 -1 0
0 7 0 1
0 14 7 0
0 16 0 1
1
0 16 0 1
0
end_operator
begin_operator
pick-tower b4 b1 b1
4
7 0
8 1
11 1
16 0
2
4
0 0 -1 0
0 7 0 1
0 8 1 0
0 16 0 1
1
0 16 0 1
0
end_operator
begin_operator
pick-tower b4 b1 b2
4
7 0
8 2
11 1
16 0
2
4
0 1 -1 0
0 7 0 1
0 8 2 0
0 16 0 1
1
0 16 0 1
0
end_operator
begin_operator
pick-tower b4 b1 b3
4
7 0
8 3
11 1
16 0
2
4
0 2 -1 0
0 7 0 1
0 8 3 0
0 16 0 1
1
0 16 0 1
0
end_operator
begin_operator
pick-tower b4 b1 b4
4
7 0
8 4
11 1
16 0
2
4
0 3 -1 0
0 7 0 1
0 8 4 0
0 16 0 1
1
0 16 0 1
0
end_operator
begin_operator
pick-tower b4 b1 b5
4
7 0
8 5
11 1
16 0
2
4
0 4 -1 0
0 7 0 1
0 8 5 0
0 16 0 1
1
0 16 0 1
0
end_operator
begin_operator
pick-tower b4 b1 b6
4
7 0
8 6
11 1
16 0
2
4
0 5 -1 0
0 7 0 1
0 8 6 0
0 16 0 1
1
0 16 0 1
0
end_operator
begin_operator
pick-tower b4 b1 b7
4
7 0
8 7
11 1
16 0
2
4
0 6 -1 0
0 7 0 1
0 8 7 0
0 16 0 1
1
0 16 0 1
0
end_operator
begin_operator
pick-tower b4 b2 b1
4
7 0
9 1
11 2
16 0
2
4
0 0 -1 0
0 7 0 1
0 9 1 0
0 16 0 1
1
0 16 0 1
0
end_operator
begin_operator
pick-tower b4 b2 b2
4
7 0
9 2
11 2
16 0
2
4
0 1 -1 0
0 7 0 1
0 9 2 0
0 16 0 1
1
0 16 0 1
0
end_operator
begin_operator
pick-tower b4 b2 b3
4
7 0
9 3
11 2
16 0
2
4
0 2 -1 0
0 7 0 1
0 9 3 0
0 16 0 1
1
0 16 0 1
0
end_operator
begin_operator
pick-tower b4 b2 b4
4
7 0
9 4
11 2
16 0
2
4
0 3 -1 0
0 7 0 1
0 9 4 0
0 16 0 1
1
0 16 0 1
0
end_operator
begin_operator
pick-tower b4 b2 b5
4
7 0
9 5
11 2
16 0
2
4
0 4 -1 0
0 7 0 1
0 9 5 0
0 16 0 1
1
0 16 0 1
0
end_operator
begin_operator
pick-tower b4 b2 b6
4
7 0
9 6
11 2
16 0
2
4
0 5 -1 0
0 7 0 1
0 9 6 0
0 16 0 1
1
0 16 0 1
0
end_operator
begin_operator
pick-tower b4 b2 b7
4
7 0
9 7
11 2
16 0
2
4
0 6 -1 0
0 7 0 1
0 9 7 0
0 16 0 1
1
0 16 0 1
0
end_operator
begin_operator
pick-tower b4 b3 b1
4
7 0
10 1
11 3
16 0
2
4
0 0 -1 0
0 7 0 1
0 10 1 0
0 16 0 1
1
0 16 0 1
0
end_operator
begin_operator
pick-tower b4 b3 b2
4
7 0
10 2
11 3
16 0
2
4
0 1 -1 0
0 7 0 1
0 10 2 0
0 16 0 1
1
0 16 0 1
0
end_operator
begin_operator
pick-tower b4 b3 b3
4
7 0
10 3
11 3
16 0
2
4
0 2 -1 0
0 7 0 1
0 10 3 0
0 16 0 1
1
0 16 0 1
0
end_operator
begin_operator
pick-tower b4 b3 b4
4
7 0
10 4
11 3
16 0
2
4
0 3 -1 0
0 7 0 1
0 10 4 0
0 16 0 1
1
0 16 0 1
0
end_operator
begin_operator
pick-tower b4 b3 b5
4
7 0
10 5
11 3
16 0
2
4
0 4 -1 0
0 7 0 1
0 10 5 0
0 16 0 1
1
0 16 0 1
0
end_operator
begin_operator
pick-tower b4 b3 b6
4
7 0
10 6
11 3
16 0
2
4
0 5 -1 0
0 7 0 1
0 10 6 0
0 16 0 1
1
0 16 0 1
0
end_operator
begin_operator
pick-tower b4 b3 b7
4
7 0
10 7
11 3
16 0
2
4
0 6 -1 0
0 7 0 1
0 10 7 0
0 16 0 1
1
0 16 0 1
0
end_operator
begin_operator
pick-tower b4 b4 b4
3
7 0
11 4
16 0
2
4
0 3 -1 0
0 7 0 1
0 11 4 0
0 16 0 1
1
0 16 0 1
0
end_operator
begin_operator
pick-tower b4 b5 b1
4
7 0
11 5
12 1
16 0
2
4
0 0 -1 0
0 7 0 1
0 12 1 0
0 16 0 1
1
0 16 0 1
0
end_operator
begin_operator
pick-tower b4 b5 b2
4
7 0
11 5
12 2
16 0
2
4
0 1 -1 0
0 7 0 1
0 12 2 0
0 16 0 1
1
0 16 0 1
0
end_operator
begin_operator
pick-tower b4 b5 b3
4
7 0
11 5
12 3
16 0
2
4
0 2 -1 0
0 7 0 1
0 12 3 0
0 16 0 1
1
0 16 0 1
0
end_operator
begin_operator
pick-tower b4 b5 b4
4
7 0
11 5
12 4
16 0
2
4
0 3 -1 0
0 7 0 1
0 12 4 0
0 16 0 1
1
0 16 0 1
0
end_operator
begin_operator
pick-tower b4 b5 b5
4
7 0
11 5
12 5
16 0
2
4
0 4 -1 0
0 7 0 1
0 12 5 0
0 16 0 1
1
0 16 0 1
0
end_operator
begin_operator
pick-tower b4 b5 b6
4
7 0
11 5
12 6
16 0
2
4
0 5 -1 0
0 7 0 1
0 12 6 0
0 16 0 1
1
0 16 0 1
0
end_operator
begin_operator
pick-tower b4 b5 b7
4
7 0
11 5
12 7
16 0
2
4
0 6 -1 0
0 7 0 1
0 12 7 0
0 16 0 1
1
0 16 0 1
0
end_operator
begin_operator
pick-tower b4 b6 b1
4
7 0
11 6
13 1
16 0
2
4
0 0 -1 0
0 7 0 1
0 13 1 0
0 16 0 1
1
0 16 0 1
0
end_operator
begin_operator
pick-tower b4 b6 b2
4
7 0
11 6
13 2
16 0
2
4
0 1 -1 0
0 7 0 1
0 13 2 0
0 16 0 1
1
0 16 0 1
0
end_operator
begin_operator
pick-tower b4 b6 b3
4
7 0
11 6
13 3
16 0
2
4
0 2 -1 0
0 7 0 1
0 13 3 0
0 16 0 1
1
0 16 0 1
0
end_operator
begin_operator
pick-tower b4 b6 b4
4
7 0
11 6
13 4
16 0
2
4
0 3 -1 0
0 7 0 1
0 13 4 0
0 16 0 1
1
0 16 0 1
0
end_operator
begin_operator
pick-tower b4 b6 b5
4
7 0
11 6
13 5
16 0
2
4
0 4 -1 0
0 7 0 1
0 13 5 0
0 16 0 1
1
0 16 0 1
0
end_operator
begin_operator
pick-tower b4 b6 b6
4
7 0
11 6
13 6
16 0
2
4
0 5 -1 0
0 7 0 1
0 13 6 0
0 16 0 1
1
0 16 0 1
0
end_operator
begin_operator
pick-tower b4 b6 b7
4
7 0
11 6
13 7
16 0
2
4
0 6 -1 0
0 7 0 1
0 13 7 0
0 16 0 1
1
0 16 0 1
0
end_operator
begin_operator
pick-tower b4 b7 b1
4
7 0
11 7
14 1
16 0
2
4
0 0 -1 0
0 7 0 1
0 14 1 0
0 16 0 1
1
0 16 0 1
0
end_operator
begin_operator
pick-tower b4 b7 b2
4
7 0
11 7
14 2
16 0
2
4
0 1 -1 0
0 7 0 1
0 14 2 0
0 16 0 1
1
0 16 0 1
0
end_operator
begin_operator
pick-tower b4 b7 b3
4
7 0
11 7
14 3
16 0
2
4
0 2 -1 0
0 7 0 1
0 14 3 0
0 16 0 1
1
0 16 0 1
0
end_operator
begin_operator
pick-tower b4 b7 b4
4
7 0
11 7
14 4
16 0
2
4
0 3 -1 0
0 7 0 1
0 14 4 0
0 16 0 1
1
0 16 0 1
0
end_operator
begin_operator
pick-tower b4 b7 b5
4
7 0
11 7
14 5
16 0
2
4
0 4 -1 0
0 7 0 1
0 14 5 0
0 16 0 1
1
0 16 0 1
0
end_operator
begin_operator
pick-tower b4 b7 b6
4
7 0
11 7
14 6
16 0
2
4
0 5 -1 0
0 7 0 1
0 14 6 0
0 16 0 1
1
0 16 0 1
0
end_operator
begin_operator
pick-tower b4 b7 b7
4
7 0
11 7
14 7
16 0
2
4
0 6 -1 0
0 7 0 1
0 14 7 0
0 16 0 1
1
0 16 0 1
0
end_operator
begin_operator
pick-tower b5 b1 b1
4
7 0
8 1
12 1
16 0
2
4
0 0 -1 0
0 7 0 1
0 8 1 0
0 16 0 1
1
0 16 0 1
0
end_operator
begin_operator
pick-tower b5 b1 b2
4
7 0
8 2
12 1
16 0
2
4
0 1 -1 0
0 7 0 1
0 8 2 0
0 16 0 1
1
0 16 0 1
0
end_operator
begin_operator
pick-tower b5 b1 b3
4
7 0
8 3
12 1
16 0
2
4
0 2 -1 0
0 7 0 1
0 8 3 0
0 16 0 1
1
0 16 0 1
0
end_operator
begin_operator
pick-tower b5 b1 b4
4
7 0
8 4
12 1
16 0
2
4
0 3 -1 0
0 7 0 1
0 8 4 0
0 16 0 1
1
0 16 0 1
0
end_operator
begin_operator
pick-tower b5 b1 b5
4
7 0
8 5
12 1
16 0
2
4
0 4 -1 0
0 7 0 1
0 8 5 0
0 16 0 1
1
0 16 0 1
0
end_operator
begin_operator
pick-tower b5 b1 b6
4
7 0
8 6
12 1
16 0
2
4
0 5 -1 0
0 7 0 1
0 8 6 0
0 16 0 1
1
0 16 0 1
0
end_operator
begin_operator
pick-tower b5 b1 b7
4
7 0
8 7
12 1
16 0
2
4
0 6 -1 0
0 7 0 1
0 8 7 0
0 16 0 1
1
0 16 0 1
0
end_operator
begin_operator
pick-tower b5 b2 b1
4
7 0
9 1
12 2
16 0
2
4
0 0 -1 0
0 7 0 1
0 9 1 0
0 16 0 1
1
0 16 0 1
0
end_operator
begin_operator
pick-tower b5 b2 b2
4
7 0
9 2
12 2
16 0
2
4
0 1 -1 0
0 7 0 1
0 9 2 0
0 16 0 1
1
0 16 0 1
0
end_operator
begin_operator
pick-tower b5 b2 b3
4
7 0
9 3
12 2
16 0
2
4
0 2 -1 0
0 7 0 1
0 9 3 0
0 16 0 1
1
0 16 0 1
0
end_operator
begin_operator
pick-tower b5 b2 b4
4
7 0
9 4
12 2
16 0
2
4
0 3 -1 0
0 7 0 1
0 9 4 0
0 16 0 1
1
0 16 0 1
0
end_operator
begin_operator
pick-tower b5 b2 b5
4
7 0
9 5
12 2
16 0
2
4
0 4 -1 0
0 7 0 1
0 9 5 0
0 16 0 1
1
0 16 0 1
0
end_operator
begin_operator
pick-tower b5 b2 b6
4
7 0
9 6
12 2
16 0
2
4
0 5 -1 0
0 7 0 1
0 9 6 0
0 16 0 1
1
0 16 0 1
0
end_operator
begin_operator
pick-tower b5 b2 b7
4
7 0
9 7
12 2
16 0
2
4
0 6 -1 0
0 7 0 1
0 9 7 0
0 16 0 1
1
0 16 0 1
0
end_operator
begin_operator
pick-tower b5 b3 b1
4
7 0
10 1
12 3
16 0
2
4
0 0 -1 0
0 7 0 1
0 10 1 0
0 16 0 1
1
0 16 0 1
0
end_operator
begin_operator
pick-tower b5 b3 b2
4
7 0
10 2
12 3
16 0
2
4
0 1 -1 0
0 7 0 1
0 10 2 0
0 16 0 1
1
0 16 0 1
0
end_operator
begin_operator
pick-tower b5 b3 b3
4
7 0
10 3
12 3
16 0
2
4
0 2 -1 0
0 7 0 1
0 10 3 0
0 16 0 1
1
0 16 0 1
0
end_operator
begin_operator
pick-tower b5 b3 b4
4
7 0
10 4
12 3
16 0
2
4
0 3 -1 0
0 7 0 1
0 10 4 0
0 16 0 1
1
0 16 0 1
0
end_operator
begin_operator
pick-tower b5 b3 b5
4
7 0
10 5
12 3
16 0
2
4
0 4 -1 0
0 7 0 1
0 10 5 0
0 16 0 1
1
0 16 0 1
0
end_operator
begin_operator
pick-tower b5 b3 b6
4
7 0
10 6
12 3
16 0
2
4
0 5 -1 0
0 7 0 1
0 10 6 0
0 16 0 1
1
0 16 0 1
0
end_operator
begin_operator
pick-tower b5 b3 b7
4
7 0
10 7
12 3
16 0
2
4
0 6 -1 0
0 7 0 1
0 10 7 0
0 16 0 1
1
0 16 0 1
0
end_operator
begin_operator
pick-tower b5 b4 b1
4
7 0
11 1
12 4
16 0
2
4
0 0 -1 0
0 7 0 1
0 11 1 0
0 16 0 1
1
0 16 0 1
0
end_operator
begin_operator
pick-tower b5 b4 b2
4
7 0
11 2
12 4
16 0
2
4
0 1 -1 0
0 7 0 1
0 11 2 0
0 16 0 1
1
0 16 0 1
0
end_operator
begin_operator
pick-tower b5 b4 b3
4
7 0
11 3
12 4
16 0
2
4
0 2 -1 0
0 7 0 1
0 11 3 0
0 16 0 1
1
0 16 0 1
0
end_operator
begin_operator
pick-tower b5 b4 b4
4
7 0
11 4
12 4
16 0
2
4
0 3 -1 0
0 7 0 1
0 11 4 0
0 16 0 1
1
0 16 0 1
0
end_operator
begin_operator
pick-tower b5 b4 b5
4
7 0
11 5
12 4
16 0
2
4
0 4 -1 0
0 7 0 1
0 11 5 0
0 16 0 1
1
0 16 0 1
0
end_operator
begin_operator
pick-tower b5 b4 b6
4
7 0
11 6
12 4
16 0
2
4
0 5 -1 0
0 7 0 1
0 11 6 0
0 16 0 1
1
0 16 0 1
0
end_operator
begin_operator
pick-tower b5 b4 b7
4
7 0
11 7
12 4
16 0
2
4
0 6 -1 0
0 7 0 1
0 11 7 0
0 16 0 1
1
0 16 0 1
0
end_operator
begin_operator
pick-tower b5 b5 b5
3
7 0
12 5
16 0
2
4
0 4 -1 0
0 7 0 1
0 12 5 0
0 16 0 1
1
0 16 0 1
0
end_operator
begin_operator
pick-tower b5 b6 b1
4
7 0
12 6
13 1
16 0
2
4
0 0 -1 0
0 7 0 1
0 13 1 0
0 16 0 1
1
0 16 0 1
0
end_operator
begin_operator
pick-tower b5 b6 b2
4
7 0
12 6
13 2
16 0
2
4
0 1 -1 0
0 7 0 1
0 13 2 0
0 16 0 1
1
0 16 0 1
0
end_operator
begin_operator
pick-tower b5 b6 b3
4
7 0
12 6
13 3
16 0
2
4
0 2 -1 0
0 7 0 1
0 13 3 0
0 16 0 1
1
0 16 0 1
0
end_operator
begin_operator
pick-tower b5 b6 b4
4
7 0
12 6
13 4
16 0
2
4
0 3 -1 0
0 7 0 1
0 13 4 0
0 16 0 1
1
0 16 0 1
0
end_operator
begin_operator
pick-tower b5 b6 b5
4
7 0
12 6
13 5
16 0
2
4
0 4 -1 0
0 7 0 1
0 13 5 0
0 16 0 1
1
0 16 0 1
0
end_operator
begin_operator
pick-tower b5 b6 b6
4
7 0
12 6
13 6
16 0
2
4
0 5 -1 0
0 7 0 1
0 13 6 0
0 16 0 1
1
0 16 0 1
0
end_operator
begin_operator
pick-tower b5 b6 b7
4
7 0
12 6
13 7
16 0
2
4
0 6 -1 0
0 7 0 1
0 13 7 0
0 16 0 1
1
0 16 0 1
0
end_operator
begin_operator
pick-tower b5 b7 b1
4
7 0
12 7
14 1
16 0
2
4
0 0 -1 0
0 7 0 1
0 14 1 0
0 16 0 1
1
0 16 0 1
0
end_operator
begin_operator
pick-tower b5 b7 b2
4
7 0
12 7
14 2
16 0
2
4
0 1 -1 0
0 7 0 1
0 14 2 0
0 16 0 1
1
0 16 0 1
0
end_operator
begin_operator
pick-tower b5 b7 b3
4
7 0
12 7
14 3
16 0
2
4
0 2 -1 0
0 7 0 1
0 14 3 0
0 16 0 1
1
0 16 0 1
0
end_operator
begin_operator
pick-tower b5 b7 b4
4
7 0
12 7
14 4
16 0
2
4
0 3 -1 0
0 7 0 1
0 14 4 0
0 16 0 1
1
0 16 0 1
0
end_operator
begin_operator
pick-tower b5 b7 b5
4
7 0
12 7
14 5
16 0
2
4
0 4 -1 0
0 7 0 1
0 14 5 0
0 16 0 1
1
0 16 0 1
0
end_operator
begin_operator
pick-tower b5 b7 b6
4
7 0
12 7
14 6
16 0
2
4
0 5 -1 0
0 7 0 1
0 14 6 0
0 16 0 1
1
0 16 0 1
0
end_operator
begin_operator
pick-tower b5 b7 b7
4
7 0
12 7
14 7
16 0
2
4
0 6 -1 0
0 7 0 1
0 14 7 0
0 16 0 1
1
0 16 0 1
0
end_operator
begin_operator
pick-tower b6 b1 b1
4
7 0
8 1
13 1
16 0
2
4
0 0 -1 0
0 7 0 1
0 8 1 0
0 16 0 1
1
0 16 0 1
0
end_operator
begin_operator
pick-tower b6 b1 b2
4
7 0
8 2
13 1
16 0
2
4
0 1 -1 0
0 7 0 1
0 8 2 0
0 16 0 1
1
0 16 0 1
0
end_operator
begin_operator
pick-tower b6 b1 b3
4
7 0
8 3
13 1
16 0
2
4
0 2 -1 0
0 7 0 1
0 8 3 0
0 16 0 1
1
0 16 0 1
0
end_operator
begin_operator
pick-tower b6 b1 b4
4
7 0
8 4
13 1
16 0
2
4
0 3 -1 0
0 7 0 1
0 8 4 0
0 16 0 1
1
0 16 0 1
0
end_operator
begin_operator
pick-tower b6 b1 b5
4
7 0
8 5
13 1
16 0
2
4
0 4 -1 0
0 7 0 1
0 8 5 0
0 16 0 1
1
0 16 0 1
0
end_operator
begin_operator
pick-tower b6 b1 b6
4
7 0
8 6
13 1
16 0
2
4
0 5 -1 0
0 7 0 1
0 8 6 0
0 16 0 1
1
0 16 0 1
0
end_operator
begin_operator
pick-tower b6 b1 b7
4
7 0
8 7
13 1
16 0
2
4
0 6 -1 0
0 7 0 1
0 8 7 0
0 16 0 1
1
0 16 0 1
0
end_operator
begin_operator
pick-tower b6 b2 b1
4
7 0
9 1
13 2
16 0
2
4
0 0 -1 0
0 7 0 1
0 9 1 0
0 16 0 1
1
0 16 0 1
0
end_operator
begin_operator
pick-tower b6 b2 b2
4
7 0
9 2
13 2
16 0
2
4
0 1 -1 0
0 7 0 1
0 9 2 0
0 16 0 1
1
0 16 0 1
0
end_operator
begin_operator
pick-tower b6 b2 b3
4
7 0
9 3
13 2
16 0
2
4
0 2 -1 0
0 7 0 1
0 9 3 0
0 16 0 1
1
0 16 0 1
0
end_operator
begin_operator
pick-tower b6 b2 b4
4
7 0
9 4
13 2
16 0
2
4
0 3 -1 0
0 7 0 1
0 9 4 0
0 16 0 1
1
0 16 0 1
0
end_operator
begin_operator
pick-tower b6 b2 b5
4
7 0
9 5
13 2
16 0
2
4
0 4 -1 0
0 7 0 1
0 9 5 0
0 16 0 1
1
0 16 0 1
0
end_operator
begin_operator
pick-tower b6 b2 b6
4
7 0
9 6
13 2
16 0
2
4
0 5 -1 0
0 7 0 1
0 9 6 0
0 16 0 1
1
0 16 0 1
0
end_operator
begin_operator
pick-tower b6 b2 b7
4
7 0
9 7
13 2
16 0
2
4
0 6 -1 0
0 7 0 1
0 9 7 0
0 16 0 1
1
0 16 0 1
0
end_operator
begin_operator
pick-tower b6 b3 b1
4
7 0
10 1
13 3
16 0
2
4
0 0 -1 0
0 7 0 1
0 10 1 0
0 16 0 1
1
0 16 0 1
0
end_operator
begin_operator
pick-tower b6 b3 b2
4
7 0
10 2
13 3
16 0
2
4
0 1 -1 0
0 7 0 1
0 10 2 0
0 16 0 1
1
0 16 0 1
0
end_operator
begin_operator
pick-tower b6 b3 b3
4
7 0
10 3
13 3
16 0
2
4
0 2 -1 0
0 7 0 1
0 10 3 0
0 16 0 1
1
0 16 0 1
0
end_operator
begin_operator
pick-tower b6 b3 b4
4
7 0
10 4
13 3
16 0
2
4
0 3 -1 0
0 7 0 1
0 10 4 0
0 16 0 1
1
0 16 0 1
0
end_operator
begin_operator
pick-tower b6 b3 b5
4
7 0
10 5
13 3
16 0
2
4
0 4 -1 0
0 7 0 1
0 10 5 0
0 16 0 1
1
0 16 0 1
0
end_operator
begin_operator
pick-tower b6 b3 b6
4
7 0
10 6
13 3
16 0
2
4
0 5 -1 0
0 7 0 1
0 10 6 0
0 16 0 1
1
0 16 0 1
0
end_operator
begin_operator
pick-tower b6 b3 b7
4
7 0
10 7
13 3
16 0
2
4
0 6 -1 0
0 7 0 1
0 10 7 0
0 16 0 1
1
0 16 0 1
0
end_operator
begin_operator
pick-tower b6 b4 b1
4
7 0
11 1
13 4
16 0
2
4
0 0 -1 0
0 7 0 1
0 11 1 0
0 16 0 1
1
0 16 0 1
0
end_operator
begin_operator
pick-tower b6 b4 b2
4
7 0
11 2
13 4
16 0
2
4
0 1 -1 0
0 7 0 1
0 11 2 0
0 16 0 1
1
0 16 0 1
0
end_operator
begin_operator
pick-tower b6 b4 b3
4
7 0
11 3
13 4
16 0
2
4
0 2 -1 0
0 7 0 1
0 11 3 0
0 16 0 1
1
0 16 0 1
0
end_operator
begin_operator
pick-tower b6 b4 b4
4
7 0
11 4
13 4
16 0
2
4
0 3 -1 0
0 7 0 1
0 11 4 0
0 16 0 1
1
0 16 0 1
0
end_operator
begin_operator
pick-tower b6 b4 b5
4
7 0
11 5
13 4
16 0
2
4
0 4 -1 0
0 7 0 1
0 11 5 0
0 16 0 1
1
0 16 0 1
0
end_operator
begin_operator
pick-tower b6 b4 b6
4
7 0
11 6
13 4
16 0
2
4
0 5 -1 0
0 7 0 1
0 11 6 0
0 16 0 1
1
0 16 0 1
0
end_operator
begin_operator
pick-tower b6 b4 b7
4
7 0
11 7
13 4
16 0
2
4
0 6 -1 0
0 7 0 1
0 11 7 0
0 16 0 1
1
0 16 0 1
0
end_operator
begin_operator
pick-tower b6 b5 b1
4
7 0
12 1
13 5
16 0
2
4
0 0 -1 0
0 7 0 1
0 12 1 0
0 16 0 1
1
0 16 0 1
0
end_operator
begin_operator
pick-tower b6 b5 b2
4
7 0
12 2
13 5
16 0
2
4
0 1 -1 0
0 7 0 1
0 12 2 0
0 16 0 1
1
0 16 0 1
0
end_operator
begin_operator
pick-tower b6 b5 b3
4
7 0
12 3
13 5
16 0
2
4
0 2 -1 0
0 7 0 1
0 12 3 0
0 16 0 1
1
0 16 0 1
0
end_operator
begin_operator
pick-tower b6 b5 b4
4
7 0
12 4
13 5
16 0
2
4
0 3 -1 0
0 7 0 1
0 12 4 0
0 16 0 1
1
0 16 0 1
0
end_operator
begin_operator
pick-tower b6 b5 b5
4
7 0
12 5
13 5
16 0
2
4
0 4 -1 0
0 7 0 1
0 12 5 0
0 16 0 1
1
0 16 0 1
0
end_operator
begin_operator
pick-tower b6 b5 b6
4
7 0
12 6
13 5
16 0
2
4
0 5 -1 0
0 7 0 1
0 12 6 0
0 16 0 1
1
0 16 0 1
0
end_operator
begin_operator
pick-tower b6 b5 b7
4
7 0
12 7
13 5
16 0
2
4
0 6 -1 0
0 7 0 1
0 12 7 0
0 16 0 1
1
0 16 0 1
0
end_operator
begin_operator
pick-tower b6 b6 b6
3
7 0
13 6
16 0
2
4
0 5 -1 0
0 7 0 1
0 13 6 0
0 16 0 1
1
0 16 0 1
0
end_operator
begin_operator
pick-tower b6 b7 b1
4
7 0
13 7
14 1
16 0
2
4
0 0 -1 0
0 7 0 1
0 14 1 0
0 16 0 1
1
0 16 0 1
0
end_operator
begin_operator
pick-tower b6 b7 b2
4
7 0
13 7
14 2
16 0
2
4
0 1 -1 0
0 7 0 1
0 14 2 0
0 16 0 1
1
0 16 0 1
0
end_operator
begin_operator
pick-tower b6 b7 b3
4
7 0
13 7
14 3
16 0
2
4
0 2 -1 0
0 7 0 1
0 14 3 0
0 16 0 1
1
0 16 0 1
0
end_operator
begin_operator
pick-tower b6 b7 b4
4
7 0
13 7
14 4
16 0
2
4
0 3 -1 0
0 7 0 1
0 14 4 0
0 16 0 1
1
0 16 0 1
0
end_operator
begin_operator
pick-tower b6 b7 b5
4
7 0
13 7
14 5
16 0
2
4
0 4 -1 0
0 7 0 1
0 14 5 0
0 16 0 1
1
0 16 0 1
0
end_operator
begin_operator
pick-tower b6 b7 b6
4
7 0
13 7
14 6
16 0
2
4
0 5 -1 0
0 7 0 1
0 14 6 0
0 16 0 1
1
0 16 0 1
0
end_operator
begin_operator
pick-tower b6 b7 b7
4
7 0
13 7
14 7
16 0
2
4
0 6 -1 0
0 7 0 1
0 14 7 0
0 16 0 1
1
0 16 0 1
0
end_operator
begin_operator
pick-tower b7 b1 b1
4
7 0
8 1
14 1
16 0
2
4
0 0 -1 0
0 7 0 1
0 8 1 0
0 16 0 1
1
0 16 0 1
0
end_operator
begin_operator
pick-tower b7 b1 b2
4
7 0
8 2
14 1
16 0
2
4
0 1 -1 0
0 7 0 1
0 8 2 0
0 16 0 1
1
0 16 0 1
0
end_operator
begin_operator
pick-tower b7 b1 b3
4
7 0
8 3
14 1
16 0
2
4
0 2 -1 0
0 7 0 1
0 8 3 0
0 16 0 1
1
0 16 0 1
0
end_operator
begin_operator
pick-tower b7 b1 b4
4
7 0
8 4
14 1
16 0
2
4
0 3 -1 0
0 7 0 1
0 8 4 0
0 16 0 1
1
0 16 0 1
0
end_operator
begin_operator
pick-tower b7 b1 b5
4
7 0
8 5
14 1
16 0
2
4
0 4 -1 0
0 7 0 1
0 8 5 0
0 16 0 1
1
0 16 0 1
0
end_operator
begin_operator
pick-tower b7 b1 b6
4
7 0
8 6
14 1
16 0
2
4
0 5 -1 0
0 7 0 1
0 8 6 0
0 16 0 1
1
0 16 0 1
0
end_operator
begin_operator
pick-tower b7 b1 b7
4
7 0
8 7
14 1
16 0
2
4
0 6 -1 0
0 7 0 1
0 8 7 0
0 16 0 1
1
0 16 0 1
0
end_operator
begin_operator
pick-tower b7 b2 b1
4
7 0
9 1
14 2
16 0
2
4
0 0 -1 0
0 7 0 1
0 9 1 0
0 16 0 1
1
0 16 0 1
0
end_operator
begin_operator
pick-tower b7 b2 b2
4
7 0
9 2
14 2
16 0
2
4
0 1 -1 0
0 7 0 1
0 9 2 0
0 16 0 1
1
0 16 0 1
0
end_operator
begin_operator
pick-tower b7 b2 b3
4
7 0
9 3
14 2
16 0
2
4
0 2 -1 0
0 7 0 1
0 9 3 0
0 16 0 1
1
0 16 0 1
0
end_operator
begin_operator
pick-tower b7 b2 b4
4
7 0
9 4
14 2
16 0
2
4
0 3 -1 0
0 7 0 1
0 9 4 0
0 16 0 1
1
0 16 0 1
0
end_operator
begin_operator
pick-tower b7 b2 b5
4
7 0
9 5
14 2
16 0
2
4
0 4 -1 0
0 7 0 1
0 9 5 0
0 16 0 1
1
0 16 0 1
0
end_operator
begin_operator
pick-tower b7 b2 b6
4
7 0
9 6
14 2
16 0
2
4
0 5 -1 0
0 7 0 1
0 9 6 0
0 16 0 1
1
0 16 0 1
0
end_operator
begin_operator
pick-tower b7 b2 b7
4
7 0
9 7
14 2
16 0
2
4
0 6 -1 0
0 7 0 1
0 9 7 0
0 16 0 1
1
0 16 0 1
0
end_operator
begin_operator
pick-tower b7 b3 b1
4
7 0
10 1
14 3
16 0
2
4
0 0 -1 0
0 7 0 1
0 10 1 0
0 16 0 1
1
0 16 0 1
0
end_operator
begin_operator
pick-tower b7 b3 b2
4
7 0
10 2
14 3
16 0
2
4
0 1 -1 0
0 7 0 1
0 10 2 0
0 16 0 1
1
0 16 0 1
0
end_operator
begin_operator
pick-tower b7 b3 b3
4
7 0
10 3
14 3
16 0
2
4
0 2 -1 0
0 7 0 1
0 10 3 0
0 16 0 1
1
0 16 0 1
0
end_operator
begin_operator
pick-tower b7 b3 b4
4
7 0
10 4
14 3
16 0
2
4
0 3 -1 0
0 7 0 1
0 10 4 0
0 16 0 1
1
0 16 0 1
0
end_operator
begin_operator
pick-tower b7 b3 b5
4
7 0
10 5
14 3
16 0
2
4
0 4 -1 0
0 7 0 1
0 10 5 0
0 16 0 1
1
0 16 0 1
0
end_operator
begin_operator
pick-tower b7 b3 b6
4
7 0
10 6
14 3
16 0
2
4
0 5 -1 0
0 7 0 1
0 10 6 0
0 16 0 1
1
0 16 0 1
0
end_operator
begin_operator
pick-tower b7 b3 b7
4
7 0
10 7
14 3
16 0
2
4
0 6 -1 0
0 7 0 1
0 10 7 0
0 16 0 1
1
0 16 0 1
0
end_operator
begin_operator
pick-tower b7 b4 b1
4
7 0
11 1
14 4
16 0
2
4
0 0 -1 0
0 7 0 1
0 11 1 0
0 16 0 1
1
0 16 0 1
0
end_operator
begin_operator
pick-tower b7 b4 b2
4
7 0
11 2
14 4
16 0
2
4
0 1 -1 0
0 7 0 1
0 11 2 0
0 16 0 1
1
0 16 0 1
0
end_operator
begin_operator
pick-tower b7 b4 b3
4
7 0
11 3
14 4
16 0
2
4
0 2 -1 0
0 7 0 1
0 11 3 0
0 16 0 1
1
0 16 0 1
0
end_operator
begin_operator
pick-tower b7 b4 b4
4
7 0
11 4
14 4
16 0
2
4
0 3 -1 0
0 7 0 1
0 11 4 0
0 16 0 1
1
0 16 0 1
0
end_operator
begin_operator
pick-tower b7 b4 b5
4
7 0
11 5
14 4
16 0
2
4
0 4 -1 0
0 7 0 1
0 11 5 0
0 16 0 1
1
0 16 0 1
0
end_operator
begin_operator
pick-tower b7 b4 b6
4
7 0
11 6
14 4
16 0
2
4
0 5 -1 0
0 7 0 1
0 11 6 0
0 16 0 1
1
0 16 0 1
0
end_operator
begin_operator
pick-tower b7 b4 b7
4
7 0
11 7
14 4
16 0
2
4
0 6 -1 0
0 7 0 1
0 11 7 0
0 16 0 1
1
0 16 0 1
0
end_operator
begin_operator
pick-tower b7 b5 b1
4
7 0
12 1
14 5
16 0
2
4
0 0 -1 0
0 7 0 1
0 12 1 0
0 16 0 1
1
0 16 0 1
0
end_operator
begin_operator
pick-tower b7 b5 b2
4
7 0
12 2
14 5
16 0
2
4
0 1 -1 0
0 7 0 1
0 12 2 0
0 16 0 1
1
0 16 0 1
0
end_operator
begin_operator
pick-tower b7 b5 b3
4
7 0
12 3
14 5
16 0
2
4
0 2 -1 0
0 7 0 1
0 12 3 0
0 16 0 1
1
0 16 0 1
0
end_operator
begin_operator
pick-tower b7 b5 b4
4
7 0
12 4
14 5
16 0
2
4
0 3 -1 0
0 7 0 1
0 12 4 0
0 16 0 1
1
0 16 0 1
0
end_operator
begin_operator
pick-tower b7 b5 b5
4
7 0
12 5
14 5
16 0
2
4
0 4 -1 0
0 7 0 1
0 12 5 0
0 16 0 1
1
0 16 0 1
0
end_operator
begin_operator
pick-tower b7 b5 b6
4
7 0
12 6
14 5
16 0
2
4
0 5 -1 0
0 7 0 1
0 12 6 0
0 16 0 1
1
0 16 0 1
0
end_operator
begin_operator
pick-tower b7 b5 b7
4
7 0
12 7
14 5
16 0
2
4
0 6 -1 0
0 7 0 1
0 12 7 0
0 16 0 1
1
0 16 0 1
0
end_operator
begin_operator
pick-tower b7 b6 b1
4
7 0
13 1
14 6
16 0
2
4
0 0 -1 0
0 7 0 1
0 13 1 0
0 16 0 1
1
0 16 0 1
0
end_operator
begin_operator
pick-tower b7 b6 b2
4
7 0
13 2
14 6
16 0
2
4
0 1 -1 0
0 7 0 1
0 13 2 0
0 16 0 1
1
0 16 0 1
0
end_operator
begin_operator
pick-tower b7 b6 b3
4
7 0
13 3
14 6
16 0
2
4
0 2 -1 0
0 7 0 1
0 13 3 0
0 16 0 1
1
0 16 0 1
0
end_operator
begin_operator
pick-tower b7 b6 b4
4
7 0
13 4
14 6
16 0
2
4
0 3 -1 0
0 7 0 1
0 13 4 0
0 16 0 1
1
0 16 0 1
0
end_operator
begin_operator
pick-tower b7 b6 b5
4
7 0
13 5
14 6
16 0
2
4
0 4 -1 0
0 7 0 1
0 13 5 0
0 16 0 1
1
0 16 0 1
0
end_operator
begin_operator
pick-tower b7 b6 b6
4
7 0
13 6
14 6
16 0
2
4
0 5 -1 0
0 7 0 1
0 13 6 0
0 16 0 1
1
0 16 0 1
0
end_operator
begin_operator
pick-tower b7 b6 b7
4
7 0
13 7
14 6
16 0
2
4
0 6 -1 0
0 7 0 1
0 13 7 0
0 16 0 1
1
0 16 0 1
0
end_operator
begin_operator
pick-tower b7 b7 b7
3
7 0
14 7
16 0
2
4
0 6 -1 0
0 7 0 1
0 14 7 0
0 16 0 1
1
0 16 0 1
0
end_operator
begin_operator
pick-up b1 b2
4
0 0
7 0
8 2
16 0
2
5
0 0 0 1
0 1 -1 0
0 7 0 1
0 8 2 0
0 16 0 1
3
0 1 -1 0
0 8 2 8
0 16 0 1
0
end_operator
begin_operator
pick-up b1 b3
4
0 0
7 0
8 3
16 0
2
5
0 0 0 1
0 2 -1 0
0 7 0 1
0 8 3 0
0 16 0 1
3
0 2 -1 0
0 8 3 8
0 16 0 1
0
end_operator
begin_operator
pick-up b1 b4
4
0 0
7 0
8 4
16 0
2
5
0 0 0 1
0 3 -1 0
0 7 0 1
0 8 4 0
0 16 0 1
3
0 3 -1 0
0 8 4 8
0 16 0 1
0
end_operator
begin_operator
pick-up b1 b5
4
0 0
7 0
8 5
16 0
2
5
0 0 0 1
0 4 -1 0
0 7 0 1
0 8 5 0
0 16 0 1
3
0 4 -1 0
0 8 5 8
0 16 0 1
0
end_operator
begin_operator
pick-up b1 b6
4
0 0
7 0
8 6
16 0
2
5
0 0 0 1
0 5 -1 0
0 7 0 1
0 8 6 0
0 16 0 1
3
0 5 -1 0
0 8 6 8
0 16 0 1
0
end_operator
begin_operator
pick-up b1 b7
4
0 0
7 0
8 7
16 0
2
5
0 0 0 1
0 6 -1 0
0 7 0 1
0 8 7 0
0 16 0 1
3
0 6 -1 0
0 8 7 8
0 16 0 1
0
end_operator
begin_operator
pick-up b2 b1
4
1 0
7 0
9 1
16 0
2
5
0 0 -1 0
0 1 0 1
0 7 0 1
0 9 1 0
0 16 0 1
3
0 0 -1 0
0 9 1 8
0 16 0 1
0
end_operator
begin_operator
pick-up b2 b3
4
1 0
7 0
9 3
16 0
2
5
0 1 0 1
0 2 -1 0
0 7 0 1
0 9 3 0
0 16 0 1
3
0 2 -1 0
0 9 3 8
0 16 0 1
0
end_operator
begin_operator
pick-up b2 b4
4
1 0
7 0
9 4
16 0
2
5
0 1 0 1
0 3 -1 0
0 7 0 1
0 9 4 0
0 16 0 1
3
0 3 -1 0
0 9 4 8
0 16 0 1
0
end_operator
begin_operator
pick-up b2 b5
4
1 0
7 0
9 5
16 0
2
5
0 1 0 1
0 4 -1 0
0 7 0 1
0 9 5 0
0 16 0 1
3
0 4 -1 0
0 9 5 8
0 16 0 1
0
end_operator
begin_operator
pick-up b2 b6
4
1 0
7 0
9 6
16 0
2
5
0 1 0 1
0 5 -1 0
0 7 0 1
0 9 6 0
0 16 0 1
3
0 5 -1 0
0 9 6 8
0 16 0 1
0
end_operator
begin_operator
pick-up b2 b7
4
1 0
7 0
9 7
16 0
2
5
0 1 0 1
0 6 -1 0
0 7 0 1
0 9 7 0
0 16 0 1
3
0 6 -1 0
0 9 7 8
0 16 0 1
0
end_operator
begin_operator
pick-up b3 b1
4
2 0
7 0
10 1
16 0
2
5
0 0 -1 0
0 2 0 1
0 7 0 1
0 10 1 0
0 16 0 1
3
0 0 -1 0
0 10 1 8
0 16 0 1
0
end_operator
begin_operator
pick-up b3 b2
4
2 0
7 0
10 2
16 0
2
5
0 1 -1 0
0 2 0 1
0 7 0 1
0 10 2 0
0 16 0 1
3
0 1 -1 0
0 10 2 8
0 16 0 1
0
end_operator
begin_operator
pick-up b3 b4
4
2 0
7 0
10 4
16 0
2
5
0 2 0 1
0 3 -1 0
0 7 0 1
0 10 4 0
0 16 0 1
3
0 3 -1 0
0 10 4 8
0 16 0 1
0
end_operator
begin_operator
pick-up b3 b5
4
2 0
7 0
10 5
16 0
2
5
0 2 0 1
0 4 -1 0
0 7 0 1
0 10 5 0
0 16 0 1
3
0 4 -1 0
0 10 5 8
0 16 0 1
0
end_operator
begin_operator
pick-up b3 b6
4
2 0
7 0
10 6
16 0
2
5
0 2 0 1
0 5 -1 0
0 7 0 1
0 10 6 0
0 16 0 1
3
0 5 -1 0
0 10 6 8
0 16 0 1
0
end_operator
begin_operator
pick-up b3 b7
4
2 0
7 0
10 7
16 0
2
5
0 2 0 1
0 6 -1 0
0 7 0 1
0 10 7 0
0 16 0 1
3
0 6 -1 0
0 10 7 8
0 16 0 1
0
end_operator
begin_operator
pick-up b4 b1
4
3 0
7 0
11 1
16 0
2
5
0 0 -1 0
0 3 0 1
0 7 0 1
0 11 1 0
0 16 0 1
3
0 0 -1 0
0 11 1 8
0 16 0 1
0
end_operator
begin_operator
pick-up b4 b2
4
3 0
7 0
11 2
16 0
2
5
0 1 -1 0
0 3 0 1
0 7 0 1
0 11 2 0
0 16 0 1
3
0 1 -1 0
0 11 2 8
0 16 0 1
0
end_operator
begin_operator
pick-up b4 b3
4
3 0
7 0
11 3
16 0
2
5
0 2 -1 0
0 3 0 1
0 7 0 1
0 11 3 0
0 16 0 1
3
0 2 -1 0
0 11 3 8
0 16 0 1
0
end_operator
begin_operator
pick-up b4 b5
4
3 0
7 0
11 5
16 0
2
5
0 3 0 1
0 4 -1 0
0 7 0 1
0 11 5 0
0 16 0 1
3
0 4 -1 0
0 11 5 8
0 16 0 1
0
end_operator
begin_operator
pick-up b4 b6
4
3 0
7 0
11 6
16 0
2
5
0 3 0 1
0 5 -1 0
0 7 0 1
0 11 6 0
0 16 0 1
3
0 5 -1 0
0 11 6 8
0 16 0 1
0
end_operator
begin_operator
pick-up b4 b7
4
3 0
7 0
11 7
16 0
2
5
0 3 0 1
0 6 -1 0
0 7 0 1
0 11 7 0
0 16 0 1
3
0 6 -1 0
0 11 7 8
0 16 0 1
0
end_operator
begin_operator
pick-up b5 b1
4
4 0
7 0
12 1
16 0
2
5
0 0 -1 0
0 4 0 1
0 7 0 1
0 12 1 0
0 16 0 1
3
0 0 -1 0
0 12 1 8
0 16 0 1
0
end_operator
begin_operator
pick-up b5 b2
4
4 0
7 0
12 2
16 0
2
5
0 1 -1 0
0 4 0 1
0 7 0 1
0 12 2 0
0 16 0 1
3
0 1 -1 0
0 12 2 8
0 16 0 1
0
end_operator
begin_operator
pick-up b5 b3
4
4 0
7 0
12 3
16 0
2
5
0 2 -1 0
0 4 0 1
0 7 0 1
0 12 3 0
0 16 0 1
3
0 2 -1 0
0 12 3 8
0 16 0 1
0
end_operator
begin_operator
pick-up b5 b4
4
4 0
7 0
12 4
16 0
2
5
0 3 -1 0
0 4 0 1
0 7 0 1
0 12 4 0
0 16 0 1
3
0 3 -1 0
0 12 4 8
0 16 0 1
0
end_operator
begin_operator
pick-up b5 b6
4
4 0
7 0
12 6
16 0
2
5
0 4 0 1
0 5 -1 0
0 7 0 1
0 12 6 0
0 16 0 1
3
0 5 -1 0
0 12 6 8
0 16 0 1
0
end_operator
begin_operator
pick-up b5 b7
4
4 0
7 0
12 7
16 0
2
5
0 4 0 1
0 6 -1 0
0 7 0 1
0 12 7 0
0 16 0 1
3
0 6 -1 0
0 12 7 8
0 16 0 1
0
end_operator
begin_operator
pick-up b6 b1
4
5 0
7 0
13 1
16 0
2
5
0 0 -1 0
0 5 0 1
0 7 0 1
0 13 1 0
0 16 0 1
3
0 0 -1 0
0 13 1 8
0 16 0 1
0
end_operator
begin_operator
pick-up b6 b2
4
5 0
7 0
13 2
16 0
2
5
0 1 -1 0
0 5 0 1
0 7 0 1
0 13 2 0
0 16 0 1
3
0 1 -1 0
0 13 2 8
0 16 0 1
0
end_operator
begin_operator
pick-up b6 b3
4
5 0
7 0
13 3
16 0
2
5
0 2 -1 0
0 5 0 1
0 7 0 1
0 13 3 0
0 16 0 1
3
0 2 -1 0
0 13 3 8
0 16 0 1
0
end_operator
begin_operator
pick-up b6 b4
4
5 0
7 0
13 4
16 0
2
5
0 3 -1 0
0 5 0 1
0 7 0 1
0 13 4 0
0 16 0 1
3
0 3 -1 0
0 13 4 8
0 16 0 1
0
end_operator
begin_operator
pick-up b6 b5
4
5 0
7 0
13 5
16 0
2
5
0 4 -1 0
0 5 0 1
0 7 0 1
0 13 5 0
0 16 0 1
3
0 4 -1 0
0 13 5 8
0 16 0 1
0
end_operator
begin_operator
pick-up b6 b7
4
5 0
7 0
13 7
16 0
2
5
0 5 0 1
0 6 -1 0
0 7 0 1
0 13 7 0
0 16 0 1
3
0 6 -1 0
0 13 7 8
0 16 0 1
0
end_operator
begin_operator
pick-up b7 b1
4
6 0
7 0
14 1
16 0
2
5
0 0 -1 0
0 6 0 1
0 7 0 1
0 14 1 0
0 16 0 1
3
0 0 -1 0
0 14 1 8
0 16 0 1
0
end_operator
begin_operator
pick-up b7 b2
4
6 0
7 0
14 2
16 0
2
5
0 1 -1 0
0 6 0 1
0 7 0 1
0 14 2 0
0 16 0 1
3
0 1 -1 0
0 14 2 8
0 16 0 1
0
end_operator
begin_operator
pick-up b7 b3
4
6 0
7 0
14 3
16 0
2
5
0 2 -1 0
0 6 0 1
0 7 0 1
0 14 3 0
0 16 0 1
3
0 2 -1 0
0 14 3 8
0 16 0 1
0
end_operator
begin_operator
pick-up b7 b4
4
6 0
7 0
14 4
16 0
2
5
0 3 -1 0
0 6 0 1
0 7 0 1
0 14 4 0
0 16 0 1
3
0 3 -1 0
0 14 4 8
0 16 0 1
0
end_operator
begin_operator
pick-up b7 b5
4
6 0
7 0
14 5
16 0
2
5
0 4 -1 0
0 6 0 1
0 7 0 1
0 14 5 0
0 16 0 1
3
0 4 -1 0
0 14 5 8
0 16 0 1
0
end_operator
begin_operator
pick-up b7 b6
4
6 0
7 0
14 6
16 0
2
5
0 5 -1 0
0 6 0 1
0 7 0 1
0 14 6 0
0 16 0 1
3
0 5 -1 0
0 14 6 8
0 16 0 1
0
end_operator
begin_operator
pick-up-from-table b1
4
0 0
7 0
8 8
16 0
2
3
0 7 0 1
0 8 8 0
0 16 0 1
1
0 16 0 1
0
end_operator
begin_operator
pick-up-from-table b2
4
1 0
7 0
9 8
16 0
2
3
0 7 0 1
0 9 8 0
0 16 0 1
1
0 16 0 1
0
end_operator
begin_operator
pick-up-from-table b3
4
2 0
7 0
10 8
16 0
2
3
0 7 0 1
0 10 8 0
0 16 0 1
1
0 16 0 1
0
end_operator
begin_operator
pick-up-from-table b4
4
3 0
7 0
11 8
16 0
2
3
0 7 0 1
0 11 8 0
0 16 0 1
1
0 16 0 1
0
end_operator
begin_operator
pick-up-from-table b5
4
4 0
7 0
12 8
16 0
2
3
0 7 0 1
0 12 8 0
0 16 0 1
1
0 16 0 1
0
end_operator
begin_operator
pick-up-from-table b6
4
5 0
7 0
13 8
16 0
2
3
0 7 0 1
0 13 8 0
0 16 0 1
1
0 16 0 1
0
end_operator
begin_operator
pick-up-from-table b7
4
6 0
7 0
14 8
16 0
2
3
0 7 0 1
0 14 8 0
0 16 0 1
1
0 16 0 1
0
end_operator
begin_operator
put-down b1
2
8 0
16 0
1
4
0 0 -1 0
0 7 -1 0
0 8 0 8
0 16 0 1
0
end_operator
begin_operator
put-down b2
2
9 0
16 0
1
4
0 1 -1 0
0 7 -1 0
0 9 0 8
0 16 0 1
0
end_operator
begin_operator
put-down b3
2
10 0
16 0
1
4
0 2 -1 0
0 7 -1 0
0 10 0 8
0 16 0 1
0
end_operator
begin_operator
put-down b4
2
11 0
16 0
1
4
0 3 -1 0
0 7 -1 0
0 11 0 8
0 16 0 1
0
end_operator
begin_operator
put-down b5
2
12 0
16 0
1
4
0 4 -1 0
0 7 -1 0
0 12 0 8
0 16 0 1
0
end_operator
begin_operator
put-down b6
2
13 0
16 0
1
4
0 5 -1 0
0 7 -1 0
0 13 0 8
0 16 0 1
0
end_operator
begin_operator
put-down b7
2
14 0
16 0
1
4
0 6 -1 0
0 7 -1 0
0 14 0 8
0 16 0 1
0
end_operator
begin_operator
put-on-block b1 b1
3
0 0
8 0
16 0
2
3
0 7 -1 0
0 8 0 1
0 16 0 1
3
0 7 -1 0
0 8 0 8
0 16 0 1
0
end_operator
begin_operator
put-on-block b1 b2
3
1 0
8 0
16 0
2
5
0 0 -1 0
0 1 0 1
0 7 -1 0
0 8 0 2
0 16 0 1
4
0 0 -1 0
0 7 -1 0
0 8 0 8
0 16 0 1
0
end_operator
begin_operator
put-on-block b1 b3
3
2 0
8 0
16 0
2
5
0 0 -1 0
0 2 0 1
0 7 -1 0
0 8 0 3
0 16 0 1
4
0 0 -1 0
0 7 -1 0
0 8 0 8
0 16 0 1
0
end_operator
begin_operator
put-on-block b1 b4
3
3 0
8 0
16 0
2
5
0 0 -1 0
0 3 0 1
0 7 -1 0
0 8 0 4
0 16 0 1
4
0 0 -1 0
0 7 -1 0
0 8 0 8
0 16 0 1
0
end_operator
begin_operator
put-on-block b1 b5
3
4 0
8 0
16 0
2
5
0 0 -1 0
0 4 0 1
0 7 -1 0
0 8 0 5
0 16 0 1
4
0 0 -1 0
0 7 -1 0
0 8 0 8
0 16 0 1
0
end_operator
begin_operator
put-on-block b1 b6
3
5 0
8 0
16 0
2
5
0 0 -1 0
0 5 0 1
0 7 -1 0
0 8 0 6
0 16 0 1
4
0 0 -1 0
0 7 -1 0
0 8 0 8
0 16 0 1
0
end_operator
begin_operator
put-on-block b1 b7
3
6 0
8 0
16 0
2
5
0 0 -1 0
0 6 0 1
0 7 -1 0
0 8 0 7
0 16 0 1
4
0 0 -1 0
0 7 -1 0
0 8 0 8
0 16 0 1
0
end_operator
begin_operator
put-on-block b2 b1
3
0 0
9 0
16 0
2
5
0 0 0 1
0 1 -1 0
0 7 -1 0
0 9 0 1
0 16 0 1
4
0 1 -1 0
0 7 -1 0
0 9 0 8
0 16 0 1
0
end_operator
begin_operator
put-on-block b2 b2
3
1 0
9 0
16 0
2
3
0 7 -1 0
0 9 0 2
0 16 0 1
3
0 7 -1 0
0 9 0 8
0 16 0 1
0
end_operator
begin_operator
put-on-block b2 b3
3
2 0
9 0
16 0
2
5
0 1 -1 0
0 2 0 1
0 7 -1 0
0 9 0 3
0 16 0 1
4
0 1 -1 0
0 7 -1 0
0 9 0 8
0 16 0 1
0
end_operator
begin_operator
put-on-block b2 b4
3
3 0
9 0
16 0
2
5
0 1 -1 0
0 3 0 1
0 7 -1 0
0 9 0 4
0 16 0 1
4
0 1 -1 0
0 7 -1 0
0 9 0 8
0 16 0 1
0
end_operator
begin_operator
put-on-block b2 b5
3
4 0
9 0
16 0
2
5
0 1 -1 0
0 4 0 1
0 7 -1 0
0 9 0 5
0 16 0 1
4
0 1 -1 0
0 7 -1 0
0 9 0 8
0 16 0 1
0
end_operator
begin_operator
put-on-block b2 b6
3
5 0
9 0
16 0
2
5
0 1 -1 0
0 5 0 1
0 7 -1 0
0 9 0 6
0 16 0 1
4
0 1 -1 0
0 7 -1 0
0 9 0 8
0 16 0 1
0
end_operator
begin_operator
put-on-block b2 b7
3
6 0
9 0
16 0
2
5
0 1 -1 0
0 6 0 1
0 7 -1 0
0 9 0 7
0 16 0 1
4
0 1 -1 0
0 7 -1 0
0 9 0 8
0 16 0 1
0
end_operator
begin_operator
put-on-block b3 b1
3
0 0
10 0
16 0
2
5
0 0 0 1
0 2 -1 0
0 7 -1 0
0 10 0 1
0 16 0 1
4
0 2 -1 0
0 7 -1 0
0 10 0 8
0 16 0 1
0
end_operator
begin_operator
put-on-block b3 b2
3
1 0
10 0
16 0
2
5
0 1 0 1
0 2 -1 0
0 7 -1 0
0 10 0 2
0 16 0 1
4
0 2 -1 0
0 7 -1 0
0 10 0 8
0 16 0 1
0
end_operator
begin_operator
put-on-block b3 b3
3
2 0
10 0
16 0
2
3
0 7 -1 0
0 10 0 3
0 16 0 1
3
0 7 -1 0
0 10 0 8
0 16 0 1
0
end_operator
begin_operator
put-on-block b3 b4
3
3 0
10 0
16 0
2
5
0 2 -1 0
0 3 0 1
0 7 -1 0
0 10 0 4
0 16 0 1
4
0 2 -1 0
0 7 -1 0
0 10 0 8
0 16 0 1
0
end_operator
begin_operator
put-on-block b3 b5
3
4 0
10 0
16 0
2
5
0 2 -1 0
0 4 0 1
0 7 -1 0
0 10 0 5
0 16 0 1
4
0 2 -1 0
0 7 -1 0
0 10 0 8
0 16 0 1
0
end_operator
begin_operator
put-on-block b3 b6
3
5 0
10 0
16 0
2
5
0 2 -1 0
0 5 0 1
0 7 -1 0
0 10 0 6
0 16 0 1
4
0 2 -1 0
0 7 -1 0
0 10 0 8
0 16 0 1
0
end_operator
begin_operator
put-on-block b3 b7
3
6 0
10 0
16 0
2
5
0 2 -1 0
0 6 0 1
0 7 -1 0
0 10 0 7
0 16 0 1
4
0 2 -1 0
0 7 -1 0
0 10 0 8
0 16 0 1
0
end_operator
begin_operator
put-on-block b4 b1
3
0 0
11 0
16 0
2
5
0 0 0 1
0 3 -1 0
0 7 -1 0
0 11 0 1
0 16 0 1
4
0 3 -1 0
0 7 -1 0
0 11 0 8
0 16 0 1
0
end_operator
begin_operator
put-on-block b4 b2
3
1 0
11 0
16 0
2
5
0 1 0 1
0 3 -1 0
0 7 -1 0
0 11 0 2
0 16 0 1
4
0 3 -1 0
0 7 -1 0
0 11 0 8
0 16 0 1
0
end_operator
begin_operator
put-on-block b4 b3
3
2 0
11 0
16 0
2
5
0 2 0 1
0 3 -1 0
0 7 -1 0
0 11 0 3
0 16 0 1
4
0 3 -1 0
0 7 -1 0
0 11 0 8
0 16 0 1
0
end_operator
begin_operator
put-on-block b4 b4
3
3 0
11 0
16 0
2
3
0 7 -1 0
0 11 0 4
0 16 0 1
3
0 7 -1 0
0 11 0 8
0 16 0 1
0
end_operator
begin_operator
put-on-block b4 b5
3
4 0
11 0
16 0
2
5
0 3 -1 0
0 4 0 1
0 7 -1 0
0 11 0 5
0 16 0 1
4
0 3 -1 0
0 7 -1 0
0 11 0 8
0 16 0 1
0
end_operator
begin_operator
put-on-block b4 b6
3
5 0
11 0
16 0
2
5
0 3 -1 0
0 5 0 1
0 7 -1 0
0 11 0 6
0 16 0 1
4
0 3 -1 0
0 7 -1 0
0 11 0 8
0 16 0 1
0
end_operator
begin_operator
put-on-block b4 b7
3
6 0
11 0
16 0
2
5
0 3 -1 0
0 6 0 1
0 7 -1 0
0 11 0 7
0 16 0 1
4
0 3 -1 0
0 7 -1 0
0 11 0 8
0 16 0 1
0
end_operator
begin_operator
put-on-block b5 b1
3
0 0
12 0
16 0
2
5
0 0 0 1
0 4 -1 0
0 7 -1 0
0 12 0 1
0 16 0 1
4
0 4 -1 0
0 7 -1 0
0 12 0 8
0 16 0 1
0
end_operator
begin_operator
put-on-block b5 b2
3
1 0
12 0
16 0
2
5
0 1 0 1
0 4 -1 0
0 7 -1 0
0 12 0 2
0 16 0 1
4
0 4 -1 0
0 7 -1 0
0 12 0 8
0 16 0 1
0
end_operator
begin_operator
put-on-block b5 b3
3
2 0
12 0
16 0
2
5
0 2 0 1
0 4 -1 0
0 7 -1 0
0 12 0 3
0 16 0 1
4
0 4 -1 0
0 7 -1 0
0 12 0 8
0 16 0 1
0
end_operator
begin_operator
put-on-block b5 b4
3
3 0
12 0
16 0
2
5
0 3 0 1
0 4 -1 0
0 7 -1 0
0 12 0 4
0 16 0 1
4
0 4 -1 0
0 7 -1 0
0 12 0 8
0 16 0 1
0
end_operator
begin_operator
put-on-block b5 b5
3
4 0
12 0
16 0
2
3
0 7 -1 0
0 12 0 5
0 16 0 1
3
0 7 -1 0
0 12 0 8
0 16 0 1
0
end_operator
begin_operator
put-on-block b5 b6
3
5 0
12 0
16 0
2
5
0 4 -1 0
0 5 0 1
0 7 -1 0
0 12 0 6
0 16 0 1
4
0 4 -1 0
0 7 -1 0
0 12 0 8
0 16 0 1
0
end_operator
begin_operator
put-on-block b5 b7
3
6 0
12 0
16 0
2
5
0 4 -1 0
0 6 0 1
0 7 -1 0
0 12 0 7
0 16 0 1
4
0 4 -1 0
0 7 -1 0
0 12 0 8
0 16 0 1
0
end_operator
begin_operator
put-on-block b6 b1
3
0 0
13 0
16 0
2
5
0 0 0 1
0 5 -1 0
0 7 -1 0
0 13 0 1
0 16 0 1
4
0 5 -1 0
0 7 -1 0
0 13 0 8
0 16 0 1
0
end_operator
begin_operator
put-on-block b6 b2
3
1 0
13 0
16 0
2
5
0 1 0 1
0 5 -1 0
0 7 -1 0
0 13 0 2
0 16 0 1
4
0 5 -1 0
0 7 -1 0
0 13 0 8
0 16 0 1
0
end_operator
begin_operator
put-on-block b6 b3
3
2 0
13 0
16 0
2
5
0 2 0 1
0 5 -1 0
0 7 -1 0
0 13 0 3
0 16 0 1
4
0 5 -1 0
0 7 -1 0
0 13 0 8
0 16 0 1
0
end_operator
begin_operator
put-on-block b6 b4
3
3 0
13 0
16 0
2
5
0 3 0 1
0 5 -1 0
0 7 -1 0
0 13 0 4
0 16 0 1
4
0 5 -1 0
0 7 -1 0
0 13 0 8
0 16 0 1
0
end_operator
begin_operator
put-on-block b6 b5
3
4 0
13 0
16 0
2
5
0 4 0 1
0 5 -1 0
0 7 -1 0
0 13 0 5
0 16 0 1
4
0 5 -1 0
0 7 -1 0
0 13 0 8
0 16 0 1
0
end_operator
begin_operator
put-on-block b6 b6
3
5 0
13 0
16 0
2
3
0 7 -1 0
0 13 0 6
0 16 0 1
3
0 7 -1 0
0 13 0 8
0 16 0 1
0
end_operator
begin_operator
put-on-block b6 b7
3
6 0
13 0
16 0
2
5
0 5 -1 0
0 6 0 1
0 7 -1 0
0 13 0 7
0 16 0 1
4
0 5 -1 0
0 7 -1 0
0 13 0 8
0 16 0 1
0
end_operator
begin_operator
put-on-block b7 b1
3
0 0
14 0
16 0
2
5
0 0 0 1
0 6 -1 0
0 7 -1 0
0 14 0 1
0 16 0 1
4
0 6 -1 0
0 7 -1 0
0 14 0 8
0 16 0 1
0
end_operator
begin_operator
put-on-block b7 b2
3
1 0
14 0
16 0
2
5
0 1 0 1
0 6 -1 0
0 7 -1 0
0 14 0 2
0 16 0 1
4
0 6 -1 0
0 7 -1 0
0 14 0 8
0 16 0 1
0
end_operator
begin_operator
put-on-block b7 b3
3
2 0
14 0
16 0
2
5
0 2 0 1
0 6 -1 0
0 7 -1 0
0 14 0 3
0 16 0 1
4
0 6 -1 0
0 7 -1 0
0 14 0 8
0 16 0 1
0
end_operator
begin_operator
put-on-block b7 b4
3
3 0
14 0
16 0
2
5
0 3 0 1
0 6 -1 0
0 7 -1 0
0 14 0 4
0 16 0 1
4
0 6 -1 0
0 7 -1 0
0 14 0 8
0 16 0 1
0
end_operator
begin_operator
put-on-block b7 b5
3
4 0
14 0
16 0
2
5
0 4 0 1
0 6 -1 0
0 7 -1 0
0 14 0 5
0 16 0 1
4
0 6 -1 0
0 7 -1 0
0 14 0 8
0 16 0 1
0
end_operator
begin_operator
put-on-block b7 b6
3
5 0
14 0
16 0
2
5
0 5 0 1
0 6 -1 0
0 7 -1 0
0 14 0 6
0 16 0 1
4
0 6 -1 0
0 7 -1 0
0 14 0 8
0 16 0 1
0
end_operator
begin_operator
put-on-block b7 b7
3
6 0
14 0
16 0
2
3
0 7 -1 0
0 14 0 7
0 16 0 1
3
0 7 -1 0
0 14 0 8
0 16 0 1
0
end_operator
begin_operator
put-tower-down b1 b2
3
8 2
9 0
16 0
1
3
0 7 -1 0
0 9 0 8
0 16 0 1
0
end_operator
begin_operator
put-tower-down b1 b3
3
8 3
10 0
16 0
1
3
0 7 -1 0
0 10 0 8
0 16 0 1
0
end_operator
begin_operator
put-tower-down b1 b4
3
8 4
11 0
16 0
1
3
0 7 -1 0
0 11 0 8
0 16 0 1
0
end_operator
begin_operator
put-tower-down b1 b5
3
8 5
12 0
16 0
1
3
0 7 -1 0
0 12 0 8
0 16 0 1
0
end_operator
begin_operator
put-tower-down b1 b6
3
8 6
13 0
16 0
1
3
0 7 -1 0
0 13 0 8
0 16 0 1
0
end_operator
begin_operator
put-tower-down b1 b7
3
8 7
14 0
16 0
1
3
0 7 -1 0
0 14 0 8
0 16 0 1
0
end_operator
begin_operator
put-tower-down b2 b1
3
8 0
9 1
16 0
1
3
0 7 -1 0
0 8 0 8
0 16 0 1
0
end_operator
begin_operator
put-tower-down b2 b3
3
9 3
10 0
16 0
1
3
0 7 -1 0
0 10 0 8
0 16 0 1
0
end_operator
begin_operator
put-tower-down b2 b4
3
9 4
11 0
16 0
1
3
0 7 -1 0
0 11 0 8
0 16 0 1
0
end_operator
begin_operator
put-tower-down b2 b5
3
9 5
12 0
16 0
1
3
0 7 -1 0
0 12 0 8
0 16 0 1
0
end_operator
begin_operator
put-tower-down b2 b6
3
9 6
13 0
16 0
1
3
0 7 -1 0
0 13 0 8
0 16 0 1
0
end_operator
begin_operator
put-tower-down b2 b7
3
9 7
14 0
16 0
1
3
0 7 -1 0
0 14 0 8
0 16 0 1
0
end_operator
begin_operator
put-tower-down b3 b1
3
8 0
10 1
16 0
1
3
0 7 -1 0
0 8 0 8
0 16 0 1
0
end_operator
begin_operator
put-tower-down b3 b2
3
9 0
10 2
16 0
1
3
0 7 -1 0
0 9 0 8
0 16 0 1
0
end_operator
begin_operator
put-tower-down b3 b4
3
10 4
11 0
16 0
1
3
0 7 -1 0
0 11 0 8
0 16 0 1
0
end_operator
begin_operator
put-tower-down b3 b5
3
10 5
12 0
16 0
1
3
0 7 -1 0
0 12 0 8
0 16 0 1
0
end_operator
begin_operator
put-tower-down b3 b6
3
10 6
13 0
16 0
1
3
0 7 -1 0
0 13 0 8
0 16 0 1
0
end_operator
begin_operator
put-tower-down b3 b7
3
10 7
14 0
16 0
1
3
0 7 -1 0
0 14 0 8
0 16 0 1
0
end_operator
begin_operator
put-tower-down b4 b1
3
8 0
11 1
16 0
1
3
0 7 -1 0
0 8 0 8
0 16 0 1
0
end_operator
begin_operator
put-tower-down b4 b2
3
9 0
11 2
16 0
1
3
0 7 -1 0
0 9 0 8
0 16 0 1
0
end_operator
begin_operator
put-tower-down b4 b3
3
10 0
11 3
16 0
1
3
0 7 -1 0
0 10 0 8
0 16 0 1
0
end_operator
begin_operator
put-tower-down b4 b5
3
11 5
12 0
16 0
1
3
0 7 -1 0
0 12 0 8
0 16 0 1
0
end_operator
begin_operator
put-tower-down b4 b6
3
11 6
13 0
16 0
1
3
0 7 -1 0
0 13 0 8
0 16 0 1
0
end_operator
begin_operator
put-tower-down b4 b7
3
11 7
14 0
16 0
1
3
0 7 -1 0
0 14 0 8
0 16 0 1
0
end_operator
begin_operator
put-tower-down b5 b1
3
8 0
12 1
16 0
1
3
0 7 -1 0
0 8 0 8
0 16 0 1
0
end_operator
begin_operator
put-tower-down b5 b2
3
9 0
12 2
16 0
1
3
0 7 -1 0
0 9 0 8
0 16 0 1
0
end_operator
begin_operator
put-tower-down b5 b3
3
10 0
12 3
16 0
1
3
0 7 -1 0
0 10 0 8
0 16 0 1
0
end_operator
begin_operator
put-tower-down b5 b4
3
11 0
12 4
16 0
1
3
0 7 -1 0
0 11 0 8
0 16 0 1
0
end_operator
begin_operator
put-tower-down b5 b6
3
12 6
13 0
16 0
1
3
0 7 -1 0
0 13 0 8
0 16 0 1
0
end_operator
begin_operator
put-tower-down b5 b7
3
12 7
14 0
16 0
1
3
0 7 -1 0
0 14 0 8
0 16 0 1
0
end_operator
begin_operator
put-tower-down b6 b1
3
8 0
13 1
16 0
1
3
0 7 -1 0
0 8 0 8
0 16 0 1
0
end_operator
begin_operator
put-tower-down b6 b2
3
9 0
13 2
16 0
1
3
0 7 -1 0
0 9 0 8
0 16 0 1
0
end_operator
begin_operator
put-tower-down b6 b3
3
10 0
13 3
16 0
1
3
0 7 -1 0
0 10 0 8
0 16 0 1
0
end_operator
begin_operator
put-tower-down b6 b4
3
11 0
13 4
16 0
1
3
0 7 -1 0
0 11 0 8
0 16 0 1
0
end_operator
begin_operator
put-tower-down b6 b5
3
12 0
13 5
16 0
1
3
0 7 -1 0
0 12 0 8
0 16 0 1
0
end_operator
begin_operator
put-tower-down b6 b7
3
13 7
14 0
16 0
1
3
0 7 -1 0
0 14 0 8
0 16 0 1
0
end_operator
begin_operator
put-tower-down b7 b1
3
8 0
14 1
16 0
1
3
0 7 -1 0
0 8 0 8
0 16 0 1
0
end_operator
begin_operator
put-tower-down b7 b2
3
9 0
14 2
16 0
1
3
0 7 -1 0
0 9 0 8
0 16 0 1
0
end_operator
begin_operator
put-tower-down b7 b3
3
10 0
14 3
16 0
1
3
0 7 -1 0
0 10 0 8
0 16 0 1
0
end_operator
begin_operator
put-tower-down b7 b4
3
11 0
14 4
16 0
1
3
0 7 -1 0
0 11 0 8
0 16 0 1
0
end_operator
begin_operator
put-tower-down b7 b5
3
12 0
14 5
16 0
1
3
0 7 -1 0
0 12 0 8
0 16 0 1
0
end_operator
begin_operator
put-tower-down b7 b6
3
13 0
14 6
16 0
1
3
0 7 -1 0
0 13 0 8
0 16 0 1
0
end_operator
begin_operator
put-tower-on-block b1 b2 b1
4
0 0
8 2
9 0
16 0
2
4
0 0 0 1
0 7 -1 0
0 9 0 1
0 16 0 1
3
0 7 -1 0
0 9 0 8
0 16 0 1
0
end_operator
begin_operator
put-tower-on-block b1 b2 b2
4
1 0
8 2
9 0
16 0
2
4
0 1 0 1
0 7 -1 0
0 9 0 2
0 16 0 1
3
0 7 -1 0
0 9 0 8
0 16 0 1
0
end_operator
begin_operator
put-tower-on-block b1 b2 b3
4
2 0
8 2
9 0
16 0
2
4
0 2 0 1
0 7 -1 0
0 9 0 3
0 16 0 1
3
0 7 -1 0
0 9 0 8
0 16 0 1
0
end_operator
begin_operator
put-tower-on-block b1 b2 b4
4
3 0
8 2
9 0
16 0
2
4
0 3 0 1
0 7 -1 0
0 9 0 4
0 16 0 1
3
0 7 -1 0
0 9 0 8
0 16 0 1
0
end_operator
begin_operator
put-tower-on-block b1 b2 b5
4
4 0
8 2
9 0
16 0
2
4
0 4 0 1
0 7 -1 0
0 9 0 5
0 16 0 1
3
0 7 -1 0
0 9 0 8
0 16 0 1
0
end_operator
begin_operator
put-tower-on-block b1 b2 b6
4
5 0
8 2
9 0
16 0
2
4
0 5 0 1
0 7 -1 0
0 9 0 6
0 16 0 1
3
0 7 -1 0
0 9 0 8
0 16 0 1
0
end_operator
begin_operator
put-tower-on-block b1 b2 b7
4
6 0
8 2
9 0
16 0
2
4
0 6 0 1
0 7 -1 0
0 9 0 7
0 16 0 1
3
0 7 -1 0
0 9 0 8
0 16 0 1
0
end_operator
begin_operator
put-tower-on-block b1 b3 b1
4
0 0
8 3
10 0
16 0
2
4
0 0 0 1
0 7 -1 0
0 10 0 1
0 16 0 1
3
0 7 -1 0
0 10 0 8
0 16 0 1
0
end_operator
begin_operator
put-tower-on-block b1 b3 b2
4
1 0
8 3
10 0
16 0
2
4
0 1 0 1
0 7 -1 0
0 10 0 2
0 16 0 1
3
0 7 -1 0
0 10 0 8
0 16 0 1
0
end_operator
begin_operator
put-tower-on-block b1 b3 b3
4
2 0
8 3
10 0
16 0
2
4
0 2 0 1
0 7 -1 0
0 10 0 3
0 16 0 1
3
0 7 -1 0
0 10 0 8
0 16 0 1
0
end_operator
begin_operator
put-tower-on-block b1 b3 b4
4
3 0
8 3
10 0
16 0
2
4
0 3 0 1
0 7 -1 0
0 10 0 4
0 16 0 1
3
0 7 -1 0
0 10 0 8
0 16 0 1
0
end_operator
begin_operator
put-tower-on-block b1 b3 b5
4
4 0
8 3
10 0
16 0
2
4
0 4 0 1
0 7 -1 0
0 10 0 5
0 16 0 1
3
0 7 -1 0
0 10 0 8
0 16 0 1
0
end_operator
begin_operator
put-tower-on-block b1 b3 b6
4
5 0
8 3
10 0
16 0
2
4
0 5 0 1
0 7 -1 0
0 10 0 6
0 16 0 1
3
0 7 -1 0
0 10 0 8
0 16 0 1
0
end_operator
begin_operator
put-tower-on-block b1 b3 b7
4
6 0
8 3
10 0
16 0
2
4
0 6 0 1
0 7 -1 0
0 10 0 7
0 16 0 1
3
0 7 -1 0
0 10 0 8
0 16 0 1
0
end_operator
begin_operator
put-tower-on-block b1 b4 b1
4
0 0
8 4
11 0
16 0
2
4
0 0 0 1
0 7 -1 0
0 11 0 1
0 16 0 1
3
0 7 -1 0
0 11 0 8
0 16 0 1
0
end_operator
begin_operator
put-tower-on-block b1 b4 b2
4
1 0
8 4
11 0
16 0
2
4
0 1 0 1
0 7 -1 0
0 11 0 2
0 16 0 1
3
0 7 -1 0
0 11 0 8
0 16 0 1
0
end_operator
begin_operator
put-tower-on-block b1 b4 b3
4
2 0
8 4
11 0
16 0
2
4
0 2 0 1
0 7 -1 0
0 11 0 3
0 16 0 1
3
0 7 -1 0
0 11 0 8
0 16 0 1
0
end_operator
begin_operator
put-tower-on-block b1 b4 b4
4
3 0
8 4
11 0
16 0
2
4
0 3 0 1
0 7 -1 0
0 11 0 4
0 16 0 1
3
0 7 -1 0
0 11 0 8
0 16 0 1
0
end_operator
begin_operator
put-tower-on-block b1 b4 b5
4
4 0
8 4
11 0
16 0
2
4
0 4 0 1
0 7 -1 0
0 11 0 5
0 16 0 1
3
0 7 -1 0
0 11 0 8
0 16 0 1
0
end_operator
begin_operator
put-tower-on-block b1 b4 b6
4
5 0
8 4
11 0
16 0
2
4
0 5 0 1
0 7 -1 0
0 11 0 6
0 16 0 1
3
0 7 -1 0
0 11 0 8
0 16 0 1
0
end_operator
begin_operator
put-tower-on-block b1 b4 b7
4
6 0
8 4
11 0
16 0
2
4
0 6 0 1
0 7 -1 0
0 11 0 7
0 16 0 1
3
0 7 -1 0
0 11 0 8
0 16 0 1
0
end_operator
begin_operator
put-tower-on-block b1 b5 b1
4
0 0
8 5
12 0
16 0
2
4
0 0 0 1
0 7 -1 0
0 12 0 1
0 16 0 1
3
0 7 -1 0
0 12 0 8
0 16 0 1
0
end_operator
begin_operator
put-tower-on-block b1 b5 b2
4
1 0
8 5
12 0
16 0
2
4
0 1 0 1
0 7 -1 0
0 12 0 2
0 16 0 1
3
0 7 -1 0
0 12 0 8
0 16 0 1
0
end_operator
begin_operator
put-tower-on-block b1 b5 b3
4
2 0
8 5
12 0
16 0
2
4
0 2 0 1
0 7 -1 0
0 12 0 3
0 16 0 1
3
0 7 -1 0
0 12 0 8
0 16 0 1
0
end_operator
begin_operator
put-tower-on-block b1 b5 b4
4
3 0
8 5
12 0
16 0
2
4
0 3 0 1
0 7 -1 0
0 12 0 4
0 16 0 1
3
0 7 -1 0
0 12 0 8
0 16 0 1
0
end_operator
begin_operator
put-tower-on-block b1 b5 b5
4
4 0
8 5
12 0
16 0
2
4
0 4 0 1
0 7 -1 0
0 12 0 5
0 16 0 1
3
0 7 -1 0
0 12 0 8
0 16 0 1
0
end_operator
begin_operator
put-tower-on-block b1 b5 b6
4
5 0
8 5
12 0
16 0
2
4
0 5 0 1
0 7 -1 0
0 12 0 6
0 16 0 1
3
0 7 -1 0
0 12 0 8
0 16 0 1
0
end_operator
begin_operator
put-tower-on-block b1 b5 b7
4
6 0
8 5
12 0
16 0
2
4
0 6 0 1
0 7 -1 0
0 12 0 7
0 16 0 1
3
0 7 -1 0
0 12 0 8
0 16 0 1
0
end_operator
begin_operator
put-tower-on-block b1 b6 b1
4
0 0
8 6
13 0
16 0
2
4
0 0 0 1
0 7 -1 0
0 13 0 1
0 16 0 1
3
0 7 -1 0
0 13 0 8
0 16 0 1
0
end_operator
begin_operator
put-tower-on-block b1 b6 b2
4
1 0
8 6
13 0
16 0
2
4
0 1 0 1
0 7 -1 0
0 13 0 2
0 16 0 1
3
0 7 -1 0
0 13 0 8
0 16 0 1
0
end_operator
begin_operator
put-tower-on-block b1 b6 b3
4
2 0
8 6
13 0
16 0
2
4
0 2 0 1
0 7 -1 0
0 13 0 3
0 16 0 1
3
0 7 -1 0
0 13 0 8
0 16 0 1
0
end_operator
begin_operator
put-tower-on-block b1 b6 b4
4
3 0
8 6
13 0
16 0
2
4
0 3 0 1
0 7 -1 0
0 13 0 4
0 16 0 1
3
0 7 -1 0
0 13 0 8
0 16 0 1
0
end_operator
begin_operator
put-tower-on-block b1 b6 b5
4
4 0
8 6
13 0
16 0
2
4
0 4 0 1
0 7 -1 0
0 13 0 5
0 16 0 1
3
0 7 -1 0
0 13 0 8
0 16 0 1
0
end_operator
begin_operator
put-tower-on-block b1 b6 b6
4
5 0
8 6
13 0
16 0
2
4
0 5 0 1
0 7 -1 0
0 13 0 6
0 16 0 1
3
0 7 -1 0
0 13 0 8
0 16 0 1
0
end_operator
begin_operator
put-tower-on-block b1 b6 b7
4
6 0
8 6
13 0
16 0
2
4
0 6 0 1
0 7 -1 0
0 13 0 7
0 16 0 1
3
0 7 -1 0
0 13 0 8
0 16 0 1
0
end_operator
begin_operator
put-tower-on-block b1 b7 b1
4
0 0
8 7
14 0
16 0
2
4
0 0 0 1
0 7 -1 0
0 14 0 1
0 16 0 1
3
0 7 -1 0
0 14 0 8
0 16 0 1
0
end_operator
begin_operator
put-tower-on-block b1 b7 b2
4
1 0
8 7
14 0
16 0
2
4
0 1 0 1
0 7 -1 0
0 14 0 2
0 16 0 1
3
0 7 -1 0
0 14 0 8
0 16 0 1
0
end_operator
begin_operator
put-tower-on-block b1 b7 b3
4
2 0
8 7
14 0
16 0
2
4
0 2 0 1
0 7 -1 0
0 14 0 3
0 16 0 1
3
0 7 -1 0
0 14 0 8
0 16 0 1
0
end_operator
begin_operator
put-tower-on-block b1 b7 b4
4
3 0
8 7
14 0
16 0
2
4
0 3 0 1
0 7 -1 0
0 14 0 4
0 16 0 1
3
0 7 -1 0
0 14 0 8
0 16 0 1
0
end_operator
begin_operator
put-tower-on-block b1 b7 b5
4
4 0
8 7
14 0
16 0
2
4
0 4 0 1
0 7 -1 0
0 14 0 5
0 16 0 1
3
0 7 -1 0
0 14 0 8
0 16 0 1
0
end_operator
begin_operator
put-tower-on-block b1 b7 b6
4
5 0
8 7
14 0
16 0
2
4
0 5 0 1
0 7 -1 0
0 14 0 6
0 16 0 1
3
0 7 -1 0
0 14 0 8
0 16 0 1
0
end_operator
begin_operator
put-tower-on-block b1 b7 b7
4
6 0
8 7
14 0
16 0
2
4
0 6 0 1
0 7 -1 0
0 14 0 7
0 16 0 1
3
0 7 -1 0
0 14 0 8
0 16 0 1
0
end_operator
begin_operator
put-tower-on-block b2 b1 b1
4
0 0
8 0
9 1
16 0
2
4
0 0 0 1
0 7 -1 0
0 8 0 1
0 16 0 1
3
0 7 -1 0
0 8 0 8
0 16 0 1
0
end_operator
begin_operator
put-tower-on-block b2 b1 b2
4
1 0
8 0
9 1
16 0
2
4
0 1 0 1
0 7 -1 0
0 8 0 2
0 16 0 1
3
0 7 -1 0
0 8 0 8
0 16 0 1
0
end_operator
begin_operator
put-tower-on-block b2 b1 b3
4
2 0
8 0
9 1
16 0
2
4
0 2 0 1
0 7 -1 0
0 8 0 3
0 16 0 1
3
0 7 -1 0
0 8 0 8
0 16 0 1
0
end_operator
begin_operator
put-tower-on-block b2 b1 b4
4
3 0
8 0
9 1
16 0
2
4
0 3 0 1
0 7 -1 0
0 8 0 4
0 16 0 1
3
0 7 -1 0
0 8 0 8
0 16 0 1
0
end_operator
begin_operator
put-tower-on-block b2 b1 b5
4
4 0
8 0
9 1
16 0
2
4
0 4 0 1
0 7 -1 0
0 8 0 5
0 16 0 1
3
0 7 -1 0
0 8 0 8
0 16 0 1
0
end_operator
begin_operator
put-tower-on-block b2 b1 b6
4
5 0
8 0
9 1
16 0
2
4
0 5 0 1
0 7 -1 0
0 8 0 6
0 16 0 1
3
0 7 -1 0
0 8 0 8
0 16 0 1
0
end_operator
begin_operator
put-tower-on-block b2 b1 b7
4
6 0
8 0
9 1
16 0
2
4
0 6 0 1
0 7 -1 0
0 8 0 7
0 16 0 1
3
0 7 -1 0
0 8 0 8
0 16 0 1
0
end_operator
begin_operator
put-tower-on-block b2 b3 b1
4
0 0
9 3
10 0
16 0
2
4
0 0 0 1
0 7 -1 0
0 10 0 1
0 16 0 1
3
0 7 -1 0
0 10 0 8
0 16 0 1
0
end_operator
begin_operator
put-tower-on-block b2 b3 b2
4
1 0
9 3
10 0
16 0
2
4
0 1 0 1
0 7 -1 0
0 10 0 2
0 16 0 1
3
0 7 -1 0
0 10 0 8
0 16 0 1
0
end_operator
begin_operator
put-tower-on-block b2 b3 b3
4
2 0
9 3
10 0
16 0
2
4
0 2 0 1
0 7 -1 0
0 10 0 3
0 16 0 1
3
0 7 -1 0
0 10 0 8
0 16 0 1
0
end_operator
begin_operator
put-tower-on-block b2 b3 b4
4
3 0
9 3
10 0
16 0
2
4
0 3 0 1
0 7 -1 0
0 10 0 4
0 16 0 1
3
0 7 -1 0
0 10 0 8
0 16 0 1
0
end_operator
begin_operator
put-tower-on-block b2 b3 b5
4
4 0
9 3
10 0
16 0
2
4
0 4 0 1
0 7 -1 0
0 10 0 5
0 16 0 1
3
0 7 -1 0
0 10 0 8
0 16 0 1
0
end_operator
begin_operator
put-tower-on-block b2 b3 b6
4
5 0
9 3
10 0
16 0
2
4
0 5 0 1
0 7 -1 0
0 10 0 6
0 16 0 1
3
0 7 -1 0
0 10 0 8
0 16 0 1
0
end_operator
begin_operator
put-tower-on-block b2 b3 b7
4
6 0
9 3
10 0
16 0
2
4
0 6 0 1
0 7 -1 0
0 10 0 7
0 16 0 1
3
0 7 -1 0
0 10 0 8
0 16 0 1
0
end_operator
begin_operator
put-tower-on-block b2 b4 b1
4
0 0
9 4
11 0
16 0
2
4
0 0 0 1
0 7 -1 0
0 11 0 1
0 16 0 1
3
0 7 -1 0
0 11 0 8
0 16 0 1
0
end_operator
begin_operator
put-tower-on-block b2 b4 b2
4
1 0
9 4
11 0
16 0
2
4
0 1 0 1
0 7 -1 0
0 11 0 2
0 16 0 1
3
0 7 -1 0
0 11 0 8
0 16 0 1
0
end_operator
begin_operator
put-tower-on-block b2 b4 b3
4
2 0
9 4
11 0
16 0
2
4
0 2 0 1
0 7 -1 0
0 11 0 3
0 16 0 1
3
0 7 -1 0
0 11 0 8
0 16 0 1
0
end_operator
begin_operator
put-tower-on-block b2 b4 b4
4
3 0
9 4
11 0
16 0
2
4
0 3 0 1
0 7 -1 0
0 11 0 4
0 16 0 1
3
0 7 -1 0
0 11 0 8
0 16 0 1
0
end_operator
begin_operator
put-tower-on-block b2 b4 b5
4
4 0
9 4
11 0
16 0
2
4
0 4 0 1
0 7 -1 0
0 11 0 5
0 16 0 1
3
0 7 -1 0
0 11 0 8
0 16 0 1
0
end_operator
begin_operator
put-tower-on-block b2 b4 b6
4
5 0
9 4
11 0
16 0
2
4
0 5 0 1
0 7 -1 0
0 11 0 6
0 16 0 1
3
0 7 -1 0
0 11 0 8
0 16 0 1
0
end_operator
begin_operator
put-tower-on-block b2 b4 b7
4
6 0
9 4
11 0
16 0
2
4
0 6 0 1
0 7 -1 0
0 11 0 7
0 16 0 1
3
0 7 -1 0
0 11 0 8
0 16 0 1
0
end_operator
begin_operator
put-tower-on-block b2 b5 b1
4
0 0
9 5
12 0
16 0
2
4
0 0 0 1
0 7 -1 0
0 12 0 1
0 16 0 1
3
0 7 -1 0
0 12 0 8
0 16 0 1
0
end_operator
begin_operator
put-tower-on-block b2 b5 b2
4
1 0
9 5
12 0
16 0
2
4
0 1 0 1
0 7 -1 0
0 12 0 2
0 16 0 1
3
0 7 -1 0
0 12 0 8
0 16 0 1
0
end_operator
begin_operator
put-tower-on-block b2 b5 b3
4
2 0
9 5
12 0
16 0
2
4
0 2 0 1
0 7 -1 0
0 12 0 3
0 16 0 1
3
0 7 -1 0
0 12 0 8
0 16 0 1
0
end_operator
begin_operator
put-tower-on-block b2 b5 b4
4
3 0
9 5
12 0
16 0
2
4
0 3 0 1
0 7 -1 0
0 12 0 4
0 16 0 1
3
0 7 -1 0
0 12 0 8
0 16 0 1
0
end_operator
begin_operator
put-tower-on-block b2 b5 b5
4
4 0
9 5
12 0
16 0
2
4
0 4 0 1
0 7 -1 0
0 12 0 5
0 16 0 1
3
0 7 -1 0
0 12 0 8
0 16 0 1
0
end_operator
begin_operator
put-tower-on-block b2 b5 b6
4
5 0
9 5
12 0
16 0
2
4
0 5 0 1
0 7 -1 0
0 12 0 6
0 16 0 1
3
0 7 -1 0
0 12 0 8
0 16 0 1
0
end_operator
begin_operator
put-tower-on-block b2 b5 b7
4
6 0
9 5
12 0
16 0
2
4
0 6 0 1
0 7 -1 0
0 12 0 7
0 16 0 1
3
0 7 -1 0
0 12 0 8
0 16 0 1
0
end_operator
begin_operator
put-tower-on-block b2 b6 b1
4
0 0
9 6
13 0
16 0
2
4
0 0 0 1
0 7 -1 0
0 13 0 1
0 16 0 1
3
0 7 -1 0
0 13 0 8
0 16 0 1
0
end_operator
begin_operator
put-tower-on-block b2 b6 b2
4
1 0
9 6
13 0
16 0
2
4
0 1 0 1
0 7 -1 0
0 13 0 2
0 16 0 1
3
0 7 -1 0
0 13 0 8
0 16 0 1
0
end_operator
begin_operator
put-tower-on-block b2 b6 b3
4
2 0
9 6
13 0
16 0
2
4
0 2 0 1
0 7 -1 0
0 13 0 3
0 16 0 1
3
0 7 -1 0
0 13 0 8
0 16 0 1
0
end_operator
begin_operator
put-tower-on-block b2 b6 b4
4
3 0
9 6
13 0
16 0
2
4
0 3 0 1
0 7 -1 0
0 13 0 4
0 16 0 1
3
0 7 -1 0
0 13 0 8
0 16 0 1
0
end_operator
begin_operator
put-tower-on-block b2 b6 b5
4
4 0
9 6
13 0
16 0
2
4
0 4 0 1
0 7 -1 0
0 13 0 5
0 16 0 1
3
0 7 -1 0
0 13 0 8
0 16 0 1
0
end_operator
begin_operator
put-tower-on-block b2 b6 b6
4
5 0
9 6
13 0
16 0
2
4
0 5 0 1
0 7 -1 0
0 13 0 6
0 16 0 1
3
0 7 -1 0
0 13 0 8
0 16 0 1
0
end_operator
begin_operator
put-tower-on-block b2 b6 b7
4
6 0
9 6
13 0
16 0
2
4
0 6 0 1
0 7 -1 0
0 13 0 7
0 16 0 1
3
0 7 -1 0
0 13 0 8
0 16 0 1
0
end_operator
begin_operator
put-tower-on-block b2 b7 b1
4
0 0
9 7
14 0
16 0
2
4
0 0 0 1
0 7 -1 0
0 14 0 1
0 16 0 1
3
0 7 -1 0
0 14 0 8
0 16 0 1
0
end_operator
begin_operator
put-tower-on-block b2 b7 b2
4
1 0
9 7
14 0
16 0
2
4
0 1 0 1
0 7 -1 0
0 14 0 2
0 16 0 1
3
0 7 -1 0
0 14 0 8
0 16 0 1
0
end_operator
begin_operator
put-tower-on-block b2 b7 b3
4
2 0
9 7
14 0
16 0
2
4
0 2 0 1
0 7 -1 0
0 14 0 3
0 16 0 1
3
0 7 -1 0
0 14 0 8
0 16 0 1
0
end_operator
begin_operator
put-tower-on-block b2 b7 b4
4
3 0
9 7
14 0
16 0
2
4
0 3 0 1
0 7 -1 0
0 14 0 4
0 16 0 1
3
0 7 -1 0
0 14 0 8
0 16 0 1
0
end_operator
begin_operator
put-tower-on-block b2 b7 b5
4
4 0
9 7
14 0
16 0
2
4
0 4 0 1
0 7 -1 0
0 14 0 5
0 16 0 1
3
0 7 -1 0
0 14 0 8
0 16 0 1
0
end_operator
begin_operator
put-tower-on-block b2 b7 b6
4
5 0
9 7
14 0
16 0
2
4
0 5 0 1
0 7 -1 0
0 14 0 6
0 16 0 1
3
0 7 -1 0
0 14 0 8
0 16 0 1
0
end_operator
begin_operator
put-tower-on-block b2 b7 b7
4
6 0
9 7
14 0
16 0
2
4
0 6 0 1
0 7 -1 0
0 14 0 7
0 16 0 1
3
0 7 -1 0
0 14 0 8
0 16 0 1
0
end_operator
begin_operator
put-tower-on-block b3 b1 b1
4
0 0
8 0
10 1
16 0
2
4
0 0 0 1
0 7 -1 0
0 8 0 1
0 16 0 1
3
0 7 -1 0
0 8 0 8
0 16 0 1
0
end_operator
begin_operator
put-tower-on-block b3 b1 b2
4
1 0
8 0
10 1
16 0
2
4
0 1 0 1
0 7 -1 0
0 8 0 2
0 16 0 1
3
0 7 -1 0
0 8 0 8
0 16 0 1
0
end_operator
begin_operator
put-tower-on-block b3 b1 b3
4
2 0
8 0
10 1
16 0
2
4
0 2 0 1
0 7 -1 0
0 8 0 3
0 16 0 1
3
0 7 -1 0
0 8 0 8
0 16 0 1
0
end_operator
begin_operator
put-tower-on-block b3 b1 b4
4
3 0
8 0
10 1
16 0
2
4
0 3 0 1
0 7 -1 0
0 8 0 4
0 16 0 1
3
0 7 -1 0
0 8 0 8
0 16 0 1
0
end_operator
begin_operator
put-tower-on-block b3 b1 b5
4
4 0
8 0
10 1
16 0
2
4
0 4 0 1
0 7 -1 0
0 8 0 5
0 16 0 1
3
0 7 -1 0
0 8 0 8
0 16 0 1
0
end_operator
begin_operator
put-tower-on-block b3 b1 b6
4
5 0
8 0
10 1
16 0
2
4
0 5 0 1
0 7 -1 0
0 8 0 6
0 16 0 1
3
0 7 -1 0
0 8 0 8
0 16 0 1
0
end_operator
begin_operator
put-tower-on-block b3 b1 b7
4
6 0
8 0
10 1
16 0
2
4
0 6 0 1
0 7 -1 0
0 8 0 7
0 16 0 1
3
0 7 -1 0
0 8 0 8
0 16 0 1
0
end_operator
begin_operator
put-tower-on-block b3 b2 b1
4
0 0
9 0
10 2
16 0
2
4
0 0 0 1
0 7 -1 0
0 9 0 1
0 16 0 1
3
0 7 -1 0
0 9 0 8
0 16 0 1
0
end_operator
begin_operator
put-tower-on-block b3 b2 b2
4
1 0
9 0
10 2
16 0
2
4
0 1 0 1
0 7 -1 0
0 9 0 2
0 16 0 1
3
0 7 -1 0
0 9 0 8
0 16 0 1
0
end_operator
begin_operator
put-tower-on-block b3 b2 b3
4
2 0
9 0
10 2
16 0
2
4
0 2 0 1
0 7 -1 0
0 9 0 3
0 16 0 1
3
0 7 -1 0
0 9 0 8
0 16 0 1
0
end_operator
begin_operator
put-tower-on-block b3 b2 b4
4
3 0
9 0
10 2
16 0
2
4
0 3 0 1
0 7 -1 0
0 9 0 4
0 16 0 1
3
0 7 -1 0
0 9 0 8
0 16 0 1
0
end_operator
begin_operator
put-tower-on-block b3 b2 b5
4
4 0
9 0
10 2
16 0
2
4
0 4 0 1
0 7 -1 0
0 9 0 5
0 16 0 1
3
0 7 -1 0
0 9 0 8
0 16 0 1
0
end_operator
begin_operator
put-tower-on-block b3 b2 b6
4
5 0
9 0
10 2
16 0
2
4
0 5 0 1
0 7 -1 0
0 9 0 6
0 16 0 1
3
0 7 -1 0
0 9 0 8
0 16 0 1
0
end_operator
begin_operator
put-tower-on-block b3 b2 b7
4
6 0
9 0
10 2
16 0
2
4
0 6 0 1
0 7 -1 0
0 9 0 7
0 16 0 1
3
0 7 -1 0
0 9 0 8
0 16 0 1
0
end_operator
begin_operator
put-tower-on-block b3 b4 b1
4
0 0
10 4
11 0
16 0
2
4
0 0 0 1
0 7 -1 0
0 11 0 1
0 16 0 1
3
0 7 -1 0
0 11 0 8
0 16 0 1
0
end_operator
begin_operator
put-tower-on-block b3 b4 b2
4
1 0
10 4
11 0
16 0
2
4
0 1 0 1
0 7 -1 0
0 11 0 2
0 16 0 1
3
0 7 -1 0
0 11 0 8
0 16 0 1
0
end_operator
begin_operator
put-tower-on-block b3 b4 b3
4
2 0
10 4
11 0
16 0
2
4
0 2 0 1
0 7 -1 0
0 11 0 3
0 16 0 1
3
0 7 -1 0
0 11 0 8
0 16 0 1
0
end_operator
begin_operator
put-tower-on-block b3 b4 b4
4
3 0
10 4
11 0
16 0
2
4
0 3 0 1
0 7 -1 0
0 11 0 4
0 16 0 1
3
0 7 -1 0
0 11 0 8
0 16 0 1
0
end_operator
begin_operator
put-tower-on-block b3 b4 b5
4
4 0
10 4
11 0
16 0
2
4
0 4 0 1
0 7 -1 0
0 11 0 5
0 16 0 1
3
0 7 -1 0
0 11 0 8
0 16 0 1
0
end_operator
begin_operator
put-tower-on-block b3 b4 b6
4
5 0
10 4
11 0
16 0
2
4
0 5 0 1
0 7 -1 0
0 11 0 6
0 16 0 1
3
0 7 -1 0
0 11 0 8
0 16 0 1
0
end_operator
begin_operator
put-tower-on-block b3 b4 b7
4
6 0
10 4
11 0
16 0
2
4
0 6 0 1
0 7 -1 0
0 11 0 7
0 16 0 1
3
0 7 -1 0
0 11 0 8
0 16 0 1
0
end_operator
begin_operator
put-tower-on-block b3 b5 b1
4
0 0
10 5
12 0
16 0
2
4
0 0 0 1
0 7 -1 0
0 12 0 1
0 16 0 1
3
0 7 -1 0
0 12 0 8
0 16 0 1
0
end_operator
begin_operator
put-tower-on-block b3 b5 b2
4
1 0
10 5
12 0
16 0
2
4
0 1 0 1
0 7 -1 0
0 12 0 2
0 16 0 1
3
0 7 -1 0
0 12 0 8
0 16 0 1
0
end_operator
begin_operator
put-tower-on-block b3 b5 b3
4
2 0
10 5
12 0
16 0
2
4
0 2 0 1
0 7 -1 0
0 12 0 3
0 16 0 1
3
0 7 -1 0
0 12 0 8
0 16 0 1
0
end_operator
begin_operator
put-tower-on-block b3 b5 b4
4
3 0
10 5
12 0
16 0
2
4
0 3 0 1
0 7 -1 0
0 12 0 4
0 16 0 1
3
0 7 -1 0
0 12 0 8
0 16 0 1
0
end_operator
begin_operator
put-tower-on-block b3 b5 b5
4
4 0
10 5
12 0
16 0
2
4
0 4 0 1
0 7 -1 0
0 12 0 5
0 16 0 1
3
0 7 -1 0
0 12 0 8
0 16 0 1
0
end_operator
begin_operator
put-tower-on-block b3 b5 b6
4
5 0
10 5
12 0
16 0
2
4
0 5 0 1
0 7 -1 0
0 12 0 6
0 16 0 1
3
0 7 -1 0
0 12 0 8
0 16 0 1
0
end_operator
begin_operator
put-tower-on-block b3 b5 b7
4
6 0
10 5
12 0
16 0
2
4
0 6 0 1
0 7 -1 0
0 12 0 7
0 16 0 1
3
0 7 -1 0
0 12 0 8
0 16 0 1
0
end_operator
begin_operator
put-tower-on-block b3 b6 b1
4
0 0
10 6
13 0
16 0
2
4
0 0 0 1
0 7 -1 0
0 13 0 1
0 16 0 1
3
0 7 -1 0
0 13 0 8
0 16 0 1
0
end_operator
begin_operator
put-tower-on-block b3 b6 b2
4
1 0
10 6
13 0
16 0
2
4
0 1 0 1
0 7 -1 0
0 13 0 2
0 16 0 1
3
0 7 -1 0
0 13 0 8
0 16 0 1
0
end_operator
begin_operator
put-tower-on-block b3 b6 b3
4
2 0
10 6
13 0
16 0
2
4
0 2 0 1
0 7 -1 0
0 13 0 3
0 16 0 1
3
0 7 -1 0
0 13 0 8
0 16 0 1
0
end_operator
begin_operator
put-tower-on-block b3 b6 b4
4
3 0
10 6
13 0
16 0
2
4
0 3 0 1
0 7 -1 0
0 13 0 4
0 16 0 1
3
0 7 -1 0
0 13 0 8
0 16 0 1
0
end_operator
begin_operator
put-tower-on-block b3 b6 b5
4
4 0
10 6
13 0
16 0
2
4
0 4 0 1
0 7 -1 0
0 13 0 5
0 16 0 1
3
0 7 -1 0
0 13 0 8
0 16 0 1
0
end_operator
begin_operator
put-tower-on-block b3 b6 b6
4
5 0
10 6
13 0
16 0
2
4
0 5 0 1
0 7 -1 0
0 13 0 6
0 16 0 1
3
0 7 -1 0
0 13 0 8
0 16 0 1
0
end_operator
begin_operator
put-tower-on-block b3 b6 b7
4
6 0
10 6
13 0
16 0
2
4
0 6 0 1
0 7 -1 0
0 13 0 7
0 16 0 1
3
0 7 -1 0
0 13 0 8
0 16 0 1
0
end_operator
begin_operator
put-tower-on-block b3 b7 b1
4
0 0
10 7
14 0
16 0
2
4
0 0 0 1
0 7 -1 0
0 14 0 1
0 16 0 1
3
0 7 -1 0
0 14 0 8
0 16 0 1
0
end_operator
begin_operator
put-tower-on-block b3 b7 b2
4
1 0
10 7
14 0
16 0
2
4
0 1 0 1
0 7 -1 0
0 14 0 2
0 16 0 1
3
0 7 -1 0
0 14 0 8
0 16 0 1
0
end_operator
begin_operator
put-tower-on-block b3 b7 b3
4
2 0
10 7
14 0
16 0
2
4
0 2 0 1
0 7 -1 0
0 14 0 3
0 16 0 1
3
0 7 -1 0
0 14 0 8
0 16 0 1
0
end_operator
begin_operator
put-tower-on-block b3 b7 b4
4
3 0
10 7
14 0
16 0
2
4
0 3 0 1
0 7 -1 0
0 14 0 4
0 16 0 1
3
0 7 -1 0
0 14 0 8
0 16 0 1
0
end_operator
begin_operator
put-tower-on-block b3 b7 b5
4
4 0
10 7
14 0
16 0
2
4
0 4 0 1
0 7 -1 0
0 14 0 5
0 16 0 1
3
0 7 -1 0
0 14 0 8
0 16 0 1
0
end_operator
begin_operator
put-tower-on-block b3 b7 b6
4
5 0
10 7
14 0
16 0
2
4
0 5 0 1
0 7 -1 0
0 14 0 6
0 16 0 1
3
0 7 -1 0
0 14 0 8
0 16 0 1
0
end_operator
begin_operator
put-tower-on-block b3 b7 b7
4
6 0
10 7
14 0
16 0
2
4
0 6 0 1
0 7 -1 0
0 14 0 7
0 16 0 1
3
0 7 -1 0
0 14 0 8
0 16 0 1
0
end_operator
begin_operator
put-tower-on-block b4 b1 b1
4
0 0
8 0
11 1
16 0
2
4
0 0 0 1
0 7 -1 0
0 8 0 1
0 16 0 1
3
0 7 -1 0
0 8 0 8
0 16 0 1
0
end_operator
begin_operator
put-tower-on-block b4 b1 b2
4
1 0
8 0
11 1
16 0
2
4
0 1 0 1
0 7 -1 0
0 8 0 2
0 16 0 1
3
0 7 -1 0
0 8 0 8
0 16 0 1
0
end_operator
begin_operator
put-tower-on-block b4 b1 b3
4
2 0
8 0
11 1
16 0
2
4
0 2 0 1
0 7 -1 0
0 8 0 3
0 16 0 1
3
0 7 -1 0
0 8 0 8
0 16 0 1
0
end_operator
begin_operator
put-tower-on-block b4 b1 b4
4
3 0
8 0
11 1
16 0
2
4
0 3 0 1
0 7 -1 0
0 8 0 4
0 16 0 1
3
0 7 -1 0
0 8 0 8
0 16 0 1
0
end_operator
begin_operator
put-tower-on-block b4 b1 b5
4
4 0
8 0
11 1
16 0
2
4
0 4 0 1
0 7 -1 0
0 8 0 5
0 16 0 1
3
0 7 -1 0
0 8 0 8
0 16 0 1
0
end_operator
begin_operator
put-tower-on-block b4 b1 b6
4
5 0
8 0
11 1
16 0
2
4
0 5 0 1
0 7 -1 0
0 8 0 6
0 16 0 1
3
0 7 -1 0
0 8 0 8
0 16 0 1
0
end_operator
begin_operator
put-tower-on-block b4 b1 b7
4
6 0
8 0
11 1
16 0
2
4
0 6 0 1
0 7 -1 0
0 8 0 7
0 16 0 1
3
0 7 -1 0
0 8 0 8
0 16 0 1
0
end_operator
begin_operator
put-tower-on-block b4 b2 b1
4
0 0
9 0
11 2
16 0
2
4
0 0 0 1
0 7 -1 0
0 9 0 1
0 16 0 1
3
0 7 -1 0
0 9 0 8
0 16 0 1
0
end_operator
begin_operator
put-tower-on-block b4 b2 b2
4
1 0
9 0
11 2
16 0
2
4
0 1 0 1
0 7 -1 0
0 9 0 2
0 16 0 1
3
0 7 -1 0
0 9 0 8
0 16 0 1
0
end_operator
begin_operator
put-tower-on-block b4 b2 b3
4
2 0
9 0
11 2
16 0
2
4
0 2 0 1
0 7 -1 0
0 9 0 3
0 16 0 1
3
0 7 -1 0
0 9 0 8
0 16 0 1
0
end_operator
begin_operator
put-tower-on-block b4 b2 b4
4
3 0
9 0
11 2
16 0
2
4
0 3 0 1
0 7 -1 0
0 9 0 4
0 16 0 1
3
0 7 -1 0
0 9 0 8
0 16 0 1
0
end_operator
begin_operator
put-tower-on-block b4 b2 b5
4
4 0
9 0
11 2
16 0
2
4
0 4 0 1
0 7 -1 0
0 9 0 5
0 16 0 1
3
0 7 -1 0
0 9 0 8
0 16 0 1
0
end_operator
begin_operator
put-tower-on-block b4 b2 b6
4
5 0
9 0
11 2
16 0
2
4
0 5 0 1
0 7 -1 0
0 9 0 6
0 16 0 1
3
0 7 -1 0
0 9 0 8
0 16 0 1
0
end_operator
begin_operator
put-tower-on-block b4 b2 b7
4
6 0
9 0
11 2
16 0
2
4
0 6 0 1
0 7 -1 0
0 9 0 7
0 16 0 1
3
0 7 -1 0
0 9 0 8
0 16 0 1
0
end_operator
begin_operator
put-tower-on-block b4 b3 b1
4
0 0
10 0
11 3
16 0
2
4
0 0 0 1
0 7 -1 0
0 10 0 1
0 16 0 1
3
0 7 -1 0
0 10 0 8
0 16 0 1
0
end_operator
begin_operator
put-tower-on-block b4 b3 b2
4
1 0
10 0
11 3
16 0
2
4
0 1 0 1
0 7 -1 0
0 10 0 2
0 16 0 1
3
0 7 -1 0
0 10 0 8
0 16 0 1
0
end_operator
begin_operator
put-tower-on-block b4 b3 b3
4
2 0
10 0
11 3
16 0
2
4
0 2 0 1
0 7 -1 0
0 10 0 3
0 16 0 1
3
0 7 -1 0
0 10 0 8
0 16 0 1
0
end_operator
begin_operator
put-tower-on-block b4 b3 b4
4
3 0
10 0
11 3
16 0
2
4
0 3 0 1
0 7 -1 0
0 10 0 4
0 16 0 1
3
0 7 -1 0
0 10 0 8
0 16 0 1
0
end_operator
begin_operator
put-tower-on-block b4 b3 b5
4
4 0
10 0
11 3
16 0
2
4
0 4 0 1
0 7 -1 0
0 10 0 5
0 16 0 1
3
0 7 -1 0
0 10 0 8
0 16 0 1
0
end_operator
begin_operator
put-tower-on-block b4 b3 b6
4
5 0
10 0
11 3
16 0
2
4
0 5 0 1
0 7 -1 0
0 10 0 6
0 16 0 1
3
0 7 -1 0
0 10 0 8
0 16 0 1
0
end_operator
begin_operator
put-tower-on-block b4 b3 b7
4
6 0
10 0
11 3
16 0
2
4
0 6 0 1
0 7 -1 0
0 10 0 7
0 16 0 1
3
0 7 -1 0
0 10 0 8
0 16 0 1
0
end_operator
begin_operator
put-tower-on-block b4 b5 b1
4
0 0
11 5
12 0
16 0
2
4
0 0 0 1
0 7 -1 0
0 12 0 1
0 16 0 1
3
0 7 -1 0
0 12 0 8
0 16 0 1
0
end_operator
begin_operator
put-tower-on-block b4 b5 b2
4
1 0
11 5
12 0
16 0
2
4
0 1 0 1
0 7 -1 0
0 12 0 2
0 16 0 1
3
0 7 -1 0
0 12 0 8
0 16 0 1
0
end_operator
begin_operator
put-tower-on-block b4 b5 b3
4
2 0
11 5
12 0
16 0
2
4
0 2 0 1
0 7 -1 0
0 12 0 3
0 16 0 1
3
0 7 -1 0
0 12 0 8
0 16 0 1
0
end_operator
begin_operator
put-tower-on-block b4 b5 b4
4
3 0
11 5
12 0
16 0
2
4
0 3 0 1
0 7 -1 0
0 12 0 4
0 16 0 1
3
0 7 -1 0
0 12 0 8
0 16 0 1
0
end_operator
begin_operator
put-tower-on-block b4 b5 b5
4
4 0
11 5
12 0
16 0
2
4
0 4 0 1
0 7 -1 0
0 12 0 5
0 16 0 1
3
0 7 -1 0
0 12 0 8
0 16 0 1
0
end_operator
begin_operator
put-tower-on-block b4 b5 b6
4
5 0
11 5
12 0
16 0
2
4
0 5 0 1
0 7 -1 0
0 12 0 6
0 16 0 1
3
0 7 -1 0
0 12 0 8
0 16 0 1
0
end_operator
begin_operator
put-tower-on-block b4 b5 b7
4
6 0
11 5
12 0
16 0
2
4
0 6 0 1
0 7 -1 0
0 12 0 7
0 16 0 1
3
0 7 -1 0
0 12 0 8
0 16 0 1
0
end_operator
begin_operator
put-tower-on-block b4 b6 b1
4
0 0
11 6
13 0
16 0
2
4
0 0 0 1
0 7 -1 0
0 13 0 1
0 16 0 1
3
0 7 -1 0
0 13 0 8
0 16 0 1
0
end_operator
begin_operator
put-tower-on-block b4 b6 b2
4
1 0
11 6
13 0
16 0
2
4
0 1 0 1
0 7 -1 0
0 13 0 2
0 16 0 1
3
0 7 -1 0
0 13 0 8
0 16 0 1
0
end_operator
begin_operator
put-tower-on-block b4 b6 b3
4
2 0
11 6
13 0
16 0
2
4
0 2 0 1
0 7 -1 0
0 13 0 3
0 16 0 1
3
0 7 -1 0
0 13 0 8
0 16 0 1
0
end_operator
begin_operator
put-tower-on-block b4 b6 b4
4
3 0
11 6
13 0
16 0
2
4
0 3 0 1
0 7 -1 0
0 13 0 4
0 16 0 1
3
0 7 -1 0
0 13 0 8
0 16 0 1
0
end_operator
begin_operator
put-tower-on-block b4 b6 b5
4
4 0
11 6
13 0
16 0
2
4
0 4 0 1
0 7 -1 0
0 13 0 5
0 16 0 1
3
0 7 -1 0
0 13 0 8
0 16 0 1
0
end_operator
begin_operator
put-tower-on-block b4 b6 b6
4
5 0
11 6
13 0
16 0
2
4
0 5 0 1
0 7 -1 0
0 13 0 6
0 16 0 1
3
0 7 -1 0
0 13 0 8
0 16 0 1
0
end_operator
begin_operator
put-tower-on-block b4 b6 b7
4
6 0
11 6
13 0
16 0
2
4
0 6 0 1
0 7 -1 0
0 13 0 7
0 16 0 1
3
0 7 -1 0
0 13 0 8
0 16 0 1
0
end_operator
begin_operator
put-tower-on-block b4 b7 b1
4
0 0
11 7
14 0
16 0
2
4
0 0 0 1
0 7 -1 0
0 14 0 1
0 16 0 1
3
0 7 -1 0
0 14 0 8
0 16 0 1
0
end_operator
begin_operator
put-tower-on-block b4 b7 b2
4
1 0
11 7
14 0
16 0
2
4
0 1 0 1
0 7 -1 0
0 14 0 2
0 16 0 1
3
0 7 -1 0
0 14 0 8
0 16 0 1
0
end_operator
begin_operator
put-tower-on-block b4 b7 b3
4
2 0
11 7
14 0
16 0
2
4
0 2 0 1
0 7 -1 0
0 14 0 3
0 16 0 1
3
0 7 -1 0
0 14 0 8
0 16 0 1
0
end_operator
begin_operator
put-tower-on-block b4 b7 b4
4
3 0
11 7
14 0
16 0
2
4
0 3 0 1
0 7 -1 0
0 14 0 4
0 16 0 1
3
0 7 -1 0
0 14 0 8
0 16 0 1
0
end_operator
begin_operator
put-tower-on-block b4 b7 b5
4
4 0
11 7
14 0
16 0
2
4
0 4 0 1
0 7 -1 0
0 14 0 5
0 16 0 1
3
0 7 -1 0
0 14 0 8
0 16 0 1
0
end_operator
begin_operator
put-tower-on-block b4 b7 b6
4
5 0
11 7
14 0
16 0
2
4
0 5 0 1
0 7 -1 0
0 14 0 6
0 16 0 1
3
0 7 -1 0
0 14 0 8
0 16 0 1
0
end_operator
begin_operator
put-tower-on-block b4 b7 b7
4
6 0
11 7
14 0
16 0
2
4
0 6 0 1
0 7 -1 0
0 14 0 7
0 16 0 1
3
0 7 -1 0
0 14 0 8
0 16 0 1
0
end_operator
begin_operator
put-tower-on-block b5 b1 b1
4
0 0
8 0
12 1
16 0
2
4
0 0 0 1
0 7 -1 0
0 8 0 1
0 16 0 1
3
0 7 -1 0
0 8 0 8
0 16 0 1
0
end_operator
begin_operator
put-tower-on-block b5 b1 b2
4
1 0
8 0
12 1
16 0
2
4
0 1 0 1
0 7 -1 0
0 8 0 2
0 16 0 1
3
0 7 -1 0
0 8 0 8
0 16 0 1
0
end_operator
begin_operator
put-tower-on-block b5 b1 b3
4
2 0
8 0
12 1
16 0
2
4
0 2 0 1
0 7 -1 0
0 8 0 3
0 16 0 1
3
0 7 -1 0
0 8 0 8
0 16 0 1
0
end_operator
begin_operator
put-tower-on-block b5 b1 b4
4
3 0
8 0
12 1
16 0
2
4
0 3 0 1
0 7 -1 0
0 8 0 4
0 16 0 1
3
0 7 -1 0
0 8 0 8
0 16 0 1
0
end_operator
begin_operator
put-tower-on-block b5 b1 b5
4
4 0
8 0
12 1
16 0
2
4
0 4 0 1
0 7 -1 0
0 8 0 5
0 16 0 1
3
0 7 -1 0
0 8 0 8
0 16 0 1
0
end_operator
begin_operator
put-tower-on-block b5 b1 b6
4
5 0
8 0
12 1
16 0
2
4
0 5 0 1
0 7 -1 0
0 8 0 6
0 16 0 1
3
0 7 -1 0
0 8 0 8
0 16 0 1
0
end_operator
begin_operator
put-tower-on-block b5 b1 b7
4
6 0
8 0
12 1
16 0
2
4
0 6 0 1
0 7 -1 0
0 8 0 7
0 16 0 1
3
0 7 -1 0
0 8 0 8
0 16 0 1
0
end_operator
begin_operator
put-tower-on-block b5 b2 b1
4
0 0
9 0
12 2
16 0
2
4
0 0 0 1
0 7 -1 0
0 9 0 1
0 16 0 1
3
0 7 -1 0
0 9 0 8
0 16 0 1
0
end_operator
begin_operator
put-tower-on-block b5 b2 b2
4
1 0
9 0
12 2
16 0
2
4
0 1 0 1
0 7 -1 0
0 9 0 2
0 16 0 1
3
0 7 -1 0
0 9 0 8
0 16 0 1
0
end_operator
begin_operator
put-tower-on-block b5 b2 b3
4
2 0
9 0
12 2
16 0
2
4
0 2 0 1
0 7 -1 0
0 9 0 3
0 16 0 1
3
0 7 -1 0
0 9 0 8
0 16 0 1
0
end_operator
begin_operator
put-tower-on-block b5 b2 b4
4
3 0
9 0
12 2
16 0
2
4
0 3 0 1
0 7 -1 0
0 9 0 4
0 16 0 1
3
0 7 -1 0
0 9 0 8
0 16 0 1
0
end_operator
begin_operator
put-tower-on-block b5 b2 b5
4
4 0
9 0
12 2
16 0
2
4
0 4 0 1
0 7 -1 0
0 9 0 5
0 16 0 1
3
0 7 -1 0
0 9 0 8
0 16 0 1
0
end_operator
begin_operator
put-tower-on-block b5 b2 b6
4
5 0
9 0
12 2
16 0
2
4
0 5 0 1
0 7 -1 0
0 9 0 6
0 16 0 1
3
0 7 -1 0
0 9 0 8
0 16 0 1
0
end_operator
begin_operator
put-tower-on-block b5 b2 b7
4
6 0
9 0
12 2
16 0
2
4
0 6 0 1
0 7 -1 0
0 9 0 7
0 16 0 1
3
0 7 -1 0
0 9 0 8
0 16 0 1
0
end_operator
begin_operator
put-tower-on-block b5 b3 b1
4
0 0
10 0
12 3
16 0
2
4
0 0 0 1
0 7 -1 0
0 10 0 1
0 16 0 1
3
0 7 -1 0
0 10 0 8
0 16 0 1
0
end_operator
begin_operator
put-tower-on-block b5 b3 b2
4
1 0
10 0
12 3
16 0
2
4
0 1 0 1
0 7 -1 0
0 10 0 2
0 16 0 1
3
0 7 -1 0
0 10 0 8
0 16 0 1
0
end_operator
begin_operator
put-tower-on-block b5 b3 b3
4
2 0
10 0
12 3
16 0
2
4
0 2 0 1
0 7 -1 0
0 10 0 3
0 16 0 1
3
0 7 -1 0
0 10 0 8
0 16 0 1
0
end_operator
begin_operator
put-tower-on-block b5 b3 b4
4
3 0
10 0
12 3
16 0
2
4
0 3 0 1
0 7 -1 0
0 10 0 4
0 16 0 1
3
0 7 -1 0
0 10 0 8
0 16 0 1
0
end_operator
begin_operator
put-tower-on-block b5 b3 b5
4
4 0
10 0
12 3
16 0
2
4
0 4 0 1
0 7 -1 0
0 10 0 5
0 16 0 1
3
0 7 -1 0
0 10 0 8
0 16 0 1
0
end_operator
begin_operator
put-tower-on-block b5 b3 b6
4
5 0
10 0
12 3
16 0
2
4
0 5 0 1
0 7 -1 0
0 10 0 6
0 16 0 1
3
0 7 -1 0
0 10 0 8
0 16 0 1
0
end_operator
begin_operator
put-tower-on-block b5 b3 b7
4
6 0
10 0
12 3
16 0
2
4
0 6 0 1
0 7 -1 0
0 10 0 7
0 16 0 1
3
0 7 -1 0
0 10 0 8
0 16 0 1
0
end_operator
begin_operator
put-tower-on-block b5 b4 b1
4
0 0
11 0
12 4
16 0
2
4
0 0 0 1
0 7 -1 0
0 11 0 1
0 16 0 1
3
0 7 -1 0
0 11 0 8
0 16 0 1
0
end_operator
begin_operator
put-tower-on-block b5 b4 b2
4
1 0
11 0
12 4
16 0
2
4
0 1 0 1
0 7 -1 0
0 11 0 2
0 16 0 1
3
0 7 -1 0
0 11 0 8
0 16 0 1
0
end_operator
begin_operator
put-tower-on-block b5 b4 b3
4
2 0
11 0
12 4
16 0
2
4
0 2 0 1
0 7 -1 0
0 11 0 3
0 16 0 1
3
0 7 -1 0
0 11 0 8
0 16 0 1
0
end_operator
begin_operator
put-tower-on-block b5 b4 b4
4
3 0
11 0
12 4
16 0
2
4
0 3 0 1
0 7 -1 0
0 11 0 4
0 16 0 1
3
0 7 -1 0
0 11 0 8
0 16 0 1
0
end_operator
begin_operator
put-tower-on-block b5 b4 b5
4
4 0
11 0
12 4
16 0
2
4
0 4 0 1
0 7 -1 0
0 11 0 5
0 16 0 1
3
0 7 -1 0
0 11 0 8
0 16 0 1
0
end_operator
begin_operator
put-tower-on-block b5 b4 b6
4
5 0
11 0
12 4
16 0
2
4
0 5 0 1
0 7 -1 0
0 11 0 6
0 16 0 1
3
0 7 -1 0
0 11 0 8
0 16 0 1
0
end_operator
begin_operator
put-tower-on-block b5 b4 b7
4
6 0
11 0
12 4
16 0
2
4
0 6 0 1
0 7 -1 0
0 11 0 7
0 16 0 1
3
0 7 -1 0
0 11 0 8
0 16 0 1
0
end_operator
begin_operator
put-tower-on-block b5 b6 b1
4
0 0
12 6
13 0
16 0
2
4
0 0 0 1
0 7 -1 0
0 13 0 1
0 16 0 1
3
0 7 -1 0
0 13 0 8
0 16 0 1
0
end_operator
begin_operator
put-tower-on-block b5 b6 b2
4
1 0
12 6
13 0
16 0
2
4
0 1 0 1
0 7 -1 0
0 13 0 2
0 16 0 1
3
0 7 -1 0
0 13 0 8
0 16 0 1
0
end_operator
begin_operator
put-tower-on-block b5 b6 b3
4
2 0
12 6
13 0
16 0
2
4
0 2 0 1
0 7 -1 0
0 13 0 3
0 16 0 1
3
0 7 -1 0
0 13 0 8
0 16 0 1
0
end_operator
begin_operator
put-tower-on-block b5 b6 b4
4
3 0
12 6
13 0
16 0
2
4
0 3 0 1
0 7 -1 0
0 13 0 4
0 16 0 1
3
0 7 -1 0
0 13 0 8
0 16 0 1
0
end_operator
begin_operator
put-tower-on-block b5 b6 b5
4
4 0
12 6
13 0
16 0
2
4
0 4 0 1
0 7 -1 0
0 13 0 5
0 16 0 1
3
0 7 -1 0
0 13 0 8
0 16 0 1
0
end_operator
begin_operator
put-tower-on-block b5 b6 b6
4
5 0
12 6
13 0
16 0
2
4
0 5 0 1
0 7 -1 0
0 13 0 6
0 16 0 1
3
0 7 -1 0
0 13 0 8
0 16 0 1
0
end_operator
begin_operator
put-tower-on-block b5 b6 b7
4
6 0
12 6
13 0
16 0
2
4
0 6 0 1
0 7 -1 0
0 13 0 7
0 16 0 1
3
0 7 -1 0
0 13 0 8
0 16 0 1
0
end_operator
begin_operator
put-tower-on-block b5 b7 b1
4
0 0
12 7
14 0
16 0
2
4
0 0 0 1
0 7 -1 0
0 14 0 1
0 16 0 1
3
0 7 -1 0
0 14 0 8
0 16 0 1
0
end_operator
begin_operator
put-tower-on-block b5 b7 b2
4
1 0
12 7
14 0
16 0
2
4
0 1 0 1
0 7 -1 0
0 14 0 2
0 16 0 1
3
0 7 -1 0
0 14 0 8
0 16 0 1
0
end_operator
begin_operator
put-tower-on-block b5 b7 b3
4
2 0
12 7
14 0
16 0
2
4
0 2 0 1
0 7 -1 0
0 14 0 3
0 16 0 1
3
0 7 -1 0
0 14 0 8
0 16 0 1
0
end_operator
begin_operator
put-tower-on-block b5 b7 b4
4
3 0
12 7
14 0
16 0
2
4
0 3 0 1
0 7 -1 0
0 14 0 4
0 16 0 1
3
0 7 -1 0
0 14 0 8
0 16 0 1
0
end_operator
begin_operator
put-tower-on-block b5 b7 b5
4
4 0
12 7
14 0
16 0
2
4
0 4 0 1
0 7 -1 0
0 14 0 5
0 16 0 1
3
0 7 -1 0
0 14 0 8
0 16 0 1
0
end_operator
begin_operator
put-tower-on-block b5 b7 b6
4
5 0
12 7
14 0
16 0
2
4
0 5 0 1
0 7 -1 0
0 14 0 6
0 16 0 1
3
0 7 -1 0
0 14 0 8
0 16 0 1
0
end_operator
begin_operator
put-tower-on-block b5 b7 b7
4
6 0
12 7
14 0
16 0
2
4
0 6 0 1
0 7 -1 0
0 14 0 7
0 16 0 1
3
0 7 -1 0
0 14 0 8
0 16 0 1
0
end_operator
begin_operator
put-tower-on-block b6 b1 b1
4
0 0
8 0
13 1
16 0
2
4
0 0 0 1
0 7 -1 0
0 8 0 1
0 16 0 1
3
0 7 -1 0
0 8 0 8
0 16 0 1
0
end_operator
begin_operator
put-tower-on-block b6 b1 b2
4
1 0
8 0
13 1
16 0
2
4
0 1 0 1
0 7 -1 0
0 8 0 2
0 16 0 1
3
0 7 -1 0
0 8 0 8
0 16 0 1
0
end_operator
begin_operator
put-tower-on-block b6 b1 b3
4
2 0
8 0
13 1
16 0
2
4
0 2 0 1
0 7 -1 0
0 8 0 3
0 16 0 1
3
0 7 -1 0
0 8 0 8
0 16 0 1
0
end_operator
begin_operator
put-tower-on-block b6 b1 b4
4
3 0
8 0
13 1
16 0
2
4
0 3 0 1
0 7 -1 0
0 8 0 4
0 16 0 1
3
0 7 -1 0
0 8 0 8
0 16 0 1
0
end_operator
begin_operator
put-tower-on-block b6 b1 b5
4
4 0
8 0
13 1
16 0
2
4
0 4 0 1
0 7 -1 0
0 8 0 5
0 16 0 1
3
0 7 -1 0
0 8 0 8
0 16 0 1
0
end_operator
begin_operator
put-tower-on-block b6 b1 b6
4
5 0
8 0
13 1
16 0
2
4
0 5 0 1
0 7 -1 0
0 8 0 6
0 16 0 1
3
0 7 -1 0
0 8 0 8
0 16 0 1
0
end_operator
begin_operator
put-tower-on-block b6 b1 b7
4
6 0
8 0
13 1
16 0
2
4
0 6 0 1
0 7 -1 0
0 8 0 7
0 16 0 1
3
0 7 -1 0
0 8 0 8
0 16 0 1
0
end_operator
begin_operator
put-tower-on-block b6 b2 b1
4
0 0
9 0
13 2
16 0
2
4
0 0 0 1
0 7 -1 0
0 9 0 1
0 16 0 1
3
0 7 -1 0
0 9 0 8
0 16 0 1
0
end_operator
begin_operator
put-tower-on-block b6 b2 b2
4
1 0
9 0
13 2
16 0
2
4
0 1 0 1
0 7 -1 0
0 9 0 2
0 16 0 1
3
0 7 -1 0
0 9 0 8
0 16 0 1
0
end_operator
begin_operator
put-tower-on-block b6 b2 b3
4
2 0
9 0
13 2
16 0
2
4
0 2 0 1
0 7 -1 0
0 9 0 3
0 16 0 1
3
0 7 -1 0
0 9 0 8
0 16 0 1
0
end_operator
begin_operator
put-tower-on-block b6 b2 b4
4
3 0
9 0
13 2
16 0
2
4
0 3 0 1
0 7 -1 0
0 9 0 4
0 16 0 1
3
0 7 -1 0
0 9 0 8
0 16 0 1
0
end_operator
begin_operator
put-tower-on-block b6 b2 b5
4
4 0
9 0
13 2
16 0
2
4
0 4 0 1
0 7 -1 0
0 9 0 5
0 16 0 1
3
0 7 -1 0
0 9 0 8
0 16 0 1
0
end_operator
begin_operator
put-tower-on-block b6 b2 b6
4
5 0
9 0
13 2
16 0
2
4
0 5 0 1
0 7 -1 0
0 9 0 6
0 16 0 1
3
0 7 -1 0
0 9 0 8
0 16 0 1
0
end_operator
begin_operator
put-tower-on-block b6 b2 b7
4
6 0
9 0
13 2
16 0
2
4
0 6 0 1
0 7 -1 0
0 9 0 7
0 16 0 1
3
0 7 -1 0
0 9 0 8
0 16 0 1
0
end_operator
begin_operator
put-tower-on-block b6 b3 b1
4
0 0
10 0
13 3
16 0
2
4
0 0 0 1
0 7 -1 0
0 10 0 1
0 16 0 1
3
0 7 -1 0
0 10 0 8
0 16 0 1
0
end_operator
begin_operator
put-tower-on-block b6 b3 b2
4
1 0
10 0
13 3
16 0
2
4
0 1 0 1
0 7 -1 0
0 10 0 2
0 16 0 1
3
0 7 -1 0
0 10 0 8
0 16 0 1
0
end_operator
begin_operator
put-tower-on-block b6 b3 b3
4
2 0
10 0
13 3
16 0
2
4
0 2 0 1
0 7 -1 0
0 10 0 3
0 16 0 1
3
0 7 -1 0
0 10 0 8
0 16 0 1
0
end_operator
begin_operator
put-tower-on-block b6 b3 b4
4
3 0
10 0
13 3
16 0
2
4
0 3 0 1
0 7 -1 0
0 10 0 4
0 16 0 1
3
0 7 -1 0
0 10 0 8
0 16 0 1
0
end_operator
begin_operator
put-tower-on-block b6 b3 b5
4
4 0
10 0
13 3
16 0
2
4
0 4 0 1
0 7 -1 0
0 10 0 5
0 16 0 1
3
0 7 -1 0
0 10 0 8
0 16 0 1
0
end_operator
begin_operator
put-tower-on-block b6 b3 b6
4
5 0
10 0
13 3
16 0
2
4
0 5 0 1
0 7 -1 0
0 10 0 6
0 16 0 1
3
0 7 -1 0
0 10 0 8
0 16 0 1
0
end_operator
begin_operator
put-tower-on-block b6 b3 b7
4
6 0
10 0
13 3
16 0
2
4
0 6 0 1
0 7 -1 0
0 10 0 7
0 16 0 1
3
0 7 -1 0
0 10 0 8
0 16 0 1
0
end_operator
begin_operator
put-tower-on-block b6 b4 b1
4
0 0
11 0
13 4
16 0
2
4
0 0 0 1
0 7 -1 0
0 11 0 1
0 16 0 1
3
0 7 -1 0
0 11 0 8
0 16 0 1
0
end_operator
begin_operator
put-tower-on-block b6 b4 b2
4
1 0
11 0
13 4
16 0
2
4
0 1 0 1
0 7 -1 0
0 11 0 2
0 16 0 1
3
0 7 -1 0
0 11 0 8
0 16 0 1
0
end_operator
begin_operator
put-tower-on-block b6 b4 b3
4
2 0
11 0
13 4
16 0
2
4
0 2 0 1
0 7 -1 0
0 11 0 3
0 16 0 1
3
0 7 -1 0
0 11 0 8
0 16 0 1
0
end_operator
begin_operator
put-tower-on-block b6 b4 b4
4
3 0
11 0
13 4
16 0
2
4
0 3 0 1
0 7 -1 0
0 11 0 4
0 16 0 1
3
0 7 -1 0
0 11 0 8
0 16 0 1
0
end_operator
begin_operator
put-tower-on-block b6 b4 b5
4
4 0
11 0
13 4
16 0
2
4
0 4 0 1
0 7 -1 0
0 11 0 5
0 16 0 1
3
0 7 -1 0
0 11 0 8
0 16 0 1
0
end_operator
begin_operator
put-tower-on-block b6 b4 b6
4
5 0
11 0
13 4
16 0
2
4
0 5 0 1
0 7 -1 0
0 11 0 6
0 16 0 1
3
0 7 -1 0
0 11 0 8
0 16 0 1
0
end_operator
begin_operator
put-tower-on-block b6 b4 b7
4
6 0
11 0
13 4
16 0
2
4
0 6 0 1
0 7 -1 0
0 11 0 7
0 16 0 1
3
0 7 -1 0
0 11 0 8
0 16 0 1
0
end_operator
begin_operator
put-tower-on-block b6 b5 b1
4
0 0
12 0
13 5
16 0
2
4
0 0 0 1
0 7 -1 0
0 12 0 1
0 16 0 1
3
0 7 -1 0
0 12 0 8
0 16 0 1
0
end_operator
begin_operator
put-tower-on-block b6 b5 b2
4
1 0
12 0
13 5
16 0
2
4
0 1 0 1
0 7 -1 0
0 12 0 2
0 16 0 1
3
0 7 -1 0
0 12 0 8
0 16 0 1
0
end_operator
begin_operator
put-tower-on-block b6 b5 b3
4
2 0
12 0
13 5
16 0
2
4
0 2 0 1
0 7 -1 0
0 12 0 3
0 16 0 1
3
0 7 -1 0
0 12 0 8
0 16 0 1
0
end_operator
begin_operator
put-tower-on-block b6 b5 b4
4
3 0
12 0
13 5
16 0
2
4
0 3 0 1
0 7 -1 0
0 12 0 4
0 16 0 1
3
0 7 -1 0
0 12 0 8
0 16 0 1
0
end_operator
begin_operator
put-tower-on-block b6 b5 b5
4
4 0
12 0
13 5
16 0
2
4
0 4 0 1
0 7 -1 0
0 12 0 5
0 16 0 1
3
0 7 -1 0
0 12 0 8
0 16 0 1
0
end_operator
begin_operator
put-tower-on-block b6 b5 b6
4
5 0
12 0
13 5
16 0
2
4
0 5 0 1
0 7 -1 0
0 12 0 6
0 16 0 1
3
0 7 -1 0
0 12 0 8
0 16 0 1
0
end_operator
begin_operator
put-tower-on-block b6 b5 b7
4
6 0
12 0
13 5
16 0
2
4
0 6 0 1
0 7 -1 0
0 12 0 7
0 16 0 1
3
0 7 -1 0
0 12 0 8
0 16 0 1
0
end_operator
begin_operator
put-tower-on-block b6 b7 b1
4
0 0
13 7
14 0
16 0
2
4
0 0 0 1
0 7 -1 0
0 14 0 1
0 16 0 1
3
0 7 -1 0
0 14 0 8
0 16 0 1
0
end_operator
begin_operator
put-tower-on-block b6 b7 b2
4
1 0
13 7
14 0
16 0
2
4
0 1 0 1
0 7 -1 0
0 14 0 2
0 16 0 1
3
0 7 -1 0
0 14 0 8
0 16 0 1
0
end_operator
begin_operator
put-tower-on-block b6 b7 b3
4
2 0
13 7
14 0
16 0
2
4
0 2 0 1
0 7 -1 0
0 14 0 3
0 16 0 1
3
0 7 -1 0
0 14 0 8
0 16 0 1
0
end_operator
begin_operator
put-tower-on-block b6 b7 b4
4
3 0
13 7
14 0
16 0
2
4
0 3 0 1
0 7 -1 0
0 14 0 4
0 16 0 1
3
0 7 -1 0
0 14 0 8
0 16 0 1
0
end_operator
begin_operator
put-tower-on-block b6 b7 b5
4
4 0
13 7
14 0
16 0
2
4
0 4 0 1
0 7 -1 0
0 14 0 5
0 16 0 1
3
0 7 -1 0
0 14 0 8
0 16 0 1
0
end_operator
begin_operator
put-tower-on-block b6 b7 b6
4
5 0
13 7
14 0
16 0
2
4
0 5 0 1
0 7 -1 0
0 14 0 6
0 16 0 1
3
0 7 -1 0
0 14 0 8
0 16 0 1
0
end_operator
begin_operator
put-tower-on-block b6 b7 b7
4
6 0
13 7
14 0
16 0
2
4
0 6 0 1
0 7 -1 0
0 14 0 7
0 16 0 1
3
0 7 -1 0
0 14 0 8
0 16 0 1
0
end_operator
begin_operator
put-tower-on-block b7 b1 b1
4
0 0
8 0
14 1
16 0
2
4
0 0 0 1
0 7 -1 0
0 8 0 1
0 16 0 1
3
0 7 -1 0
0 8 0 8
0 16 0 1
0
end_operator
begin_operator
put-tower-on-block b7 b1 b2
4
1 0
8 0
14 1
16 0
2
4
0 1 0 1
0 7 -1 0
0 8 0 2
0 16 0 1
3
0 7 -1 0
0 8 0 8
0 16 0 1
0
end_operator
begin_operator
put-tower-on-block b7 b1 b3
4
2 0
8 0
14 1
16 0
2
4
0 2 0 1
0 7 -1 0
0 8 0 3
0 16 0 1
3
0 7 -1 0
0 8 0 8
0 16 0 1
0
end_operator
begin_operator
put-tower-on-block b7 b1 b4
4
3 0
8 0
14 1
16 0
2
4
0 3 0 1
0 7 -1 0
0 8 0 4
0 16 0 1
3
0 7 -1 0
0 8 0 8
0 16 0 1
0
end_operator
begin_operator
put-tower-on-block b7 b1 b5
4
4 0
8 0
14 1
16 0
2
4
0 4 0 1
0 7 -1 0
0 8 0 5
0 16 0 1
3
0 7 -1 0
0 8 0 8
0 16 0 1
0
end_operator
begin_operator
put-tower-on-block b7 b1 b6
4
5 0
8 0
14 1
16 0
2
4
0 5 0 1
0 7 -1 0
0 8 0 6
0 16 0 1
3
0 7 -1 0
0 8 0 8
0 16 0 1
0
end_operator
begin_operator
put-tower-on-block b7 b1 b7
4
6 0
8 0
14 1
16 0
2
4
0 6 0 1
0 7 -1 0
0 8 0 7
0 16 0 1
3
0 7 -1 0
0 8 0 8
0 16 0 1
0
end_operator
begin_operator
put-tower-on-block b7 b2 b1
4
0 0
9 0
14 2
16 0
2
4
0 0 0 1
0 7 -1 0
0 9 0 1
0 16 0 1
3
0 7 -1 0
0 9 0 8
0 16 0 1
0
end_operator
begin_operator
put-tower-on-block b7 b2 b2
4
1 0
9 0
14 2
16 0
2
4
0 1 0 1
0 7 -1 0
0 9 0 2
0 16 0 1
3
0 7 -1 0
0 9 0 8
0 16 0 1
0
end_operator
begin_operator
put-tower-on-block b7 b2 b3
4
2 0
9 0
14 2
16 0
2
4
0 2 0 1
0 7 -1 0
0 9 0 3
0 16 0 1
3
0 7 -1 0
0 9 0 8
0 16 0 1
0
end_operator
begin_operator
put-tower-on-block b7 b2 b4
4
3 0
9 0
14 2
16 0
2
4
0 3 0 1
0 7 -1 0
0 9 0 4
0 16 0 1
3
0 7 -1 0
0 9 0 8
0 16 0 1
0
end_operator
begin_operator
put-tower-on-block b7 b2 b5
4
4 0
9 0
14 2
16 0
2
4
0 4 0 1
0 7 -1 0
0 9 0 5
0 16 0 1
3
0 7 -1 0
0 9 0 8
0 16 0 1
0
end_operator
begin_operator
put-tower-on-block b7 b2 b6
4
5 0
9 0
14 2
16 0
2
4
0 5 0 1
0 7 -1 0
0 9 0 6
0 16 0 1
3
0 7 -1 0
0 9 0 8
0 16 0 1
0
end_operator
begin_operator
put-tower-on-block b7 b2 b7
4
6 0
9 0
14 2
16 0
2
4
0 6 0 1
0 7 -1 0
0 9 0 7
0 16 0 1
3
0 7 -1 0
0 9 0 8
0 16 0 1
0
end_operator
begin_operator
put-tower-on-block b7 b3 b1
4
0 0
10 0
14 3
16 0
2
4
0 0 0 1
0 7 -1 0
0 10 0 1
0 16 0 1
3
0 7 -1 0
0 10 0 8
0 16 0 1
0
end_operator
begin_operator
put-tower-on-block b7 b3 b2
4
1 0
10 0
14 3
16 0
2
4
0 1 0 1
0 7 -1 0
0 10 0 2
0 16 0 1
3
0 7 -1 0
0 10 0 8
0 16 0 1
0
end_operator
begin_operator
put-tower-on-block b7 b3 b3
4
2 0
10 0
14 3
16 0
2
4
0 2 0 1
0 7 -1 0
0 10 0 3
0 16 0 1
3
0 7 -1 0
0 10 0 8
0 16 0 1
0
end_operator
begin_operator
put-tower-on-block b7 b3 b4
4
3 0
10 0
14 3
16 0
2
4
0 3 0 1
0 7 -1 0
0 10 0 4
0 16 0 1
3
0 7 -1 0
0 10 0 8
0 16 0 1
0
end_operator
begin_operator
put-tower-on-block b7 b3 b5
4
4 0
10 0
14 3
16 0
2
4
0 4 0 1
0 7 -1 0
0 10 0 5
0 16 0 1
3
0 7 -1 0
0 10 0 8
0 16 0 1
0
end_operator
begin_operator
put-tower-on-block b7 b3 b6
4
5 0
10 0
14 3
16 0
2
4
0 5 0 1
0 7 -1 0
0 10 0 6
0 16 0 1
3
0 7 -1 0
0 10 0 8
0 16 0 1
0
end_operator
begin_operator
put-tower-on-block b7 b3 b7
4
6 0
10 0
14 3
16 0
2
4
0 6 0 1
0 7 -1 0
0 10 0 7
0 16 0 1
3
0 7 -1 0
0 10 0 8
0 16 0 1
0
end_operator
begin_operator
put-tower-on-block b7 b4 b1
4
0 0
11 0
14 4
16 0
2
4
0 0 0 1
0 7 -1 0
0 11 0 1
0 16 0 1
3
0 7 -1 0
0 11 0 8
0 16 0 1
0
end_operator
begin_operator
put-tower-on-block b7 b4 b2
4
1 0
11 0
14 4
16 0
2
4
0 1 0 1
0 7 -1 0
0 11 0 2
0 16 0 1
3
0 7 -1 0
0 11 0 8
0 16 0 1
0
end_operator
begin_operator
put-tower-on-block b7 b4 b3
4
2 0
11 0
14 4
16 0
2
4
0 2 0 1
0 7 -1 0
0 11 0 3
0 16 0 1
3
0 7 -1 0
0 11 0 8
0 16 0 1
0
end_operator
begin_operator
put-tower-on-block b7 b4 b4
4
3 0
11 0
14 4
16 0
2
4
0 3 0 1
0 7 -1 0
0 11 0 4
0 16 0 1
3
0 7 -1 0
0 11 0 8
0 16 0 1
0
end_operator
begin_operator
put-tower-on-block b7 b4 b5
4
4 0
11 0
14 4
16 0
2
4
0 4 0 1
0 7 -1 0
0 11 0 5
0 16 0 1
3
0 7 -1 0
0 11 0 8
0 16 0 1
0
end_operator
begin_operator
put-tower-on-block b7 b4 b6
4
5 0
11 0
14 4
16 0
2
4
0 5 0 1
0 7 -1 0
0 11 0 6
0 16 0 1
3
0 7 -1 0
0 11 0 8
0 16 0 1
0
end_operator
begin_operator
put-tower-on-block b7 b4 b7
4
6 0
11 0
14 4
16 0
2
4
0 6 0 1
0 7 -1 0
0 11 0 7
0 16 0 1
3
0 7 -1 0
0 11 0 8
0 16 0 1
0
end_operator
begin_operator
put-tower-on-block b7 b5 b1
4
0 0
12 0
14 5
16 0
2
4
0 0 0 1
0 7 -1 0
0 12 0 1
0 16 0 1
3
0 7 -1 0
0 12 0 8
0 16 0 1
0
end_operator
begin_operator
put-tower-on-block b7 b5 b2
4
1 0
12 0
14 5
16 0
2
4
0 1 0 1
0 7 -1 0
0 12 0 2
0 16 0 1
3
0 7 -1 0
0 12 0 8
0 16 0 1
0
end_operator
begin_operator
put-tower-on-block b7 b5 b3
4
2 0
12 0
14 5
16 0
2
4
0 2 0 1
0 7 -1 0
0 12 0 3
0 16 0 1
3
0 7 -1 0
0 12 0 8
0 16 0 1
0
end_operator
begin_operator
put-tower-on-block b7 b5 b4
4
3 0
12 0
14 5
16 0
2
4
0 3 0 1
0 7 -1 0
0 12 0 4
0 16 0 1
3
0 7 -1 0
0 12 0 8
0 16 0 1
0
end_operator
begin_operator
put-tower-on-block b7 b5 b5
4
4 0
12 0
14 5
16 0
2
4
0 4 0 1
0 7 -1 0
0 12 0 5
0 16 0 1
3
0 7 -1 0
0 12 0 8
0 16 0 1
0
end_operator
begin_operator
put-tower-on-block b7 b5 b6
4
5 0
12 0
14 5
16 0
2
4
0 5 0 1
0 7 -1 0
0 12 0 6
0 16 0 1
3
0 7 -1 0
0 12 0 8
0 16 0 1
0
end_operator
begin_operator
put-tower-on-block b7 b5 b7
4
6 0
12 0
14 5
16 0
2
4
0 6 0 1
0 7 -1 0
0 12 0 7
0 16 0 1
3
0 7 -1 0
0 12 0 8
0 16 0 1
0
end_operator
begin_operator
put-tower-on-block b7 b6 b1
4
0 0
13 0
14 6
16 0
2
4
0 0 0 1
0 7 -1 0
0 13 0 1
0 16 0 1
3
0 7 -1 0
0 13 0 8
0 16 0 1
0
end_operator
begin_operator
put-tower-on-block b7 b6 b2
4
1 0
13 0
14 6
16 0
2
4
0 1 0 1
0 7 -1 0
0 13 0 2
0 16 0 1
3
0 7 -1 0
0 13 0 8
0 16 0 1
0
end_operator
begin_operator
put-tower-on-block b7 b6 b3
4
2 0
13 0
14 6
16 0
2
4
0 2 0 1
0 7 -1 0
0 13 0 3
0 16 0 1
3
0 7 -1 0
0 13 0 8
0 16 0 1
0
end_operator
begin_operator
put-tower-on-block b7 b6 b4
4
3 0
13 0
14 6
16 0
2
4
0 3 0 1
0 7 -1 0
0 13 0 4
0 16 0 1
3
0 7 -1 0
0 13 0 8
0 16 0 1
0
end_operator
begin_operator
put-tower-on-block b7 b6 b5
4
4 0
13 0
14 6
16 0
2
4
0 4 0 1
0 7 -1 0
0 13 0 5
0 16 0 1
3
0 7 -1 0
0 13 0 8
0 16 0 1
0
end_operator
begin_operator
put-tower-on-block b7 b6 b6
4
5 0
13 0
14 6
16 0
2
4
0 5 0 1
0 7 -1 0
0 13 0 6
0 16 0 1
3
0 7 -1 0
0 13 0 8
0 16 0 1
0
end_operator
begin_operator
put-tower-on-block b7 b6 b7
4
6 0
13 0
14 6
16 0
2
4
0 6 0 1
0 7 -1 0
0 13 0 7
0 16 0 1
3
0 7 -1 0
0 13 0 8
0 16 0 1
0
end_operator
begin_operator
trans-0 b1 b2 b3
3
9 0
15 0
16 1
1
1
0 16 1 0
0
end_operator
begin_operator
trans-0 b1 b2 b3
3
9 1
15 0
16 1
1
1
0 16 1 0
0
end_operator
begin_operator
trans-0 b1 b2 b3
3
9 2
15 0
16 1
1
1
0 16 1 0
0
end_operator
begin_operator
trans-0 b1 b2 b3
3
9 4
15 0
16 1
1
1
0 16 1 0
0
end_operator
begin_operator
trans-0 b1 b2 b3
3
9 5
15 0
16 1
1
1
0 16 1 0
0
end_operator
begin_operator
trans-0 b1 b2 b3
3
9 6
15 0
16 1
1
1
0 16 1 0
0
end_operator
begin_operator
trans-0 b1 b2 b3
3
9 7
15 0
16 1
1
1
0 16 1 0
0
end_operator
begin_operator
trans-0 b1 b2 b3
3
9 8
15 0
16 1
1
1
0 16 1 0
0
end_operator
begin_operator
trans-1 b1 b2 b3
3
8 0
15 1
16 1
1
1
0 16 1 0
0
end_operator
begin_operator
trans-1 b1 b2 b3
3
8 1
15 1
16 1
1
1
0 16 1 0
0
end_operator
begin_operator
trans-1 b1 b2 b3
3
8 3
15 1
16 1
1
1
0 16 1 0
0
end_operator
begin_operator
trans-1 b1 b2 b3
3
8 4
15 1
16 1
1
1
0 16 1 0
0
end_operator
begin_operator
trans-1 b1 b2 b3
3
8 5
15 1
16 1
1
1
0 16 1 0
0
end_operator
begin_operator
trans-1 b1 b2 b3
3
8 6
15 1
16 1
1
1
0 16 1 0
0
end_operator
begin_operator
trans-1 b1 b2 b3
3
8 7
15 1
16 1
1
1
0 16 1 0
0
end_operator
begin_operator
trans-1 b1 b2 b3
3
8 8
15 1
16 1
1
1
0 16 1 0
0
end_operator
begin_operator
trans-1 b1 b2 b3
3
9 3
15 0
16 1
1
2
0 15 0 1
0 16 1 0
0
end_operator
begin_operator
trans-2 b1 b2 b3
3
8 2
15 1
16 1
1
2
0 15 1 2
0 16 1 0
0
end_operator
begin_operator
trans-2 b1 b2 b3
2
15 2
16 1
1
1
0 16 1 0
0
end_operator
0
