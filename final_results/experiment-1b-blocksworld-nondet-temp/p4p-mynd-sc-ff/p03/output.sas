begin_version
3.FOND
end_version
begin_metric
0
end_metric
16
begin_variable
var0
-1
2
Atom act()
NegatedAtom act()
end_variable
begin_variable
var1
-1
2
Atom clear(b1)
NegatedAtom clear(b1)
end_variable
begin_variable
var2
-1
2
Atom clear(b2)
NegatedAtom clear(b2)
end_variable
begin_variable
var3
-1
2
Atom clear(b3)
NegatedAtom clear(b3)
end_variable
begin_variable
var4
-1
2
Atom emptyhand()
NegatedAtom emptyhand()
end_variable
begin_variable
var5
-1
5
Atom holding(b1)
Atom on(b1, b1)
Atom on(b1, b2)
Atom on(b1, b3)
Atom on-table(b1)
end_variable
begin_variable
var6
-1
5
Atom holding(b2)
Atom on(b2, b1)
Atom on(b2, b2)
Atom on(b2, b3)
Atom on-table(b2)
end_variable
begin_variable
var7
-1
5
Atom holding(b3)
Atom on(b3, b1)
Atom on(b3, b2)
Atom on(b3, b3)
Atom on-table(b3)
end_variable
begin_variable
var8
-1
2
Atom oon_b1_b2()
NegatedAtom oon_b1_b2()
end_variable
begin_variable
var9
-1
2
Atom oon_b2_b3-and-yoon_b1_b2()
NegatedAtom oon_b2_b3-and-yoon_b1_b2()
end_variable
begin_variable
var10
0
2
Atom val_on_b1_b2()
NegatedAtom val_on_b1_b2()
end_variable
begin_variable
var11
0
2
Atom val_on_b2_b3()
NegatedAtom val_on_b2_b3()
end_variable
begin_variable
var12
0
2
Atom val_on_b2_b3-and-yoon_b1_b2()
NegatedAtom val_on_b2_b3-and-yoon_b1_b2()
end_variable
begin_variable
var13
0
2
Atom val_oon_b1_b2()
NegatedAtom val_oon_b1_b2()
end_variable
begin_variable
var14
0
2
Atom val_oon_b2_b3-and-yoon_b1_b2()
NegatedAtom val_oon_b2_b3-and-yoon_b1_b2()
end_variable
begin_variable
var15
0
2
Atom val_yoon_b1_b2()
NegatedAtom val_yoon_b1_b2()
end_variable
4
begin_mutex_group
4
4 0
5 0
6 0
7 0
end_mutex_group
begin_mutex_group
5
5 0
5 1
5 2
5 3
5 4
end_mutex_group
begin_mutex_group
5
6 0
6 1
6 2
6 3
6 4
end_mutex_group
begin_mutex_group
5
7 0
7 1
7 2
7 3
7 4
end_mutex_group
begin_state
0
0
0
0
0
4
4
4
1
1
1
1
1
1
1
1
end_state
begin_goal
2
0 0
14 0
end_goal
70
begin_operator
pick-tower b1 b1 b1
3
0 0
4 0
5 1
2
1
0 0 0 1
4
0 0 0 1
0 1 -1 0
0 4 0 1
0 5 1 0
0
end_operator
begin_operator
pick-tower b1 b2 b1
4
0 0
4 0
5 2
6 1
2
1
0 0 0 1
4
0 0 0 1
0 1 -1 0
0 4 0 1
0 6 1 0
0
end_operator
begin_operator
pick-tower b1 b2 b2
4
0 0
4 0
5 2
6 2
2
1
0 0 0 1
4
0 0 0 1
0 2 -1 0
0 4 0 1
0 6 2 0
0
end_operator
begin_operator
pick-tower b1 b2 b3
4
0 0
4 0
5 2
6 3
2
1
0 0 0 1
4
0 0 0 1
0 3 -1 0
0 4 0 1
0 6 3 0
0
end_operator
begin_operator
pick-tower b1 b3 b1
4
0 0
4 0
5 3
7 1
2
1
0 0 0 1
4
0 0 0 1
0 1 -1 0
0 4 0 1
0 7 1 0
0
end_operator
begin_operator
pick-tower b1 b3 b2
4
0 0
4 0
5 3
7 2
2
1
0 0 0 1
4
0 0 0 1
0 2 -1 0
0 4 0 1
0 7 2 0
0
end_operator
begin_operator
pick-tower b1 b3 b3
4
0 0
4 0
5 3
7 3
2
1
0 0 0 1
4
0 0 0 1
0 3 -1 0
0 4 0 1
0 7 3 0
0
end_operator
begin_operator
pick-tower b2 b1 b1
4
0 0
4 0
5 1
6 1
2
1
0 0 0 1
4
0 0 0 1
0 1 -1 0
0 4 0 1
0 5 1 0
0
end_operator
begin_operator
pick-tower b2 b1 b2
4
0 0
4 0
5 2
6 1
2
1
0 0 0 1
4
0 0 0 1
0 2 -1 0
0 4 0 1
0 5 2 0
0
end_operator
begin_operator
pick-tower b2 b1 b3
4
0 0
4 0
5 3
6 1
2
1
0 0 0 1
4
0 0 0 1
0 3 -1 0
0 4 0 1
0 5 3 0
0
end_operator
begin_operator
pick-tower b2 b2 b2
3
0 0
4 0
6 2
2
1
0 0 0 1
4
0 0 0 1
0 2 -1 0
0 4 0 1
0 6 2 0
0
end_operator
begin_operator
pick-tower b2 b3 b1
4
0 0
4 0
6 3
7 1
2
1
0 0 0 1
4
0 0 0 1
0 1 -1 0
0 4 0 1
0 7 1 0
0
end_operator
begin_operator
pick-tower b2 b3 b2
4
0 0
4 0
6 3
7 2
2
1
0 0 0 1
4
0 0 0 1
0 2 -1 0
0 4 0 1
0 7 2 0
0
end_operator
begin_operator
pick-tower b2 b3 b3
4
0 0
4 0
6 3
7 3
2
1
0 0 0 1
4
0 0 0 1
0 3 -1 0
0 4 0 1
0 7 3 0
0
end_operator
begin_operator
pick-tower b3 b1 b1
4
0 0
4 0
5 1
7 1
2
1
0 0 0 1
4
0 0 0 1
0 1 -1 0
0 4 0 1
0 5 1 0
0
end_operator
begin_operator
pick-tower b3 b1 b2
4
0 0
4 0
5 2
7 1
2
1
0 0 0 1
4
0 0 0 1
0 2 -1 0
0 4 0 1
0 5 2 0
0
end_operator
begin_operator
pick-tower b3 b1 b3
4
0 0
4 0
5 3
7 1
2
1
0 0 0 1
4
0 0 0 1
0 3 -1 0
0 4 0 1
0 5 3 0
0
end_operator
begin_operator
pick-tower b3 b2 b1
4
0 0
4 0
6 1
7 2
2
1
0 0 0 1
4
0 0 0 1
0 1 -1 0
0 4 0 1
0 6 1 0
0
end_operator
begin_operator
pick-tower b3 b2 b2
4
0 0
4 0
6 2
7 2
2
1
0 0 0 1
4
0 0 0 1
0 2 -1 0
0 4 0 1
0 6 2 0
0
end_operator
begin_operator
pick-tower b3 b2 b3
4
0 0
4 0
6 3
7 2
2
1
0 0 0 1
4
0 0 0 1
0 3 -1 0
0 4 0 1
0 6 3 0
0
end_operator
begin_operator
pick-tower b3 b3 b3
3
0 0
4 0
7 3
2
1
0 0 0 1
4
0 0 0 1
0 3 -1 0
0 4 0 1
0 7 3 0
0
end_operator
begin_operator
pick-up b1 b1
4
0 0
1 0
4 0
5 1
2
3
0 0 0 1
0 4 0 1
0 5 1 0
2
0 0 0 1
0 5 1 4
0
end_operator
begin_operator
pick-up b1 b2
4
0 0
1 0
4 0
5 2
2
5
0 0 0 1
0 1 0 1
0 2 -1 0
0 4 0 1
0 5 2 0
3
0 0 0 1
0 2 -1 0
0 5 2 4
0
end_operator
begin_operator
pick-up b1 b3
4
0 0
1 0
4 0
5 3
2
5
0 0 0 1
0 1 0 1
0 3 -1 0
0 4 0 1
0 5 3 0
3
0 0 0 1
0 3 -1 0
0 5 3 4
0
end_operator
begin_operator
pick-up b2 b1
4
0 0
2 0
4 0
6 1
2
5
0 0 0 1
0 1 -1 0
0 2 0 1
0 4 0 1
0 6 1 0
3
0 0 0 1
0 1 -1 0
0 6 1 4
0
end_operator
begin_operator
pick-up b2 b2
4
0 0
2 0
4 0
6 2
2
3
0 0 0 1
0 4 0 1
0 6 2 0
2
0 0 0 1
0 6 2 4
0
end_operator
begin_operator
pick-up b2 b3
4
0 0
2 0
4 0
6 3
2
5
0 0 0 1
0 2 0 1
0 3 -1 0
0 4 0 1
0 6 3 0
3
0 0 0 1
0 3 -1 0
0 6 3 4
0
end_operator
begin_operator
pick-up b3 b1
4
0 0
3 0
4 0
7 1
2
5
0 0 0 1
0 1 -1 0
0 3 0 1
0 4 0 1
0 7 1 0
3
0 0 0 1
0 1 -1 0
0 7 1 4
0
end_operator
begin_operator
pick-up b3 b2
4
0 0
3 0
4 0
7 2
2
5
0 0 0 1
0 2 -1 0
0 3 0 1
0 4 0 1
0 7 2 0
3
0 0 0 1
0 2 -1 0
0 7 2 4
0
end_operator
begin_operator
pick-up b3 b3
4
0 0
3 0
4 0
7 3
2
3
0 0 0 1
0 4 0 1
0 7 3 0
2
0 0 0 1
0 7 3 4
0
end_operator
begin_operator
pick-up-from-table b1
4
0 0
1 0
4 0
5 4
2
1
0 0 0 1
3
0 0 0 1
0 4 0 1
0 5 4 0
0
end_operator
begin_operator
pick-up-from-table b2
4
0 0
2 0
4 0
6 4
2
1
0 0 0 1
3
0 0 0 1
0 4 0 1
0 6 4 0
0
end_operator
begin_operator
pick-up-from-table b3
4
0 0
3 0
4 0
7 4
2
1
0 0 0 1
3
0 0 0 1
0 4 0 1
0 7 4 0
0
end_operator
begin_operator
prog 
1
0 1
1
3
0 0 1 0
1 13 0 8 -1 0
1 14 0 9 -1 0
0
end_operator
begin_operator
put-down b1
2
0 0
5 0
1
4
0 0 0 1
0 1 -1 0
0 4 -1 0
0 5 0 4
0
end_operator
begin_operator
put-down b2
2
0 0
6 0
1
4
0 0 0 1
0 2 -1 0
0 4 -1 0
0 6 0 4
0
end_operator
begin_operator
put-down b3
2
0 0
7 0
1
4
0 0 0 1
0 3 -1 0
0 4 -1 0
0 7 0 4
0
end_operator
begin_operator
put-on-block b1 b1
3
0 0
1 0
5 0
2
3
0 0 0 1
0 4 -1 0
0 5 0 1
3
0 0 0 1
0 4 -1 0
0 5 0 4
0
end_operator
begin_operator
put-on-block b1 b2
3
0 0
2 0
5 0
2
5
0 0 0 1
0 1 -1 0
0 2 0 1
0 4 -1 0
0 5 0 2
4
0 0 0 1
0 1 -1 0
0 4 -1 0
0 5 0 4
0
end_operator
begin_operator
put-on-block b1 b3
3
0 0
3 0
5 0
2
5
0 0 0 1
0 1 -1 0
0 3 0 1
0 4 -1 0
0 5 0 3
4
0 0 0 1
0 1 -1 0
0 4 -1 0
0 5 0 4
0
end_operator
begin_operator
put-on-block b2 b1
3
0 0
1 0
6 0
2
5
0 0 0 1
0 1 0 1
0 2 -1 0
0 4 -1 0
0 6 0 1
4
0 0 0 1
0 2 -1 0
0 4 -1 0
0 6 0 4
0
end_operator
begin_operator
put-on-block b2 b2
3
0 0
2 0
6 0
2
3
0 0 0 1
0 4 -1 0
0 6 0 2
3
0 0 0 1
0 4 -1 0
0 6 0 4
0
end_operator
begin_operator
put-on-block b2 b3
3
0 0
3 0
6 0
2
5
0 0 0 1
0 2 -1 0
0 3 0 1
0 4 -1 0
0 6 0 3
4
0 0 0 1
0 2 -1 0
0 4 -1 0
0 6 0 4
0
end_operator
begin_operator
put-on-block b3 b1
3
0 0
1 0
7 0
2
5
0 0 0 1
0 1 0 1
0 3 -1 0
0 4 -1 0
0 7 0 1
4
0 0 0 1
0 3 -1 0
0 4 -1 0
0 7 0 4
0
end_operator
begin_operator
put-on-block b3 b2
3
0 0
2 0
7 0
2
5
0 0 0 1
0 2 0 1
0 3 -1 0
0 4 -1 0
0 7 0 2
4
0 0 0 1
0 3 -1 0
0 4 -1 0
0 7 0 4
0
end_operator
begin_operator
put-on-block b3 b3
3
0 0
3 0
7 0
2
3
0 0 0 1
0 4 -1 0
0 7 0 3
3
0 0 0 1
0 4 -1 0
0 7 0 4
0
end_operator
begin_operator
put-tower-down b1 b2
3
0 0
5 2
6 0
1
3
0 0 0 1
0 4 -1 0
0 6 0 4
0
end_operator
begin_operator
put-tower-down b1 b3
3
0 0
5 3
7 0
1
3
0 0 0 1
0 4 -1 0
0 7 0 4
0
end_operator
begin_operator
put-tower-down b2 b1
3
0 0
5 0
6 1
1
3
0 0 0 1
0 4 -1 0
0 5 0 4
0
end_operator
begin_operator
put-tower-down b2 b3
3
0 0
6 3
7 0
1
3
0 0 0 1
0 4 -1 0
0 7 0 4
0
end_operator
begin_operator
put-tower-down b3 b1
3
0 0
5 0
7 1
1
3
0 0 0 1
0 4 -1 0
0 5 0 4
0
end_operator
begin_operator
put-tower-down b3 b2
3
0 0
6 0
7 2
1
3
0 0 0 1
0 4 -1 0
0 6 0 4
0
end_operator
begin_operator
put-tower-on-block b1 b2 b1
4
0 0
1 0
5 2
6 0
2
4
0 0 0 1
0 1 0 1
0 4 -1 0
0 6 0 1
3
0 0 0 1
0 4 -1 0
0 6 0 4
0
end_operator
begin_operator
put-tower-on-block b1 b2 b2
4
0 0
2 0
5 2
6 0
2
4
0 0 0 1
0 2 0 1
0 4 -1 0
0 6 0 2
3
0 0 0 1
0 4 -1 0
0 6 0 4
0
end_operator
begin_operator
put-tower-on-block b1 b2 b3
4
0 0
3 0
5 2
6 0
2
4
0 0 0 1
0 3 0 1
0 4 -1 0
0 6 0 3
3
0 0 0 1
0 4 -1 0
0 6 0 4
0
end_operator
begin_operator
put-tower-on-block b1 b3 b1
4
0 0
1 0
5 3
7 0
2
4
0 0 0 1
0 1 0 1
0 4 -1 0
0 7 0 1
3
0 0 0 1
0 4 -1 0
0 7 0 4
0
end_operator
begin_operator
put-tower-on-block b1 b3 b2
4
0 0
2 0
5 3
7 0
2
4
0 0 0 1
0 2 0 1
0 4 -1 0
0 7 0 2
3
0 0 0 1
0 4 -1 0
0 7 0 4
0
end_operator
begin_operator
put-tower-on-block b1 b3 b3
4
0 0
3 0
5 3
7 0
2
4
0 0 0 1
0 3 0 1
0 4 -1 0
0 7 0 3
3
0 0 0 1
0 4 -1 0
0 7 0 4
0
end_operator
begin_operator
put-tower-on-block b2 b1 b1
4
0 0
1 0
5 0
6 1
2
4
0 0 0 1
0 1 0 1
0 4 -1 0
0 5 0 1
3
0 0 0 1
0 4 -1 0
0 5 0 4
0
end_operator
begin_operator
put-tower-on-block b2 b1 b2
4
0 0
2 0
5 0
6 1
2
4
0 0 0 1
0 2 0 1
0 4 -1 0
0 5 0 2
3
0 0 0 1
0 4 -1 0
0 5 0 4
0
end_operator
begin_operator
put-tower-on-block b2 b1 b3
4
0 0
3 0
5 0
6 1
2
4
0 0 0 1
0 3 0 1
0 4 -1 0
0 5 0 3
3
0 0 0 1
0 4 -1 0
0 5 0 4
0
end_operator
begin_operator
put-tower-on-block b2 b3 b1
4
0 0
1 0
6 3
7 0
2
4
0 0 0 1
0 1 0 1
0 4 -1 0
0 7 0 1
3
0 0 0 1
0 4 -1 0
0 7 0 4
0
end_operator
begin_operator
put-tower-on-block b2 b3 b2
4
0 0
2 0
6 3
7 0
2
4
0 0 0 1
0 2 0 1
0 4 -1 0
0 7 0 2
3
0 0 0 1
0 4 -1 0
0 7 0 4
0
end_operator
begin_operator
put-tower-on-block b2 b3 b3
4
0 0
3 0
6 3
7 0
2
4
0 0 0 1
0 3 0 1
0 4 -1 0
0 7 0 3
3
0 0 0 1
0 4 -1 0
0 7 0 4
0
end_operator
begin_operator
put-tower-on-block b3 b1 b1
4
0 0
1 0
5 0
7 1
2
4
0 0 0 1
0 1 0 1
0 4 -1 0
0 5 0 1
3
0 0 0 1
0 4 -1 0
0 5 0 4
0
end_operator
begin_operator
put-tower-on-block b3 b1 b2
4
0 0
2 0
5 0
7 1
2
4
0 0 0 1
0 2 0 1
0 4 -1 0
0 5 0 2
3
0 0 0 1
0 4 -1 0
0 5 0 4
0
end_operator
begin_operator
put-tower-on-block b3 b1 b3
4
0 0
3 0
5 0
7 1
2
4
0 0 0 1
0 3 0 1
0 4 -1 0
0 5 0 3
3
0 0 0 1
0 4 -1 0
0 5 0 4
0
end_operator
begin_operator
put-tower-on-block b3 b2 b1
4
0 0
1 0
6 0
7 2
2
4
0 0 0 1
0 1 0 1
0 4 -1 0
0 6 0 1
3
0 0 0 1
0 4 -1 0
0 6 0 4
0
end_operator
begin_operator
put-tower-on-block b3 b2 b2
4
0 0
2 0
6 0
7 2
2
4
0 0 0 1
0 2 0 1
0 4 -1 0
0 6 0 2
3
0 0 0 1
0 4 -1 0
0 6 0 4
0
end_operator
begin_operator
put-tower-on-block b3 b2 b3
4
0 0
3 0
6 0
7 2
2
4
0 0 0 1
0 3 0 1
0 4 -1 0
0 6 0 3
3
0 0 0 1
0 4 -1 0
0 6 0 4
0
end_operator
8
begin_rule
1
5 2
10 1 0
end_rule
begin_rule
1
6 3
11 1 0
end_rule
begin_rule
1
8 0
13 1 0
end_rule
begin_rule
1
8 0
15 1 0
end_rule
begin_rule
1
9 0
14 1 0
end_rule
begin_rule
1
10 0
13 1 0
end_rule
begin_rule
2
11 0
15 0
12 1 0
end_rule
begin_rule
1
12 0
14 1 0
end_rule
