begin_version
3.FOND
end_version
begin_metric
0
end_metric
23
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
Atom clear(b4)
NegatedAtom clear(b4)
end_variable
begin_variable
var5
-1
2
Atom emptyhand()
NegatedAtom emptyhand()
end_variable
begin_variable
var6
-1
6
Atom holding(b1)
Atom on(b1, b1)
Atom on(b1, b2)
Atom on(b1, b3)
Atom on(b1, b4)
Atom on-table(b1)
end_variable
begin_variable
var7
-1
6
Atom holding(b2)
Atom on(b2, b1)
Atom on(b2, b2)
Atom on(b2, b3)
Atom on(b2, b4)
Atom on-table(b2)
end_variable
begin_variable
var8
-1
6
Atom holding(b3)
Atom on(b3, b1)
Atom on(b3, b2)
Atom on(b3, b3)
Atom on(b3, b4)
Atom on-table(b3)
end_variable
begin_variable
var9
-1
6
Atom holding(b4)
Atom on(b4, b1)
Atom on(b4, b2)
Atom on(b4, b3)
Atom on(b4, b4)
Atom on-table(b4)
end_variable
begin_variable
var10
-1
2
Atom oon_b1_b2()
NegatedAtom oon_b1_b2()
end_variable
begin_variable
var11
-1
2
Atom oon_b2_b3-and-yoon_b1_b2()
NegatedAtom oon_b2_b3-and-yoon_b1_b2()
end_variable
begin_variable
var12
-1
2
Atom oon_b3_b4-and-yoon_b2_b3-and-yoon_b1_b2()
NegatedAtom oon_b3_b4-and-yoon_b2_b3-and-yoon_b1_b2()
end_variable
begin_variable
var13
0
2
Atom val_on_b1_b2()
NegatedAtom val_on_b1_b2()
end_variable
begin_variable
var14
0
2
Atom val_on_b2_b3()
NegatedAtom val_on_b2_b3()
end_variable
begin_variable
var15
0
2
Atom val_on_b2_b3-and-yoon_b1_b2()
NegatedAtom val_on_b2_b3-and-yoon_b1_b2()
end_variable
begin_variable
var16
0
2
Atom val_on_b3_b4()
NegatedAtom val_on_b3_b4()
end_variable
begin_variable
var17
0
2
Atom val_on_b3_b4-and-yoon_b2_b3-and-yoon_b1_b2()
NegatedAtom val_on_b3_b4-and-yoon_b2_b3-and-yoon_b1_b2()
end_variable
begin_variable
var18
0
2
Atom val_oon_b1_b2()
NegatedAtom val_oon_b1_b2()
end_variable
begin_variable
var19
0
2
Atom val_oon_b2_b3-and-yoon_b1_b2()
NegatedAtom val_oon_b2_b3-and-yoon_b1_b2()
end_variable
begin_variable
var20
0
2
Atom val_oon_b3_b4-and-yoon_b2_b3-and-yoon_b1_b2()
NegatedAtom val_oon_b3_b4-and-yoon_b2_b3-and-yoon_b1_b2()
end_variable
begin_variable
var21
0
2
Atom val_yoon_b1_b2()
NegatedAtom val_yoon_b1_b2()
end_variable
begin_variable
var22
0
2
Atom val_yoon_b2_b3-and-yoon_b1_b2()
NegatedAtom val_yoon_b2_b3-and-yoon_b1_b2()
end_variable
5
begin_mutex_group
5
5 0
6 0
7 0
8 0
9 0
end_mutex_group
begin_mutex_group
6
6 0
6 1
6 2
6 3
6 4
6 5
end_mutex_group
begin_mutex_group
6
7 0
7 1
7 2
7 3
7 4
7 5
end_mutex_group
begin_mutex_group
6
8 0
8 1
8 2
8 3
8 4
8 5
end_mutex_group
begin_mutex_group
6
9 0
9 1
9 2
9 3
9 4
9 5
end_mutex_group
begin_state
0
0
0
0
0
0
5
5
5
5
1
1
1
1
1
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
20 0
end_goal
153
begin_operator
pick-tower b1 b1 b1
3
0 0
5 0
6 1
2
1
0 0 0 1
4
0 0 0 1
0 1 -1 0
0 5 0 1
0 6 1 0
0
end_operator
begin_operator
pick-tower b1 b2 b1
4
0 0
5 0
6 2
7 1
2
1
0 0 0 1
4
0 0 0 1
0 1 -1 0
0 5 0 1
0 7 1 0
0
end_operator
begin_operator
pick-tower b1 b2 b2
4
0 0
5 0
6 2
7 2
2
1
0 0 0 1
4
0 0 0 1
0 2 -1 0
0 5 0 1
0 7 2 0
0
end_operator
begin_operator
pick-tower b1 b2 b3
4
0 0
5 0
6 2
7 3
2
1
0 0 0 1
4
0 0 0 1
0 3 -1 0
0 5 0 1
0 7 3 0
0
end_operator
begin_operator
pick-tower b1 b2 b4
4
0 0
5 0
6 2
7 4
2
1
0 0 0 1
4
0 0 0 1
0 4 -1 0
0 5 0 1
0 7 4 0
0
end_operator
begin_operator
pick-tower b1 b3 b1
4
0 0
5 0
6 3
8 1
2
1
0 0 0 1
4
0 0 0 1
0 1 -1 0
0 5 0 1
0 8 1 0
0
end_operator
begin_operator
pick-tower b1 b3 b2
4
0 0
5 0
6 3
8 2
2
1
0 0 0 1
4
0 0 0 1
0 2 -1 0
0 5 0 1
0 8 2 0
0
end_operator
begin_operator
pick-tower b1 b3 b3
4
0 0
5 0
6 3
8 3
2
1
0 0 0 1
4
0 0 0 1
0 3 -1 0
0 5 0 1
0 8 3 0
0
end_operator
begin_operator
pick-tower b1 b3 b4
4
0 0
5 0
6 3
8 4
2
1
0 0 0 1
4
0 0 0 1
0 4 -1 0
0 5 0 1
0 8 4 0
0
end_operator
begin_operator
pick-tower b1 b4 b1
4
0 0
5 0
6 4
9 1
2
1
0 0 0 1
4
0 0 0 1
0 1 -1 0
0 5 0 1
0 9 1 0
0
end_operator
begin_operator
pick-tower b1 b4 b2
4
0 0
5 0
6 4
9 2
2
1
0 0 0 1
4
0 0 0 1
0 2 -1 0
0 5 0 1
0 9 2 0
0
end_operator
begin_operator
pick-tower b1 b4 b3
4
0 0
5 0
6 4
9 3
2
1
0 0 0 1
4
0 0 0 1
0 3 -1 0
0 5 0 1
0 9 3 0
0
end_operator
begin_operator
pick-tower b1 b4 b4
4
0 0
5 0
6 4
9 4
2
1
0 0 0 1
4
0 0 0 1
0 4 -1 0
0 5 0 1
0 9 4 0
0
end_operator
begin_operator
pick-tower b2 b1 b1
4
0 0
5 0
6 1
7 1
2
1
0 0 0 1
4
0 0 0 1
0 1 -1 0
0 5 0 1
0 6 1 0
0
end_operator
begin_operator
pick-tower b2 b1 b2
4
0 0
5 0
6 2
7 1
2
1
0 0 0 1
4
0 0 0 1
0 2 -1 0
0 5 0 1
0 6 2 0
0
end_operator
begin_operator
pick-tower b2 b1 b3
4
0 0
5 0
6 3
7 1
2
1
0 0 0 1
4
0 0 0 1
0 3 -1 0
0 5 0 1
0 6 3 0
0
end_operator
begin_operator
pick-tower b2 b1 b4
4
0 0
5 0
6 4
7 1
2
1
0 0 0 1
4
0 0 0 1
0 4 -1 0
0 5 0 1
0 6 4 0
0
end_operator
begin_operator
pick-tower b2 b2 b2
3
0 0
5 0
7 2
2
1
0 0 0 1
4
0 0 0 1
0 2 -1 0
0 5 0 1
0 7 2 0
0
end_operator
begin_operator
pick-tower b2 b3 b1
4
0 0
5 0
7 3
8 1
2
1
0 0 0 1
4
0 0 0 1
0 1 -1 0
0 5 0 1
0 8 1 0
0
end_operator
begin_operator
pick-tower b2 b3 b2
4
0 0
5 0
7 3
8 2
2
1
0 0 0 1
4
0 0 0 1
0 2 -1 0
0 5 0 1
0 8 2 0
0
end_operator
begin_operator
pick-tower b2 b3 b3
4
0 0
5 0
7 3
8 3
2
1
0 0 0 1
4
0 0 0 1
0 3 -1 0
0 5 0 1
0 8 3 0
0
end_operator
begin_operator
pick-tower b2 b3 b4
4
0 0
5 0
7 3
8 4
2
1
0 0 0 1
4
0 0 0 1
0 4 -1 0
0 5 0 1
0 8 4 0
0
end_operator
begin_operator
pick-tower b2 b4 b1
4
0 0
5 0
7 4
9 1
2
1
0 0 0 1
4
0 0 0 1
0 1 -1 0
0 5 0 1
0 9 1 0
0
end_operator
begin_operator
pick-tower b2 b4 b2
4
0 0
5 0
7 4
9 2
2
1
0 0 0 1
4
0 0 0 1
0 2 -1 0
0 5 0 1
0 9 2 0
0
end_operator
begin_operator
pick-tower b2 b4 b3
4
0 0
5 0
7 4
9 3
2
1
0 0 0 1
4
0 0 0 1
0 3 -1 0
0 5 0 1
0 9 3 0
0
end_operator
begin_operator
pick-tower b2 b4 b4
4
0 0
5 0
7 4
9 4
2
1
0 0 0 1
4
0 0 0 1
0 4 -1 0
0 5 0 1
0 9 4 0
0
end_operator
begin_operator
pick-tower b3 b1 b1
4
0 0
5 0
6 1
8 1
2
1
0 0 0 1
4
0 0 0 1
0 1 -1 0
0 5 0 1
0 6 1 0
0
end_operator
begin_operator
pick-tower b3 b1 b2
4
0 0
5 0
6 2
8 1
2
1
0 0 0 1
4
0 0 0 1
0 2 -1 0
0 5 0 1
0 6 2 0
0
end_operator
begin_operator
pick-tower b3 b1 b3
4
0 0
5 0
6 3
8 1
2
1
0 0 0 1
4
0 0 0 1
0 3 -1 0
0 5 0 1
0 6 3 0
0
end_operator
begin_operator
pick-tower b3 b1 b4
4
0 0
5 0
6 4
8 1
2
1
0 0 0 1
4
0 0 0 1
0 4 -1 0
0 5 0 1
0 6 4 0
0
end_operator
begin_operator
pick-tower b3 b2 b1
4
0 0
5 0
7 1
8 2
2
1
0 0 0 1
4
0 0 0 1
0 1 -1 0
0 5 0 1
0 7 1 0
0
end_operator
begin_operator
pick-tower b3 b2 b2
4
0 0
5 0
7 2
8 2
2
1
0 0 0 1
4
0 0 0 1
0 2 -1 0
0 5 0 1
0 7 2 0
0
end_operator
begin_operator
pick-tower b3 b2 b3
4
0 0
5 0
7 3
8 2
2
1
0 0 0 1
4
0 0 0 1
0 3 -1 0
0 5 0 1
0 7 3 0
0
end_operator
begin_operator
pick-tower b3 b2 b4
4
0 0
5 0
7 4
8 2
2
1
0 0 0 1
4
0 0 0 1
0 4 -1 0
0 5 0 1
0 7 4 0
0
end_operator
begin_operator
pick-tower b3 b3 b3
3
0 0
5 0
8 3
2
1
0 0 0 1
4
0 0 0 1
0 3 -1 0
0 5 0 1
0 8 3 0
0
end_operator
begin_operator
pick-tower b3 b4 b1
4
0 0
5 0
8 4
9 1
2
1
0 0 0 1
4
0 0 0 1
0 1 -1 0
0 5 0 1
0 9 1 0
0
end_operator
begin_operator
pick-tower b3 b4 b2
4
0 0
5 0
8 4
9 2
2
1
0 0 0 1
4
0 0 0 1
0 2 -1 0
0 5 0 1
0 9 2 0
0
end_operator
begin_operator
pick-tower b3 b4 b3
4
0 0
5 0
8 4
9 3
2
1
0 0 0 1
4
0 0 0 1
0 3 -1 0
0 5 0 1
0 9 3 0
0
end_operator
begin_operator
pick-tower b3 b4 b4
4
0 0
5 0
8 4
9 4
2
1
0 0 0 1
4
0 0 0 1
0 4 -1 0
0 5 0 1
0 9 4 0
0
end_operator
begin_operator
pick-tower b4 b1 b1
4
0 0
5 0
6 1
9 1
2
1
0 0 0 1
4
0 0 0 1
0 1 -1 0
0 5 0 1
0 6 1 0
0
end_operator
begin_operator
pick-tower b4 b1 b2
4
0 0
5 0
6 2
9 1
2
1
0 0 0 1
4
0 0 0 1
0 2 -1 0
0 5 0 1
0 6 2 0
0
end_operator
begin_operator
pick-tower b4 b1 b3
4
0 0
5 0
6 3
9 1
2
1
0 0 0 1
4
0 0 0 1
0 3 -1 0
0 5 0 1
0 6 3 0
0
end_operator
begin_operator
pick-tower b4 b1 b4
4
0 0
5 0
6 4
9 1
2
1
0 0 0 1
4
0 0 0 1
0 4 -1 0
0 5 0 1
0 6 4 0
0
end_operator
begin_operator
pick-tower b4 b2 b1
4
0 0
5 0
7 1
9 2
2
1
0 0 0 1
4
0 0 0 1
0 1 -1 0
0 5 0 1
0 7 1 0
0
end_operator
begin_operator
pick-tower b4 b2 b2
4
0 0
5 0
7 2
9 2
2
1
0 0 0 1
4
0 0 0 1
0 2 -1 0
0 5 0 1
0 7 2 0
0
end_operator
begin_operator
pick-tower b4 b2 b3
4
0 0
5 0
7 3
9 2
2
1
0 0 0 1
4
0 0 0 1
0 3 -1 0
0 5 0 1
0 7 3 0
0
end_operator
begin_operator
pick-tower b4 b2 b4
4
0 0
5 0
7 4
9 2
2
1
0 0 0 1
4
0 0 0 1
0 4 -1 0
0 5 0 1
0 7 4 0
0
end_operator
begin_operator
pick-tower b4 b3 b1
4
0 0
5 0
8 1
9 3
2
1
0 0 0 1
4
0 0 0 1
0 1 -1 0
0 5 0 1
0 8 1 0
0
end_operator
begin_operator
pick-tower b4 b3 b2
4
0 0
5 0
8 2
9 3
2
1
0 0 0 1
4
0 0 0 1
0 2 -1 0
0 5 0 1
0 8 2 0
0
end_operator
begin_operator
pick-tower b4 b3 b3
4
0 0
5 0
8 3
9 3
2
1
0 0 0 1
4
0 0 0 1
0 3 -1 0
0 5 0 1
0 8 3 0
0
end_operator
begin_operator
pick-tower b4 b3 b4
4
0 0
5 0
8 4
9 3
2
1
0 0 0 1
4
0 0 0 1
0 4 -1 0
0 5 0 1
0 8 4 0
0
end_operator
begin_operator
pick-tower b4 b4 b4
3
0 0
5 0
9 4
2
1
0 0 0 1
4
0 0 0 1
0 4 -1 0
0 5 0 1
0 9 4 0
0
end_operator
begin_operator
pick-up b1 b1
4
0 0
1 0
5 0
6 1
2
3
0 0 0 1
0 5 0 1
0 6 1 0
2
0 0 0 1
0 6 1 5
0
end_operator
begin_operator
pick-up b1 b2
4
0 0
1 0
5 0
6 2
2
5
0 0 0 1
0 1 0 1
0 2 -1 0
0 5 0 1
0 6 2 0
3
0 0 0 1
0 2 -1 0
0 6 2 5
0
end_operator
begin_operator
pick-up b1 b3
4
0 0
1 0
5 0
6 3
2
5
0 0 0 1
0 1 0 1
0 3 -1 0
0 5 0 1
0 6 3 0
3
0 0 0 1
0 3 -1 0
0 6 3 5
0
end_operator
begin_operator
pick-up b1 b4
4
0 0
1 0
5 0
6 4
2
5
0 0 0 1
0 1 0 1
0 4 -1 0
0 5 0 1
0 6 4 0
3
0 0 0 1
0 4 -1 0
0 6 4 5
0
end_operator
begin_operator
pick-up b2 b1
4
0 0
2 0
5 0
7 1
2
5
0 0 0 1
0 1 -1 0
0 2 0 1
0 5 0 1
0 7 1 0
3
0 0 0 1
0 1 -1 0
0 7 1 5
0
end_operator
begin_operator
pick-up b2 b2
4
0 0
2 0
5 0
7 2
2
3
0 0 0 1
0 5 0 1
0 7 2 0
2
0 0 0 1
0 7 2 5
0
end_operator
begin_operator
pick-up b2 b3
4
0 0
2 0
5 0
7 3
2
5
0 0 0 1
0 2 0 1
0 3 -1 0
0 5 0 1
0 7 3 0
3
0 0 0 1
0 3 -1 0
0 7 3 5
0
end_operator
begin_operator
pick-up b2 b4
4
0 0
2 0
5 0
7 4
2
5
0 0 0 1
0 2 0 1
0 4 -1 0
0 5 0 1
0 7 4 0
3
0 0 0 1
0 4 -1 0
0 7 4 5
0
end_operator
begin_operator
pick-up b3 b1
4
0 0
3 0
5 0
8 1
2
5
0 0 0 1
0 1 -1 0
0 3 0 1
0 5 0 1
0 8 1 0
3
0 0 0 1
0 1 -1 0
0 8 1 5
0
end_operator
begin_operator
pick-up b3 b2
4
0 0
3 0
5 0
8 2
2
5
0 0 0 1
0 2 -1 0
0 3 0 1
0 5 0 1
0 8 2 0
3
0 0 0 1
0 2 -1 0
0 8 2 5
0
end_operator
begin_operator
pick-up b3 b3
4
0 0
3 0
5 0
8 3
2
3
0 0 0 1
0 5 0 1
0 8 3 0
2
0 0 0 1
0 8 3 5
0
end_operator
begin_operator
pick-up b3 b4
4
0 0
3 0
5 0
8 4
2
5
0 0 0 1
0 3 0 1
0 4 -1 0
0 5 0 1
0 8 4 0
3
0 0 0 1
0 4 -1 0
0 8 4 5
0
end_operator
begin_operator
pick-up b4 b1
4
0 0
4 0
5 0
9 1
2
5
0 0 0 1
0 1 -1 0
0 4 0 1
0 5 0 1
0 9 1 0
3
0 0 0 1
0 1 -1 0
0 9 1 5
0
end_operator
begin_operator
pick-up b4 b2
4
0 0
4 0
5 0
9 2
2
5
0 0 0 1
0 2 -1 0
0 4 0 1
0 5 0 1
0 9 2 0
3
0 0 0 1
0 2 -1 0
0 9 2 5
0
end_operator
begin_operator
pick-up b4 b3
4
0 0
4 0
5 0
9 3
2
5
0 0 0 1
0 3 -1 0
0 4 0 1
0 5 0 1
0 9 3 0
3
0 0 0 1
0 3 -1 0
0 9 3 5
0
end_operator
begin_operator
pick-up b4 b4
4
0 0
4 0
5 0
9 4
2
3
0 0 0 1
0 5 0 1
0 9 4 0
2
0 0 0 1
0 9 4 5
0
end_operator
begin_operator
pick-up-from-table b1
4
0 0
1 0
5 0
6 5
2
1
0 0 0 1
3
0 0 0 1
0 5 0 1
0 6 5 0
0
end_operator
begin_operator
pick-up-from-table b2
4
0 0
2 0
5 0
7 5
2
1
0 0 0 1
3
0 0 0 1
0 5 0 1
0 7 5 0
0
end_operator
begin_operator
pick-up-from-table b3
4
0 0
3 0
5 0
8 5
2
1
0 0 0 1
3
0 0 0 1
0 5 0 1
0 8 5 0
0
end_operator
begin_operator
pick-up-from-table b4
4
0 0
4 0
5 0
9 5
2
1
0 0 0 1
3
0 0 0 1
0 5 0 1
0 9 5 0
0
end_operator
begin_operator
prog 
1
0 1
1
4
0 0 1 0
1 18 0 10 -1 0
1 19 0 11 -1 0
1 20 0 12 -1 0
0
end_operator
begin_operator
put-down b1
2
0 0
6 0
1
4
0 0 0 1
0 1 -1 0
0 5 -1 0
0 6 0 5
0
end_operator
begin_operator
put-down b2
2
0 0
7 0
1
4
0 0 0 1
0 2 -1 0
0 5 -1 0
0 7 0 5
0
end_operator
begin_operator
put-down b3
2
0 0
8 0
1
4
0 0 0 1
0 3 -1 0
0 5 -1 0
0 8 0 5
0
end_operator
begin_operator
put-down b4
2
0 0
9 0
1
4
0 0 0 1
0 4 -1 0
0 5 -1 0
0 9 0 5
0
end_operator
begin_operator
put-on-block b1 b1
3
0 0
1 0
6 0
2
3
0 0 0 1
0 5 -1 0
0 6 0 1
3
0 0 0 1
0 5 -1 0
0 6 0 5
0
end_operator
begin_operator
put-on-block b1 b2
3
0 0
2 0
6 0
2
5
0 0 0 1
0 1 -1 0
0 2 0 1
0 5 -1 0
0 6 0 2
4
0 0 0 1
0 1 -1 0
0 5 -1 0
0 6 0 5
0
end_operator
begin_operator
put-on-block b1 b3
3
0 0
3 0
6 0
2
5
0 0 0 1
0 1 -1 0
0 3 0 1
0 5 -1 0
0 6 0 3
4
0 0 0 1
0 1 -1 0
0 5 -1 0
0 6 0 5
0
end_operator
begin_operator
put-on-block b1 b4
3
0 0
4 0
6 0
2
5
0 0 0 1
0 1 -1 0
0 4 0 1
0 5 -1 0
0 6 0 4
4
0 0 0 1
0 1 -1 0
0 5 -1 0
0 6 0 5
0
end_operator
begin_operator
put-on-block b2 b1
3
0 0
1 0
7 0
2
5
0 0 0 1
0 1 0 1
0 2 -1 0
0 5 -1 0
0 7 0 1
4
0 0 0 1
0 2 -1 0
0 5 -1 0
0 7 0 5
0
end_operator
begin_operator
put-on-block b2 b2
3
0 0
2 0
7 0
2
3
0 0 0 1
0 5 -1 0
0 7 0 2
3
0 0 0 1
0 5 -1 0
0 7 0 5
0
end_operator
begin_operator
put-on-block b2 b3
3
0 0
3 0
7 0
2
5
0 0 0 1
0 2 -1 0
0 3 0 1
0 5 -1 0
0 7 0 3
4
0 0 0 1
0 2 -1 0
0 5 -1 0
0 7 0 5
0
end_operator
begin_operator
put-on-block b2 b4
3
0 0
4 0
7 0
2
5
0 0 0 1
0 2 -1 0
0 4 0 1
0 5 -1 0
0 7 0 4
4
0 0 0 1
0 2 -1 0
0 5 -1 0
0 7 0 5
0
end_operator
begin_operator
put-on-block b3 b1
3
0 0
1 0
8 0
2
5
0 0 0 1
0 1 0 1
0 3 -1 0
0 5 -1 0
0 8 0 1
4
0 0 0 1
0 3 -1 0
0 5 -1 0
0 8 0 5
0
end_operator
begin_operator
put-on-block b3 b2
3
0 0
2 0
8 0
2
5
0 0 0 1
0 2 0 1
0 3 -1 0
0 5 -1 0
0 8 0 2
4
0 0 0 1
0 3 -1 0
0 5 -1 0
0 8 0 5
0
end_operator
begin_operator
put-on-block b3 b3
3
0 0
3 0
8 0
2
3
0 0 0 1
0 5 -1 0
0 8 0 3
3
0 0 0 1
0 5 -1 0
0 8 0 5
0
end_operator
begin_operator
put-on-block b3 b4
3
0 0
4 0
8 0
2
5
0 0 0 1
0 3 -1 0
0 4 0 1
0 5 -1 0
0 8 0 4
4
0 0 0 1
0 3 -1 0
0 5 -1 0
0 8 0 5
0
end_operator
begin_operator
put-on-block b4 b1
3
0 0
1 0
9 0
2
5
0 0 0 1
0 1 0 1
0 4 -1 0
0 5 -1 0
0 9 0 1
4
0 0 0 1
0 4 -1 0
0 5 -1 0
0 9 0 5
0
end_operator
begin_operator
put-on-block b4 b2
3
0 0
2 0
9 0
2
5
0 0 0 1
0 2 0 1
0 4 -1 0
0 5 -1 0
0 9 0 2
4
0 0 0 1
0 4 -1 0
0 5 -1 0
0 9 0 5
0
end_operator
begin_operator
put-on-block b4 b3
3
0 0
3 0
9 0
2
5
0 0 0 1
0 3 0 1
0 4 -1 0
0 5 -1 0
0 9 0 3
4
0 0 0 1
0 4 -1 0
0 5 -1 0
0 9 0 5
0
end_operator
begin_operator
put-on-block b4 b4
3
0 0
4 0
9 0
2
3
0 0 0 1
0 5 -1 0
0 9 0 4
3
0 0 0 1
0 5 -1 0
0 9 0 5
0
end_operator
begin_operator
put-tower-down b1 b2
3
0 0
6 2
7 0
1
3
0 0 0 1
0 5 -1 0
0 7 0 5
0
end_operator
begin_operator
put-tower-down b1 b3
3
0 0
6 3
8 0
1
3
0 0 0 1
0 5 -1 0
0 8 0 5
0
end_operator
begin_operator
put-tower-down b1 b4
3
0 0
6 4
9 0
1
3
0 0 0 1
0 5 -1 0
0 9 0 5
0
end_operator
begin_operator
put-tower-down b2 b1
3
0 0
6 0
7 1
1
3
0 0 0 1
0 5 -1 0
0 6 0 5
0
end_operator
begin_operator
put-tower-down b2 b3
3
0 0
7 3
8 0
1
3
0 0 0 1
0 5 -1 0
0 8 0 5
0
end_operator
begin_operator
put-tower-down b2 b4
3
0 0
7 4
9 0
1
3
0 0 0 1
0 5 -1 0
0 9 0 5
0
end_operator
begin_operator
put-tower-down b3 b1
3
0 0
6 0
8 1
1
3
0 0 0 1
0 5 -1 0
0 6 0 5
0
end_operator
begin_operator
put-tower-down b3 b2
3
0 0
7 0
8 2
1
3
0 0 0 1
0 5 -1 0
0 7 0 5
0
end_operator
begin_operator
put-tower-down b3 b4
3
0 0
8 4
9 0
1
3
0 0 0 1
0 5 -1 0
0 9 0 5
0
end_operator
begin_operator
put-tower-down b4 b1
3
0 0
6 0
9 1
1
3
0 0 0 1
0 5 -1 0
0 6 0 5
0
end_operator
begin_operator
put-tower-down b4 b2
3
0 0
7 0
9 2
1
3
0 0 0 1
0 5 -1 0
0 7 0 5
0
end_operator
begin_operator
put-tower-down b4 b3
3
0 0
8 0
9 3
1
3
0 0 0 1
0 5 -1 0
0 8 0 5
0
end_operator
begin_operator
put-tower-on-block b1 b2 b1
4
0 0
1 0
6 2
7 0
2
4
0 0 0 1
0 1 0 1
0 5 -1 0
0 7 0 1
3
0 0 0 1
0 5 -1 0
0 7 0 5
0
end_operator
begin_operator
put-tower-on-block b1 b2 b2
4
0 0
2 0
6 2
7 0
2
4
0 0 0 1
0 2 0 1
0 5 -1 0
0 7 0 2
3
0 0 0 1
0 5 -1 0
0 7 0 5
0
end_operator
begin_operator
put-tower-on-block b1 b2 b3
4
0 0
3 0
6 2
7 0
2
4
0 0 0 1
0 3 0 1
0 5 -1 0
0 7 0 3
3
0 0 0 1
0 5 -1 0
0 7 0 5
0
end_operator
begin_operator
put-tower-on-block b1 b2 b4
4
0 0
4 0
6 2
7 0
2
4
0 0 0 1
0 4 0 1
0 5 -1 0
0 7 0 4
3
0 0 0 1
0 5 -1 0
0 7 0 5
0
end_operator
begin_operator
put-tower-on-block b1 b3 b1
4
0 0
1 0
6 3
8 0
2
4
0 0 0 1
0 1 0 1
0 5 -1 0
0 8 0 1
3
0 0 0 1
0 5 -1 0
0 8 0 5
0
end_operator
begin_operator
put-tower-on-block b1 b3 b2
4
0 0
2 0
6 3
8 0
2
4
0 0 0 1
0 2 0 1
0 5 -1 0
0 8 0 2
3
0 0 0 1
0 5 -1 0
0 8 0 5
0
end_operator
begin_operator
put-tower-on-block b1 b3 b3
4
0 0
3 0
6 3
8 0
2
4
0 0 0 1
0 3 0 1
0 5 -1 0
0 8 0 3
3
0 0 0 1
0 5 -1 0
0 8 0 5
0
end_operator
begin_operator
put-tower-on-block b1 b3 b4
4
0 0
4 0
6 3
8 0
2
4
0 0 0 1
0 4 0 1
0 5 -1 0
0 8 0 4
3
0 0 0 1
0 5 -1 0
0 8 0 5
0
end_operator
begin_operator
put-tower-on-block b1 b4 b1
4
0 0
1 0
6 4
9 0
2
4
0 0 0 1
0 1 0 1
0 5 -1 0
0 9 0 1
3
0 0 0 1
0 5 -1 0
0 9 0 5
0
end_operator
begin_operator
put-tower-on-block b1 b4 b2
4
0 0
2 0
6 4
9 0
2
4
0 0 0 1
0 2 0 1
0 5 -1 0
0 9 0 2
3
0 0 0 1
0 5 -1 0
0 9 0 5
0
end_operator
begin_operator
put-tower-on-block b1 b4 b3
4
0 0
3 0
6 4
9 0
2
4
0 0 0 1
0 3 0 1
0 5 -1 0
0 9 0 3
3
0 0 0 1
0 5 -1 0
0 9 0 5
0
end_operator
begin_operator
put-tower-on-block b1 b4 b4
4
0 0
4 0
6 4
9 0
2
4
0 0 0 1
0 4 0 1
0 5 -1 0
0 9 0 4
3
0 0 0 1
0 5 -1 0
0 9 0 5
0
end_operator
begin_operator
put-tower-on-block b2 b1 b1
4
0 0
1 0
6 0
7 1
2
4
0 0 0 1
0 1 0 1
0 5 -1 0
0 6 0 1
3
0 0 0 1
0 5 -1 0
0 6 0 5
0
end_operator
begin_operator
put-tower-on-block b2 b1 b2
4
0 0
2 0
6 0
7 1
2
4
0 0 0 1
0 2 0 1
0 5 -1 0
0 6 0 2
3
0 0 0 1
0 5 -1 0
0 6 0 5
0
end_operator
begin_operator
put-tower-on-block b2 b1 b3
4
0 0
3 0
6 0
7 1
2
4
0 0 0 1
0 3 0 1
0 5 -1 0
0 6 0 3
3
0 0 0 1
0 5 -1 0
0 6 0 5
0
end_operator
begin_operator
put-tower-on-block b2 b1 b4
4
0 0
4 0
6 0
7 1
2
4
0 0 0 1
0 4 0 1
0 5 -1 0
0 6 0 4
3
0 0 0 1
0 5 -1 0
0 6 0 5
0
end_operator
begin_operator
put-tower-on-block b2 b3 b1
4
0 0
1 0
7 3
8 0
2
4
0 0 0 1
0 1 0 1
0 5 -1 0
0 8 0 1
3
0 0 0 1
0 5 -1 0
0 8 0 5
0
end_operator
begin_operator
put-tower-on-block b2 b3 b2
4
0 0
2 0
7 3
8 0
2
4
0 0 0 1
0 2 0 1
0 5 -1 0
0 8 0 2
3
0 0 0 1
0 5 -1 0
0 8 0 5
0
end_operator
begin_operator
put-tower-on-block b2 b3 b3
4
0 0
3 0
7 3
8 0
2
4
0 0 0 1
0 3 0 1
0 5 -1 0
0 8 0 3
3
0 0 0 1
0 5 -1 0
0 8 0 5
0
end_operator
begin_operator
put-tower-on-block b2 b3 b4
4
0 0
4 0
7 3
8 0
2
4
0 0 0 1
0 4 0 1
0 5 -1 0
0 8 0 4
3
0 0 0 1
0 5 -1 0
0 8 0 5
0
end_operator
begin_operator
put-tower-on-block b2 b4 b1
4
0 0
1 0
7 4
9 0
2
4
0 0 0 1
0 1 0 1
0 5 -1 0
0 9 0 1
3
0 0 0 1
0 5 -1 0
0 9 0 5
0
end_operator
begin_operator
put-tower-on-block b2 b4 b2
4
0 0
2 0
7 4
9 0
2
4
0 0 0 1
0 2 0 1
0 5 -1 0
0 9 0 2
3
0 0 0 1
0 5 -1 0
0 9 0 5
0
end_operator
begin_operator
put-tower-on-block b2 b4 b3
4
0 0
3 0
7 4
9 0
2
4
0 0 0 1
0 3 0 1
0 5 -1 0
0 9 0 3
3
0 0 0 1
0 5 -1 0
0 9 0 5
0
end_operator
begin_operator
put-tower-on-block b2 b4 b4
4
0 0
4 0
7 4
9 0
2
4
0 0 0 1
0 4 0 1
0 5 -1 0
0 9 0 4
3
0 0 0 1
0 5 -1 0
0 9 0 5
0
end_operator
begin_operator
put-tower-on-block b3 b1 b1
4
0 0
1 0
6 0
8 1
2
4
0 0 0 1
0 1 0 1
0 5 -1 0
0 6 0 1
3
0 0 0 1
0 5 -1 0
0 6 0 5
0
end_operator
begin_operator
put-tower-on-block b3 b1 b2
4
0 0
2 0
6 0
8 1
2
4
0 0 0 1
0 2 0 1
0 5 -1 0
0 6 0 2
3
0 0 0 1
0 5 -1 0
0 6 0 5
0
end_operator
begin_operator
put-tower-on-block b3 b1 b3
4
0 0
3 0
6 0
8 1
2
4
0 0 0 1
0 3 0 1
0 5 -1 0
0 6 0 3
3
0 0 0 1
0 5 -1 0
0 6 0 5
0
end_operator
begin_operator
put-tower-on-block b3 b1 b4
4
0 0
4 0
6 0
8 1
2
4
0 0 0 1
0 4 0 1
0 5 -1 0
0 6 0 4
3
0 0 0 1
0 5 -1 0
0 6 0 5
0
end_operator
begin_operator
put-tower-on-block b3 b2 b1
4
0 0
1 0
7 0
8 2
2
4
0 0 0 1
0 1 0 1
0 5 -1 0
0 7 0 1
3
0 0 0 1
0 5 -1 0
0 7 0 5
0
end_operator
begin_operator
put-tower-on-block b3 b2 b2
4
0 0
2 0
7 0
8 2
2
4
0 0 0 1
0 2 0 1
0 5 -1 0
0 7 0 2
3
0 0 0 1
0 5 -1 0
0 7 0 5
0
end_operator
begin_operator
put-tower-on-block b3 b2 b3
4
0 0
3 0
7 0
8 2
2
4
0 0 0 1
0 3 0 1
0 5 -1 0
0 7 0 3
3
0 0 0 1
0 5 -1 0
0 7 0 5
0
end_operator
begin_operator
put-tower-on-block b3 b2 b4
4
0 0
4 0
7 0
8 2
2
4
0 0 0 1
0 4 0 1
0 5 -1 0
0 7 0 4
3
0 0 0 1
0 5 -1 0
0 7 0 5
0
end_operator
begin_operator
put-tower-on-block b3 b4 b1
4
0 0
1 0
8 4
9 0
2
4
0 0 0 1
0 1 0 1
0 5 -1 0
0 9 0 1
3
0 0 0 1
0 5 -1 0
0 9 0 5
0
end_operator
begin_operator
put-tower-on-block b3 b4 b2
4
0 0
2 0
8 4
9 0
2
4
0 0 0 1
0 2 0 1
0 5 -1 0
0 9 0 2
3
0 0 0 1
0 5 -1 0
0 9 0 5
0
end_operator
begin_operator
put-tower-on-block b3 b4 b3
4
0 0
3 0
8 4
9 0
2
4
0 0 0 1
0 3 0 1
0 5 -1 0
0 9 0 3
3
0 0 0 1
0 5 -1 0
0 9 0 5
0
end_operator
begin_operator
put-tower-on-block b3 b4 b4
4
0 0
4 0
8 4
9 0
2
4
0 0 0 1
0 4 0 1
0 5 -1 0
0 9 0 4
3
0 0 0 1
0 5 -1 0
0 9 0 5
0
end_operator
begin_operator
put-tower-on-block b4 b1 b1
4
0 0
1 0
6 0
9 1
2
4
0 0 0 1
0 1 0 1
0 5 -1 0
0 6 0 1
3
0 0 0 1
0 5 -1 0
0 6 0 5
0
end_operator
begin_operator
put-tower-on-block b4 b1 b2
4
0 0
2 0
6 0
9 1
2
4
0 0 0 1
0 2 0 1
0 5 -1 0
0 6 0 2
3
0 0 0 1
0 5 -1 0
0 6 0 5
0
end_operator
begin_operator
put-tower-on-block b4 b1 b3
4
0 0
3 0
6 0
9 1
2
4
0 0 0 1
0 3 0 1
0 5 -1 0
0 6 0 3
3
0 0 0 1
0 5 -1 0
0 6 0 5
0
end_operator
begin_operator
put-tower-on-block b4 b1 b4
4
0 0
4 0
6 0
9 1
2
4
0 0 0 1
0 4 0 1
0 5 -1 0
0 6 0 4
3
0 0 0 1
0 5 -1 0
0 6 0 5
0
end_operator
begin_operator
put-tower-on-block b4 b2 b1
4
0 0
1 0
7 0
9 2
2
4
0 0 0 1
0 1 0 1
0 5 -1 0
0 7 0 1
3
0 0 0 1
0 5 -1 0
0 7 0 5
0
end_operator
begin_operator
put-tower-on-block b4 b2 b2
4
0 0
2 0
7 0
9 2
2
4
0 0 0 1
0 2 0 1
0 5 -1 0
0 7 0 2
3
0 0 0 1
0 5 -1 0
0 7 0 5
0
end_operator
begin_operator
put-tower-on-block b4 b2 b3
4
0 0
3 0
7 0
9 2
2
4
0 0 0 1
0 3 0 1
0 5 -1 0
0 7 0 3
3
0 0 0 1
0 5 -1 0
0 7 0 5
0
end_operator
begin_operator
put-tower-on-block b4 b2 b4
4
0 0
4 0
7 0
9 2
2
4
0 0 0 1
0 4 0 1
0 5 -1 0
0 7 0 4
3
0 0 0 1
0 5 -1 0
0 7 0 5
0
end_operator
begin_operator
put-tower-on-block b4 b3 b1
4
0 0
1 0
8 0
9 3
2
4
0 0 0 1
0 1 0 1
0 5 -1 0
0 8 0 1
3
0 0 0 1
0 5 -1 0
0 8 0 5
0
end_operator
begin_operator
put-tower-on-block b4 b3 b2
4
0 0
2 0
8 0
9 3
2
4
0 0 0 1
0 2 0 1
0 5 -1 0
0 8 0 2
3
0 0 0 1
0 5 -1 0
0 8 0 5
0
end_operator
begin_operator
put-tower-on-block b4 b3 b3
4
0 0
3 0
8 0
9 3
2
4
0 0 0 1
0 3 0 1
0 5 -1 0
0 8 0 3
3
0 0 0 1
0 5 -1 0
0 8 0 5
0
end_operator
begin_operator
put-tower-on-block b4 b3 b4
4
0 0
4 0
8 0
9 3
2
4
0 0 0 1
0 4 0 1
0 5 -1 0
0 8 0 4
3
0 0 0 1
0 5 -1 0
0 8 0 5
0
end_operator
13
begin_rule
1
6 2
13 1 0
end_rule
begin_rule
1
7 3
14 1 0
end_rule
begin_rule
1
8 4
16 1 0
end_rule
begin_rule
1
10 0
18 1 0
end_rule
begin_rule
1
10 0
21 1 0
end_rule
begin_rule
1
11 0
19 1 0
end_rule
begin_rule
1
11 0
22 1 0
end_rule
begin_rule
1
12 0
20 1 0
end_rule
begin_rule
1
13 0
18 1 0
end_rule
begin_rule
2
14 0
21 0
15 1 0
end_rule
begin_rule
1
15 0
19 1 0
end_rule
begin_rule
2
16 0
22 0
17 1 0
end_rule
begin_rule
1
17 0
20 1 0
end_rule
