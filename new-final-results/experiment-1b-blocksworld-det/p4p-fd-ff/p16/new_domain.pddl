(define (domain blocks-domain)
    (:requirements :conditional-effects :derived-predicates :negative-preconditions :strips)
    (:types block)
    (:predicates (Oon_b10_b11-and-YOon_b11_b12-and-YOon_b12_b13-and-YOon_b13_b14-and-YOon_b14_b15-and-YOon_b15_b16) (Oon_b11_b12-and-YOon_b12_b13-and-YOon_b13_b14-and-YOon_b14_b15-and-YOon_b15_b16) (Oon_b12_b13-and-YOon_b13_b14-and-YOon_b14_b15-and-YOon_b15_b16) (Oon_b13_b14-and-YOon_b14_b15-and-YOon_b15_b16) (Oon_b14_b15-and-YOon_b15_b16) (Oon_b15_b16) (Oon_b1_b2-and-YOon_b2_b3-and-YOon_b3_b4-and-YOon_b4_b5-and-YOon_b5_b6-and-YOon_b6_b7-and-YOon_b7_b8-and-YOon_b8_b9-and-YOon_b9_b10-and-YOon_b10_b11-and-YOon_b11_b12-and-YOon_b12_b13-and-YOon_b13_b14-and-YOon_b14_b15-and-YOon_b15_b16) (Oon_b2_b3-and-YOon_b3_b4-and-YOon_b4_b5-and-YOon_b5_b6-and-YOon_b6_b7-and-YOon_b7_b8-and-YOon_b8_b9-and-YOon_b9_b10-and-YOon_b10_b11-and-YOon_b11_b12-and-YOon_b12_b13-and-YOon_b13_b14-and-YOon_b14_b15-and-YOon_b15_b16) (Oon_b3_b4-and-YOon_b4_b5-and-YOon_b5_b6-and-YOon_b6_b7-and-YOon_b7_b8-and-YOon_b8_b9-and-YOon_b9_b10-and-YOon_b10_b11-and-YOon_b11_b12-and-YOon_b12_b13-and-YOon_b13_b14-and-YOon_b14_b15-and-YOon_b15_b16) (Oon_b4_b5-and-YOon_b5_b6-and-YOon_b6_b7-and-YOon_b7_b8-and-YOon_b8_b9-and-YOon_b9_b10-and-YOon_b10_b11-and-YOon_b11_b12-and-YOon_b12_b13-and-YOon_b13_b14-and-YOon_b14_b15-and-YOon_b15_b16) (Oon_b5_b6-and-YOon_b6_b7-and-YOon_b7_b8-and-YOon_b8_b9-and-YOon_b9_b10-and-YOon_b10_b11-and-YOon_b11_b12-and-YOon_b12_b13-and-YOon_b13_b14-and-YOon_b14_b15-and-YOon_b15_b16) (Oon_b6_b7-and-YOon_b7_b8-and-YOon_b8_b9-and-YOon_b9_b10-and-YOon_b10_b11-and-YOon_b11_b12-and-YOon_b12_b13-and-YOon_b13_b14-and-YOon_b14_b15-and-YOon_b15_b16) (Oon_b7_b8-and-YOon_b8_b9-and-YOon_b9_b10-and-YOon_b10_b11-and-YOon_b11_b12-and-YOon_b12_b13-and-YOon_b13_b14-and-YOon_b14_b15-and-YOon_b15_b16) (Oon_b8_b9-and-YOon_b9_b10-and-YOon_b10_b11-and-YOon_b11_b12-and-YOon_b12_b13-and-YOon_b13_b14-and-YOon_b14_b15-and-YOon_b15_b16) (Oon_b9_b10-and-YOon_b10_b11-and-YOon_b11_b12-and-YOon_b12_b13-and-YOon_b13_b14-and-YOon_b14_b15-and-YOon_b15_b16) (clear ?x) (emptyhand) (holding ?x) (on ?x ?y) (ontable ?x) (val_Oon_b10_b11-and-YOon_b11_b12-and-YOon_b12_b13-and-YOon_b13_b14-and-YOon_b14_b15-and-YOon_b15_b16) (val_Oon_b11_b12-and-YOon_b12_b13-and-YOon_b13_b14-and-YOon_b14_b15-and-YOon_b15_b16) (val_Oon_b12_b13-and-YOon_b13_b14-and-YOon_b14_b15-and-YOon_b15_b16) (val_Oon_b13_b14-and-YOon_b14_b15-and-YOon_b15_b16) (val_Oon_b14_b15-and-YOon_b15_b16) (val_Oon_b15_b16) (val_Oon_b1_b2-and-YOon_b2_b3-and-YOon_b3_b4-and-YOon_b4_b5-and-YOon_b5_b6-and-YOon_b6_b7-and-YOon_b7_b8-and-YOon_b8_b9-and-YOon_b9_b10-and-YOon_b10_b11-and-YOon_b11_b12-and-YOon_b12_b13-and-YOon_b13_b14-and-YOon_b14_b15-and-YOon_b15_b16) (val_Oon_b2_b3-and-YOon_b3_b4-and-YOon_b4_b5-and-YOon_b5_b6-and-YOon_b6_b7-and-YOon_b7_b8-and-YOon_b8_b9-and-YOon_b9_b10-and-YOon_b10_b11-and-YOon_b11_b12-and-YOon_b12_b13-and-YOon_b13_b14-and-YOon_b14_b15-and-YOon_b15_b16) (val_Oon_b3_b4-and-YOon_b4_b5-and-YOon_b5_b6-and-YOon_b6_b7-and-YOon_b7_b8-and-YOon_b8_b9-and-YOon_b9_b10-and-YOon_b10_b11-and-YOon_b11_b12-and-YOon_b12_b13-and-YOon_b13_b14-and-YOon_b14_b15-and-YOon_b15_b16) (val_Oon_b4_b5-and-YOon_b5_b6-and-YOon_b6_b7-and-YOon_b7_b8-and-YOon_b8_b9-and-YOon_b9_b10-and-YOon_b10_b11-and-YOon_b11_b12-and-YOon_b12_b13-and-YOon_b13_b14-and-YOon_b14_b15-and-YOon_b15_b16) (val_Oon_b5_b6-and-YOon_b6_b7-and-YOon_b7_b8-and-YOon_b8_b9-and-YOon_b9_b10-and-YOon_b10_b11-and-YOon_b11_b12-and-YOon_b12_b13-and-YOon_b13_b14-and-YOon_b14_b15-and-YOon_b15_b16) (val_Oon_b6_b7-and-YOon_b7_b8-and-YOon_b8_b9-and-YOon_b9_b10-and-YOon_b10_b11-and-YOon_b11_b12-and-YOon_b12_b13-and-YOon_b13_b14-and-YOon_b14_b15-and-YOon_b15_b16) (val_Oon_b7_b8-and-YOon_b8_b9-and-YOon_b9_b10-and-YOon_b10_b11-and-YOon_b11_b12-and-YOon_b12_b13-and-YOon_b13_b14-and-YOon_b14_b15-and-YOon_b15_b16) (val_Oon_b8_b9-and-YOon_b9_b10-and-YOon_b10_b11-and-YOon_b11_b12-and-YOon_b12_b13-and-YOon_b13_b14-and-YOon_b14_b15-and-YOon_b15_b16) (val_Oon_b9_b10-and-YOon_b10_b11-and-YOon_b11_b12-and-YOon_b12_b13-and-YOon_b13_b14-and-YOon_b14_b15-and-YOon_b15_b16) (val_YOon_b10_b11-and-YOon_b11_b12-and-YOon_b12_b13-and-YOon_b13_b14-and-YOon_b14_b15-and-YOon_b15_b16) (val_YOon_b11_b12-and-YOon_b12_b13-and-YOon_b13_b14-and-YOon_b14_b15-and-YOon_b15_b16) (val_YOon_b12_b13-and-YOon_b13_b14-and-YOon_b14_b15-and-YOon_b15_b16) (val_YOon_b13_b14-and-YOon_b14_b15-and-YOon_b15_b16) (val_YOon_b14_b15-and-YOon_b15_b16) (val_YOon_b15_b16) (val_YOon_b2_b3-and-YOon_b3_b4-and-YOon_b4_b5-and-YOon_b5_b6-and-YOon_b6_b7-and-YOon_b7_b8-and-YOon_b8_b9-and-YOon_b9_b10-and-YOon_b10_b11-and-YOon_b11_b12-and-YOon_b12_b13-and-YOon_b13_b14-and-YOon_b14_b15-and-YOon_b15_b16) (val_YOon_b3_b4-and-YOon_b4_b5-and-YOon_b5_b6-and-YOon_b6_b7-and-YOon_b7_b8-and-YOon_b8_b9-and-YOon_b9_b10-and-YOon_b10_b11-and-YOon_b11_b12-and-YOon_b12_b13-and-YOon_b13_b14-and-YOon_b14_b15-and-YOon_b15_b16) (val_YOon_b4_b5-and-YOon_b5_b6-and-YOon_b6_b7-and-YOon_b7_b8-and-YOon_b8_b9-and-YOon_b9_b10-and-YOon_b10_b11-and-YOon_b11_b12-and-YOon_b12_b13-and-YOon_b13_b14-and-YOon_b14_b15-and-YOon_b15_b16) (val_YOon_b5_b6-and-YOon_b6_b7-and-YOon_b7_b8-and-YOon_b8_b9-and-YOon_b9_b10-and-YOon_b10_b11-and-YOon_b11_b12-and-YOon_b12_b13-and-YOon_b13_b14-and-YOon_b14_b15-and-YOon_b15_b16) (val_YOon_b6_b7-and-YOon_b7_b8-and-YOon_b8_b9-and-YOon_b9_b10-and-YOon_b10_b11-and-YOon_b11_b12-and-YOon_b12_b13-and-YOon_b13_b14-and-YOon_b14_b15-and-YOon_b15_b16) (val_YOon_b7_b8-and-YOon_b8_b9-and-YOon_b9_b10-and-YOon_b10_b11-and-YOon_b11_b12-and-YOon_b12_b13-and-YOon_b13_b14-and-YOon_b14_b15-and-YOon_b15_b16) (val_YOon_b8_b9-and-YOon_b9_b10-and-YOon_b10_b11-and-YOon_b11_b12-and-YOon_b12_b13-and-YOon_b13_b14-and-YOon_b14_b15-and-YOon_b15_b16) (val_YOon_b9_b10-and-YOon_b10_b11-and-YOon_b11_b12-and-YOon_b12_b13-and-YOon_b13_b14-and-YOon_b14_b15-and-YOon_b15_b16) (val_on_b10_b11) (val_on_b10_b11-and-YOon_b11_b12-and-YOon_b12_b13-and-YOon_b13_b14-and-YOon_b14_b15-and-YOon_b15_b16) (val_on_b11_b12) (val_on_b11_b12-and-YOon_b12_b13-and-YOon_b13_b14-and-YOon_b14_b15-and-YOon_b15_b16) (val_on_b12_b13) (val_on_b12_b13-and-YOon_b13_b14-and-YOon_b14_b15-and-YOon_b15_b16) (val_on_b13_b14) (val_on_b13_b14-and-YOon_b14_b15-and-YOon_b15_b16) (val_on_b14_b15) (val_on_b14_b15-and-YOon_b15_b16) (val_on_b15_b16) (val_on_b1_b2) (val_on_b1_b2-and-YOon_b2_b3-and-YOon_b3_b4-and-YOon_b4_b5-and-YOon_b5_b6-and-YOon_b6_b7-and-YOon_b7_b8-and-YOon_b8_b9-and-YOon_b9_b10-and-YOon_b10_b11-and-YOon_b11_b12-and-YOon_b12_b13-and-YOon_b13_b14-and-YOon_b14_b15-and-YOon_b15_b16) (val_on_b2_b3) (val_on_b2_b3-and-YOon_b3_b4-and-YOon_b4_b5-and-YOon_b5_b6-and-YOon_b6_b7-and-YOon_b7_b8-and-YOon_b8_b9-and-YOon_b9_b10-and-YOon_b10_b11-and-YOon_b11_b12-and-YOon_b12_b13-and-YOon_b13_b14-and-YOon_b14_b15-and-YOon_b15_b16) (val_on_b3_b4) (val_on_b3_b4-and-YOon_b4_b5-and-YOon_b5_b6-and-YOon_b6_b7-and-YOon_b7_b8-and-YOon_b8_b9-and-YOon_b9_b10-and-YOon_b10_b11-and-YOon_b11_b12-and-YOon_b12_b13-and-YOon_b13_b14-and-YOon_b14_b15-and-YOon_b15_b16) (val_on_b4_b5) (val_on_b4_b5-and-YOon_b5_b6-and-YOon_b6_b7-and-YOon_b7_b8-and-YOon_b8_b9-and-YOon_b9_b10-and-YOon_b10_b11-and-YOon_b11_b12-and-YOon_b12_b13-and-YOon_b13_b14-and-YOon_b14_b15-and-YOon_b15_b16) (val_on_b5_b6) (val_on_b5_b6-and-YOon_b6_b7-and-YOon_b7_b8-and-YOon_b8_b9-and-YOon_b9_b10-and-YOon_b10_b11-and-YOon_b11_b12-and-YOon_b12_b13-and-YOon_b13_b14-and-YOon_b14_b15-and-YOon_b15_b16) (val_on_b6_b7) (val_on_b6_b7-and-YOon_b7_b8-and-YOon_b8_b9-and-YOon_b9_b10-and-YOon_b10_b11-and-YOon_b11_b12-and-YOon_b12_b13-and-YOon_b13_b14-and-YOon_b14_b15-and-YOon_b15_b16) (val_on_b7_b8) (val_on_b7_b8-and-YOon_b8_b9-and-YOon_b9_b10-and-YOon_b10_b11-and-YOon_b11_b12-and-YOon_b12_b13-and-YOon_b13_b14-and-YOon_b14_b15-and-YOon_b15_b16) (val_on_b8_b9) (val_on_b8_b9-and-YOon_b9_b10-and-YOon_b10_b11-and-YOon_b11_b12-and-YOon_b12_b13-and-YOon_b13_b14-and-YOon_b14_b15-and-YOon_b15_b16) (val_on_b9_b10) (val_on_b9_b10-and-YOon_b10_b11-and-YOon_b11_b12-and-YOon_b12_b13-and-YOon_b13_b14-and-YOon_b14_b15-and-YOon_b15_b16))
    (:derived (val_Oon_b10_b11-and-YOon_b11_b12-and-YOon_b12_b13-and-YOon_b13_b14-and-YOon_b14_b15-and-YOon_b15_b16) (or (val_on_b10_b11-and-YOon_b11_b12-and-YOon_b12_b13-and-YOon_b13_b14-and-YOon_b14_b15-and-YOon_b15_b16) (Oon_b10_b11-and-YOon_b11_b12-and-YOon_b12_b13-and-YOon_b13_b14-and-YOon_b14_b15-and-YOon_b15_b16)))
     (:derived (val_Oon_b11_b12-and-YOon_b12_b13-and-YOon_b13_b14-and-YOon_b14_b15-and-YOon_b15_b16) (or (val_on_b11_b12-and-YOon_b12_b13-and-YOon_b13_b14-and-YOon_b14_b15-and-YOon_b15_b16) (Oon_b11_b12-and-YOon_b12_b13-and-YOon_b13_b14-and-YOon_b14_b15-and-YOon_b15_b16)))
     (:derived (val_Oon_b12_b13-and-YOon_b13_b14-and-YOon_b14_b15-and-YOon_b15_b16) (or (val_on_b12_b13-and-YOon_b13_b14-and-YOon_b14_b15-and-YOon_b15_b16) (Oon_b12_b13-and-YOon_b13_b14-and-YOon_b14_b15-and-YOon_b15_b16)))
     (:derived (val_Oon_b13_b14-and-YOon_b14_b15-and-YOon_b15_b16) (or (val_on_b13_b14-and-YOon_b14_b15-and-YOon_b15_b16) (Oon_b13_b14-and-YOon_b14_b15-and-YOon_b15_b16)))
     (:derived (val_Oon_b14_b15-and-YOon_b15_b16) (or (val_on_b14_b15-and-YOon_b15_b16) (Oon_b14_b15-and-YOon_b15_b16)))
     (:derived (val_Oon_b15_b16) (or (val_on_b15_b16) (Oon_b15_b16)))
     (:derived (val_Oon_b1_b2-and-YOon_b2_b3-and-YOon_b3_b4-and-YOon_b4_b5-and-YOon_b5_b6-and-YOon_b6_b7-and-YOon_b7_b8-and-YOon_b8_b9-and-YOon_b9_b10-and-YOon_b10_b11-and-YOon_b11_b12-and-YOon_b12_b13-and-YOon_b13_b14-and-YOon_b14_b15-and-YOon_b15_b16) (or (val_on_b1_b2-and-YOon_b2_b3-and-YOon_b3_b4-and-YOon_b4_b5-and-YOon_b5_b6-and-YOon_b6_b7-and-YOon_b7_b8-and-YOon_b8_b9-and-YOon_b9_b10-and-YOon_b10_b11-and-YOon_b11_b12-and-YOon_b12_b13-and-YOon_b13_b14-and-YOon_b14_b15-and-YOon_b15_b16) (Oon_b1_b2-and-YOon_b2_b3-and-YOon_b3_b4-and-YOon_b4_b5-and-YOon_b5_b6-and-YOon_b6_b7-and-YOon_b7_b8-and-YOon_b8_b9-and-YOon_b9_b10-and-YOon_b10_b11-and-YOon_b11_b12-and-YOon_b12_b13-and-YOon_b13_b14-and-YOon_b14_b15-and-YOon_b15_b16)))
     (:derived (val_Oon_b2_b3-and-YOon_b3_b4-and-YOon_b4_b5-and-YOon_b5_b6-and-YOon_b6_b7-and-YOon_b7_b8-and-YOon_b8_b9-and-YOon_b9_b10-and-YOon_b10_b11-and-YOon_b11_b12-and-YOon_b12_b13-and-YOon_b13_b14-and-YOon_b14_b15-and-YOon_b15_b16) (or (val_on_b2_b3-and-YOon_b3_b4-and-YOon_b4_b5-and-YOon_b5_b6-and-YOon_b6_b7-and-YOon_b7_b8-and-YOon_b8_b9-and-YOon_b9_b10-and-YOon_b10_b11-and-YOon_b11_b12-and-YOon_b12_b13-and-YOon_b13_b14-and-YOon_b14_b15-and-YOon_b15_b16) (Oon_b2_b3-and-YOon_b3_b4-and-YOon_b4_b5-and-YOon_b5_b6-and-YOon_b6_b7-and-YOon_b7_b8-and-YOon_b8_b9-and-YOon_b9_b10-and-YOon_b10_b11-and-YOon_b11_b12-and-YOon_b12_b13-and-YOon_b13_b14-and-YOon_b14_b15-and-YOon_b15_b16)))
     (:derived (val_Oon_b3_b4-and-YOon_b4_b5-and-YOon_b5_b6-and-YOon_b6_b7-and-YOon_b7_b8-and-YOon_b8_b9-and-YOon_b9_b10-and-YOon_b10_b11-and-YOon_b11_b12-and-YOon_b12_b13-and-YOon_b13_b14-and-YOon_b14_b15-and-YOon_b15_b16) (or (val_on_b3_b4-and-YOon_b4_b5-and-YOon_b5_b6-and-YOon_b6_b7-and-YOon_b7_b8-and-YOon_b8_b9-and-YOon_b9_b10-and-YOon_b10_b11-and-YOon_b11_b12-and-YOon_b12_b13-and-YOon_b13_b14-and-YOon_b14_b15-and-YOon_b15_b16) (Oon_b3_b4-and-YOon_b4_b5-and-YOon_b5_b6-and-YOon_b6_b7-and-YOon_b7_b8-and-YOon_b8_b9-and-YOon_b9_b10-and-YOon_b10_b11-and-YOon_b11_b12-and-YOon_b12_b13-and-YOon_b13_b14-and-YOon_b14_b15-and-YOon_b15_b16)))
     (:derived (val_Oon_b4_b5-and-YOon_b5_b6-and-YOon_b6_b7-and-YOon_b7_b8-and-YOon_b8_b9-and-YOon_b9_b10-and-YOon_b10_b11-and-YOon_b11_b12-and-YOon_b12_b13-and-YOon_b13_b14-and-YOon_b14_b15-and-YOon_b15_b16) (or (val_on_b4_b5-and-YOon_b5_b6-and-YOon_b6_b7-and-YOon_b7_b8-and-YOon_b8_b9-and-YOon_b9_b10-and-YOon_b10_b11-and-YOon_b11_b12-and-YOon_b12_b13-and-YOon_b13_b14-and-YOon_b14_b15-and-YOon_b15_b16) (Oon_b4_b5-and-YOon_b5_b6-and-YOon_b6_b7-and-YOon_b7_b8-and-YOon_b8_b9-and-YOon_b9_b10-and-YOon_b10_b11-and-YOon_b11_b12-and-YOon_b12_b13-and-YOon_b13_b14-and-YOon_b14_b15-and-YOon_b15_b16)))
     (:derived (val_Oon_b5_b6-and-YOon_b6_b7-and-YOon_b7_b8-and-YOon_b8_b9-and-YOon_b9_b10-and-YOon_b10_b11-and-YOon_b11_b12-and-YOon_b12_b13-and-YOon_b13_b14-and-YOon_b14_b15-and-YOon_b15_b16) (or (val_on_b5_b6-and-YOon_b6_b7-and-YOon_b7_b8-and-YOon_b8_b9-and-YOon_b9_b10-and-YOon_b10_b11-and-YOon_b11_b12-and-YOon_b12_b13-and-YOon_b13_b14-and-YOon_b14_b15-and-YOon_b15_b16) (Oon_b5_b6-and-YOon_b6_b7-and-YOon_b7_b8-and-YOon_b8_b9-and-YOon_b9_b10-and-YOon_b10_b11-and-YOon_b11_b12-and-YOon_b12_b13-and-YOon_b13_b14-and-YOon_b14_b15-and-YOon_b15_b16)))
     (:derived (val_Oon_b6_b7-and-YOon_b7_b8-and-YOon_b8_b9-and-YOon_b9_b10-and-YOon_b10_b11-and-YOon_b11_b12-and-YOon_b12_b13-and-YOon_b13_b14-and-YOon_b14_b15-and-YOon_b15_b16) (or (val_on_b6_b7-and-YOon_b7_b8-and-YOon_b8_b9-and-YOon_b9_b10-and-YOon_b10_b11-and-YOon_b11_b12-and-YOon_b12_b13-and-YOon_b13_b14-and-YOon_b14_b15-and-YOon_b15_b16) (Oon_b6_b7-and-YOon_b7_b8-and-YOon_b8_b9-and-YOon_b9_b10-and-YOon_b10_b11-and-YOon_b11_b12-and-YOon_b12_b13-and-YOon_b13_b14-and-YOon_b14_b15-and-YOon_b15_b16)))
     (:derived (val_Oon_b7_b8-and-YOon_b8_b9-and-YOon_b9_b10-and-YOon_b10_b11-and-YOon_b11_b12-and-YOon_b12_b13-and-YOon_b13_b14-and-YOon_b14_b15-and-YOon_b15_b16) (or (val_on_b7_b8-and-YOon_b8_b9-and-YOon_b9_b10-and-YOon_b10_b11-and-YOon_b11_b12-and-YOon_b12_b13-and-YOon_b13_b14-and-YOon_b14_b15-and-YOon_b15_b16) (Oon_b7_b8-and-YOon_b8_b9-and-YOon_b9_b10-and-YOon_b10_b11-and-YOon_b11_b12-and-YOon_b12_b13-and-YOon_b13_b14-and-YOon_b14_b15-and-YOon_b15_b16)))
     (:derived (val_Oon_b8_b9-and-YOon_b9_b10-and-YOon_b10_b11-and-YOon_b11_b12-and-YOon_b12_b13-and-YOon_b13_b14-and-YOon_b14_b15-and-YOon_b15_b16) (or (val_on_b8_b9-and-YOon_b9_b10-and-YOon_b10_b11-and-YOon_b11_b12-and-YOon_b12_b13-and-YOon_b13_b14-and-YOon_b14_b15-and-YOon_b15_b16) (Oon_b8_b9-and-YOon_b9_b10-and-YOon_b10_b11-and-YOon_b11_b12-and-YOon_b12_b13-and-YOon_b13_b14-and-YOon_b14_b15-and-YOon_b15_b16)))
     (:derived (val_Oon_b9_b10-and-YOon_b10_b11-and-YOon_b11_b12-and-YOon_b12_b13-and-YOon_b13_b14-and-YOon_b14_b15-and-YOon_b15_b16) (or (val_on_b9_b10-and-YOon_b10_b11-and-YOon_b11_b12-and-YOon_b12_b13-and-YOon_b13_b14-and-YOon_b14_b15-and-YOon_b15_b16) (Oon_b9_b10-and-YOon_b10_b11-and-YOon_b11_b12-and-YOon_b12_b13-and-YOon_b13_b14-and-YOon_b14_b15-and-YOon_b15_b16)))
     (:derived (val_YOon_b10_b11-and-YOon_b11_b12-and-YOon_b12_b13-and-YOon_b13_b14-and-YOon_b14_b15-and-YOon_b15_b16) (Oon_b10_b11-and-YOon_b11_b12-and-YOon_b12_b13-and-YOon_b13_b14-and-YOon_b14_b15-and-YOon_b15_b16))
     (:derived (val_YOon_b11_b12-and-YOon_b12_b13-and-YOon_b13_b14-and-YOon_b14_b15-and-YOon_b15_b16) (Oon_b11_b12-and-YOon_b12_b13-and-YOon_b13_b14-and-YOon_b14_b15-and-YOon_b15_b16))
     (:derived (val_YOon_b12_b13-and-YOon_b13_b14-and-YOon_b14_b15-and-YOon_b15_b16) (Oon_b12_b13-and-YOon_b13_b14-and-YOon_b14_b15-and-YOon_b15_b16))
     (:derived (val_YOon_b13_b14-and-YOon_b14_b15-and-YOon_b15_b16) (Oon_b13_b14-and-YOon_b14_b15-and-YOon_b15_b16))
     (:derived (val_YOon_b14_b15-and-YOon_b15_b16) (Oon_b14_b15-and-YOon_b15_b16))
     (:derived (val_YOon_b15_b16) (Oon_b15_b16))
     (:derived (val_YOon_b2_b3-and-YOon_b3_b4-and-YOon_b4_b5-and-YOon_b5_b6-and-YOon_b6_b7-and-YOon_b7_b8-and-YOon_b8_b9-and-YOon_b9_b10-and-YOon_b10_b11-and-YOon_b11_b12-and-YOon_b12_b13-and-YOon_b13_b14-and-YOon_b14_b15-and-YOon_b15_b16) (Oon_b2_b3-and-YOon_b3_b4-and-YOon_b4_b5-and-YOon_b5_b6-and-YOon_b6_b7-and-YOon_b7_b8-and-YOon_b8_b9-and-YOon_b9_b10-and-YOon_b10_b11-and-YOon_b11_b12-and-YOon_b12_b13-and-YOon_b13_b14-and-YOon_b14_b15-and-YOon_b15_b16))
     (:derived (val_YOon_b3_b4-and-YOon_b4_b5-and-YOon_b5_b6-and-YOon_b6_b7-and-YOon_b7_b8-and-YOon_b8_b9-and-YOon_b9_b10-and-YOon_b10_b11-and-YOon_b11_b12-and-YOon_b12_b13-and-YOon_b13_b14-and-YOon_b14_b15-and-YOon_b15_b16) (Oon_b3_b4-and-YOon_b4_b5-and-YOon_b5_b6-and-YOon_b6_b7-and-YOon_b7_b8-and-YOon_b8_b9-and-YOon_b9_b10-and-YOon_b10_b11-and-YOon_b11_b12-and-YOon_b12_b13-and-YOon_b13_b14-and-YOon_b14_b15-and-YOon_b15_b16))
     (:derived (val_YOon_b4_b5-and-YOon_b5_b6-and-YOon_b6_b7-and-YOon_b7_b8-and-YOon_b8_b9-and-YOon_b9_b10-and-YOon_b10_b11-and-YOon_b11_b12-and-YOon_b12_b13-and-YOon_b13_b14-and-YOon_b14_b15-and-YOon_b15_b16) (Oon_b4_b5-and-YOon_b5_b6-and-YOon_b6_b7-and-YOon_b7_b8-and-YOon_b8_b9-and-YOon_b9_b10-and-YOon_b10_b11-and-YOon_b11_b12-and-YOon_b12_b13-and-YOon_b13_b14-and-YOon_b14_b15-and-YOon_b15_b16))
     (:derived (val_YOon_b5_b6-and-YOon_b6_b7-and-YOon_b7_b8-and-YOon_b8_b9-and-YOon_b9_b10-and-YOon_b10_b11-and-YOon_b11_b12-and-YOon_b12_b13-and-YOon_b13_b14-and-YOon_b14_b15-and-YOon_b15_b16) (Oon_b5_b6-and-YOon_b6_b7-and-YOon_b7_b8-and-YOon_b8_b9-and-YOon_b9_b10-and-YOon_b10_b11-and-YOon_b11_b12-and-YOon_b12_b13-and-YOon_b13_b14-and-YOon_b14_b15-and-YOon_b15_b16))
     (:derived (val_YOon_b6_b7-and-YOon_b7_b8-and-YOon_b8_b9-and-YOon_b9_b10-and-YOon_b10_b11-and-YOon_b11_b12-and-YOon_b12_b13-and-YOon_b13_b14-and-YOon_b14_b15-and-YOon_b15_b16) (Oon_b6_b7-and-YOon_b7_b8-and-YOon_b8_b9-and-YOon_b9_b10-and-YOon_b10_b11-and-YOon_b11_b12-and-YOon_b12_b13-and-YOon_b13_b14-and-YOon_b14_b15-and-YOon_b15_b16))
     (:derived (val_YOon_b7_b8-and-YOon_b8_b9-and-YOon_b9_b10-and-YOon_b10_b11-and-YOon_b11_b12-and-YOon_b12_b13-and-YOon_b13_b14-and-YOon_b14_b15-and-YOon_b15_b16) (Oon_b7_b8-and-YOon_b8_b9-and-YOon_b9_b10-and-YOon_b10_b11-and-YOon_b11_b12-and-YOon_b12_b13-and-YOon_b13_b14-and-YOon_b14_b15-and-YOon_b15_b16))
     (:derived (val_YOon_b8_b9-and-YOon_b9_b10-and-YOon_b10_b11-and-YOon_b11_b12-and-YOon_b12_b13-and-YOon_b13_b14-and-YOon_b14_b15-and-YOon_b15_b16) (Oon_b8_b9-and-YOon_b9_b10-and-YOon_b10_b11-and-YOon_b11_b12-and-YOon_b12_b13-and-YOon_b13_b14-and-YOon_b14_b15-and-YOon_b15_b16))
     (:derived (val_YOon_b9_b10-and-YOon_b10_b11-and-YOon_b11_b12-and-YOon_b12_b13-and-YOon_b13_b14-and-YOon_b14_b15-and-YOon_b15_b16) (Oon_b9_b10-and-YOon_b10_b11-and-YOon_b11_b12-and-YOon_b12_b13-and-YOon_b13_b14-and-YOon_b14_b15-and-YOon_b15_b16))
     (:derived (val_on_b10_b11) (on b10 b11))
     (:derived (val_on_b10_b11-and-YOon_b11_b12-and-YOon_b12_b13-and-YOon_b13_b14-and-YOon_b14_b15-and-YOon_b15_b16) (and (val_on_b10_b11) (val_YOon_b11_b12-and-YOon_b12_b13-and-YOon_b13_b14-and-YOon_b14_b15-and-YOon_b15_b16)))
     (:derived (val_on_b11_b12) (on b11 b12))
     (:derived (val_on_b11_b12-and-YOon_b12_b13-and-YOon_b13_b14-and-YOon_b14_b15-and-YOon_b15_b16) (and (val_on_b11_b12) (val_YOon_b12_b13-and-YOon_b13_b14-and-YOon_b14_b15-and-YOon_b15_b16)))
     (:derived (val_on_b12_b13) (on b12 b13))
     (:derived (val_on_b12_b13-and-YOon_b13_b14-and-YOon_b14_b15-and-YOon_b15_b16) (and (val_on_b12_b13) (val_YOon_b13_b14-and-YOon_b14_b15-and-YOon_b15_b16)))
     (:derived (val_on_b13_b14) (on b13 b14))
     (:derived (val_on_b13_b14-and-YOon_b14_b15-and-YOon_b15_b16) (and (val_on_b13_b14) (val_YOon_b14_b15-and-YOon_b15_b16)))
     (:derived (val_on_b14_b15) (on b14 b15))
     (:derived (val_on_b14_b15-and-YOon_b15_b16) (and (val_on_b14_b15) (val_YOon_b15_b16)))
     (:derived (val_on_b15_b16) (on b15 b16))
     (:derived (val_on_b1_b2) (on b1 b2))
     (:derived (val_on_b1_b2-and-YOon_b2_b3-and-YOon_b3_b4-and-YOon_b4_b5-and-YOon_b5_b6-and-YOon_b6_b7-and-YOon_b7_b8-and-YOon_b8_b9-and-YOon_b9_b10-and-YOon_b10_b11-and-YOon_b11_b12-and-YOon_b12_b13-and-YOon_b13_b14-and-YOon_b14_b15-and-YOon_b15_b16) (and (val_on_b1_b2) (val_YOon_b2_b3-and-YOon_b3_b4-and-YOon_b4_b5-and-YOon_b5_b6-and-YOon_b6_b7-and-YOon_b7_b8-and-YOon_b8_b9-and-YOon_b9_b10-and-YOon_b10_b11-and-YOon_b11_b12-and-YOon_b12_b13-and-YOon_b13_b14-and-YOon_b14_b15-and-YOon_b15_b16)))
     (:derived (val_on_b2_b3) (on b2 b3))
     (:derived (val_on_b2_b3-and-YOon_b3_b4-and-YOon_b4_b5-and-YOon_b5_b6-and-YOon_b6_b7-and-YOon_b7_b8-and-YOon_b8_b9-and-YOon_b9_b10-and-YOon_b10_b11-and-YOon_b11_b12-and-YOon_b12_b13-and-YOon_b13_b14-and-YOon_b14_b15-and-YOon_b15_b16) (and (val_on_b2_b3) (val_YOon_b3_b4-and-YOon_b4_b5-and-YOon_b5_b6-and-YOon_b6_b7-and-YOon_b7_b8-and-YOon_b8_b9-and-YOon_b9_b10-and-YOon_b10_b11-and-YOon_b11_b12-and-YOon_b12_b13-and-YOon_b13_b14-and-YOon_b14_b15-and-YOon_b15_b16)))
     (:derived (val_on_b3_b4) (on b3 b4))
     (:derived (val_on_b3_b4-and-YOon_b4_b5-and-YOon_b5_b6-and-YOon_b6_b7-and-YOon_b7_b8-and-YOon_b8_b9-and-YOon_b9_b10-and-YOon_b10_b11-and-YOon_b11_b12-and-YOon_b12_b13-and-YOon_b13_b14-and-YOon_b14_b15-and-YOon_b15_b16) (and (val_on_b3_b4) (val_YOon_b4_b5-and-YOon_b5_b6-and-YOon_b6_b7-and-YOon_b7_b8-and-YOon_b8_b9-and-YOon_b9_b10-and-YOon_b10_b11-and-YOon_b11_b12-and-YOon_b12_b13-and-YOon_b13_b14-and-YOon_b14_b15-and-YOon_b15_b16)))
     (:derived (val_on_b4_b5) (on b4 b5))
     (:derived (val_on_b4_b5-and-YOon_b5_b6-and-YOon_b6_b7-and-YOon_b7_b8-and-YOon_b8_b9-and-YOon_b9_b10-and-YOon_b10_b11-and-YOon_b11_b12-and-YOon_b12_b13-and-YOon_b13_b14-and-YOon_b14_b15-and-YOon_b15_b16) (and (val_on_b4_b5) (val_YOon_b5_b6-and-YOon_b6_b7-and-YOon_b7_b8-and-YOon_b8_b9-and-YOon_b9_b10-and-YOon_b10_b11-and-YOon_b11_b12-and-YOon_b12_b13-and-YOon_b13_b14-and-YOon_b14_b15-and-YOon_b15_b16)))
     (:derived (val_on_b5_b6) (on b5 b6))
     (:derived (val_on_b5_b6-and-YOon_b6_b7-and-YOon_b7_b8-and-YOon_b8_b9-and-YOon_b9_b10-and-YOon_b10_b11-and-YOon_b11_b12-and-YOon_b12_b13-and-YOon_b13_b14-and-YOon_b14_b15-and-YOon_b15_b16) (and (val_on_b5_b6) (val_YOon_b6_b7-and-YOon_b7_b8-and-YOon_b8_b9-and-YOon_b9_b10-and-YOon_b10_b11-and-YOon_b11_b12-and-YOon_b12_b13-and-YOon_b13_b14-and-YOon_b14_b15-and-YOon_b15_b16)))
     (:derived (val_on_b6_b7) (on b6 b7))
     (:derived (val_on_b6_b7-and-YOon_b7_b8-and-YOon_b8_b9-and-YOon_b9_b10-and-YOon_b10_b11-and-YOon_b11_b12-and-YOon_b12_b13-and-YOon_b13_b14-and-YOon_b14_b15-and-YOon_b15_b16) (and (val_on_b6_b7) (val_YOon_b7_b8-and-YOon_b8_b9-and-YOon_b9_b10-and-YOon_b10_b11-and-YOon_b11_b12-and-YOon_b12_b13-and-YOon_b13_b14-and-YOon_b14_b15-and-YOon_b15_b16)))
     (:derived (val_on_b7_b8) (on b7 b8))
     (:derived (val_on_b7_b8-and-YOon_b8_b9-and-YOon_b9_b10-and-YOon_b10_b11-and-YOon_b11_b12-and-YOon_b12_b13-and-YOon_b13_b14-and-YOon_b14_b15-and-YOon_b15_b16) (and (val_on_b7_b8) (val_YOon_b8_b9-and-YOon_b9_b10-and-YOon_b10_b11-and-YOon_b11_b12-and-YOon_b12_b13-and-YOon_b13_b14-and-YOon_b14_b15-and-YOon_b15_b16)))
     (:derived (val_on_b8_b9) (on b8 b9))
     (:derived (val_on_b8_b9-and-YOon_b9_b10-and-YOon_b10_b11-and-YOon_b11_b12-and-YOon_b12_b13-and-YOon_b13_b14-and-YOon_b14_b15-and-YOon_b15_b16) (and (val_on_b8_b9) (val_YOon_b9_b10-and-YOon_b10_b11-and-YOon_b11_b12-and-YOon_b12_b13-and-YOon_b13_b14-and-YOon_b14_b15-and-YOon_b15_b16)))
     (:derived (val_on_b9_b10) (on b9 b10))
     (:derived (val_on_b9_b10-and-YOon_b10_b11-and-YOon_b11_b12-and-YOon_b12_b13-and-YOon_b13_b14-and-YOon_b14_b15-and-YOon_b15_b16) (and (val_on_b9_b10) (val_YOon_b10_b11-and-YOon_b11_b12-and-YOon_b12_b13-and-YOon_b13_b14-and-YOon_b14_b15-and-YOon_b15_b16)))
    (:action pick-up
        :parameters (?x)
        :precondition (and (clear ?x) (ontable ?x) (emptyhand))
        :effect (and (and (not (ontable ?x)) (not (clear ?x)) (not (emptyhand)) (holding ?x)) (when (val_Oon_b3_b4-and-YOon_b4_b5-and-YOon_b5_b6-and-YOon_b6_b7-and-YOon_b7_b8-and-YOon_b8_b9-and-YOon_b9_b10-and-YOon_b10_b11-and-YOon_b11_b12-and-YOon_b12_b13-and-YOon_b13_b14-and-YOon_b14_b15-and-YOon_b15_b16) (Oon_b3_b4-and-YOon_b4_b5-and-YOon_b5_b6-and-YOon_b6_b7-and-YOon_b7_b8-and-YOon_b8_b9-and-YOon_b9_b10-and-YOon_b10_b11-and-YOon_b11_b12-and-YOon_b12_b13-and-YOon_b13_b14-and-YOon_b14_b15-and-YOon_b15_b16)) (when (val_Oon_b1_b2-and-YOon_b2_b3-and-YOon_b3_b4-and-YOon_b4_b5-and-YOon_b5_b6-and-YOon_b6_b7-and-YOon_b7_b8-and-YOon_b8_b9-and-YOon_b9_b10-and-YOon_b10_b11-and-YOon_b11_b12-and-YOon_b12_b13-and-YOon_b13_b14-and-YOon_b14_b15-and-YOon_b15_b16) (Oon_b1_b2-and-YOon_b2_b3-and-YOon_b3_b4-and-YOon_b4_b5-and-YOon_b5_b6-and-YOon_b6_b7-and-YOon_b7_b8-and-YOon_b8_b9-and-YOon_b9_b10-and-YOon_b10_b11-and-YOon_b11_b12-and-YOon_b12_b13-and-YOon_b13_b14-and-YOon_b14_b15-and-YOon_b15_b16)) (when (val_Oon_b6_b7-and-YOon_b7_b8-and-YOon_b8_b9-and-YOon_b9_b10-and-YOon_b10_b11-and-YOon_b11_b12-and-YOon_b12_b13-and-YOon_b13_b14-and-YOon_b14_b15-and-YOon_b15_b16) (Oon_b6_b7-and-YOon_b7_b8-and-YOon_b8_b9-and-YOon_b9_b10-and-YOon_b10_b11-and-YOon_b11_b12-and-YOon_b12_b13-and-YOon_b13_b14-and-YOon_b14_b15-and-YOon_b15_b16)) (when (val_Oon_b9_b10-and-YOon_b10_b11-and-YOon_b11_b12-and-YOon_b12_b13-and-YOon_b13_b14-and-YOon_b14_b15-and-YOon_b15_b16) (Oon_b9_b10-and-YOon_b10_b11-and-YOon_b11_b12-and-YOon_b12_b13-and-YOon_b13_b14-and-YOon_b14_b15-and-YOon_b15_b16)) (when (val_Oon_b10_b11-and-YOon_b11_b12-and-YOon_b12_b13-and-YOon_b13_b14-and-YOon_b14_b15-and-YOon_b15_b16) (Oon_b10_b11-and-YOon_b11_b12-and-YOon_b12_b13-and-YOon_b13_b14-and-YOon_b14_b15-and-YOon_b15_b16)) (when (val_Oon_b12_b13-and-YOon_b13_b14-and-YOon_b14_b15-and-YOon_b15_b16) (Oon_b12_b13-and-YOon_b13_b14-and-YOon_b14_b15-and-YOon_b15_b16)) (when (val_Oon_b13_b14-and-YOon_b14_b15-and-YOon_b15_b16) (Oon_b13_b14-and-YOon_b14_b15-and-YOon_b15_b16)) (when (val_Oon_b11_b12-and-YOon_b12_b13-and-YOon_b13_b14-and-YOon_b14_b15-and-YOon_b15_b16) (Oon_b11_b12-and-YOon_b12_b13-and-YOon_b13_b14-and-YOon_b14_b15-and-YOon_b15_b16)) (when (val_Oon_b8_b9-and-YOon_b9_b10-and-YOon_b10_b11-and-YOon_b11_b12-and-YOon_b12_b13-and-YOon_b13_b14-and-YOon_b14_b15-and-YOon_b15_b16) (Oon_b8_b9-and-YOon_b9_b10-and-YOon_b10_b11-and-YOon_b11_b12-and-YOon_b12_b13-and-YOon_b13_b14-and-YOon_b14_b15-and-YOon_b15_b16)) (when (val_Oon_b4_b5-and-YOon_b5_b6-and-YOon_b6_b7-and-YOon_b7_b8-and-YOon_b8_b9-and-YOon_b9_b10-and-YOon_b10_b11-and-YOon_b11_b12-and-YOon_b12_b13-and-YOon_b13_b14-and-YOon_b14_b15-and-YOon_b15_b16) (Oon_b4_b5-and-YOon_b5_b6-and-YOon_b6_b7-and-YOon_b7_b8-and-YOon_b8_b9-and-YOon_b9_b10-and-YOon_b10_b11-and-YOon_b11_b12-and-YOon_b12_b13-and-YOon_b13_b14-and-YOon_b14_b15-and-YOon_b15_b16)) (when (val_Oon_b14_b15-and-YOon_b15_b16) (Oon_b14_b15-and-YOon_b15_b16)) (when (val_Oon_b2_b3-and-YOon_b3_b4-and-YOon_b4_b5-and-YOon_b5_b6-and-YOon_b6_b7-and-YOon_b7_b8-and-YOon_b8_b9-and-YOon_b9_b10-and-YOon_b10_b11-and-YOon_b11_b12-and-YOon_b12_b13-and-YOon_b13_b14-and-YOon_b14_b15-and-YOon_b15_b16) (Oon_b2_b3-and-YOon_b3_b4-and-YOon_b4_b5-and-YOon_b5_b6-and-YOon_b6_b7-and-YOon_b7_b8-and-YOon_b8_b9-and-YOon_b9_b10-and-YOon_b10_b11-and-YOon_b11_b12-and-YOon_b12_b13-and-YOon_b13_b14-and-YOon_b14_b15-and-YOon_b15_b16)) (when (val_Oon_b5_b6-and-YOon_b6_b7-and-YOon_b7_b8-and-YOon_b8_b9-and-YOon_b9_b10-and-YOon_b10_b11-and-YOon_b11_b12-and-YOon_b12_b13-and-YOon_b13_b14-and-YOon_b14_b15-and-YOon_b15_b16) (Oon_b5_b6-and-YOon_b6_b7-and-YOon_b7_b8-and-YOon_b8_b9-and-YOon_b9_b10-and-YOon_b10_b11-and-YOon_b11_b12-and-YOon_b12_b13-and-YOon_b13_b14-and-YOon_b14_b15-and-YOon_b15_b16)) (when (val_Oon_b7_b8-and-YOon_b8_b9-and-YOon_b9_b10-and-YOon_b10_b11-and-YOon_b11_b12-and-YOon_b12_b13-and-YOon_b13_b14-and-YOon_b14_b15-and-YOon_b15_b16) (Oon_b7_b8-and-YOon_b8_b9-and-YOon_b9_b10-and-YOon_b10_b11-and-YOon_b11_b12-and-YOon_b12_b13-and-YOon_b13_b14-and-YOon_b14_b15-and-YOon_b15_b16)) (when (val_Oon_b15_b16) (Oon_b15_b16)))
    )
     (:action put-down
        :parameters (?x)
        :precondition (holding ?x)
        :effect (and (and (not (holding ?x)) (clear ?x) (emptyhand) (ontable ?x)) (when (val_Oon_b3_b4-and-YOon_b4_b5-and-YOon_b5_b6-and-YOon_b6_b7-and-YOon_b7_b8-and-YOon_b8_b9-and-YOon_b9_b10-and-YOon_b10_b11-and-YOon_b11_b12-and-YOon_b12_b13-and-YOon_b13_b14-and-YOon_b14_b15-and-YOon_b15_b16) (Oon_b3_b4-and-YOon_b4_b5-and-YOon_b5_b6-and-YOon_b6_b7-and-YOon_b7_b8-and-YOon_b8_b9-and-YOon_b9_b10-and-YOon_b10_b11-and-YOon_b11_b12-and-YOon_b12_b13-and-YOon_b13_b14-and-YOon_b14_b15-and-YOon_b15_b16)) (when (val_Oon_b1_b2-and-YOon_b2_b3-and-YOon_b3_b4-and-YOon_b4_b5-and-YOon_b5_b6-and-YOon_b6_b7-and-YOon_b7_b8-and-YOon_b8_b9-and-YOon_b9_b10-and-YOon_b10_b11-and-YOon_b11_b12-and-YOon_b12_b13-and-YOon_b13_b14-and-YOon_b14_b15-and-YOon_b15_b16) (Oon_b1_b2-and-YOon_b2_b3-and-YOon_b3_b4-and-YOon_b4_b5-and-YOon_b5_b6-and-YOon_b6_b7-and-YOon_b7_b8-and-YOon_b8_b9-and-YOon_b9_b10-and-YOon_b10_b11-and-YOon_b11_b12-and-YOon_b12_b13-and-YOon_b13_b14-and-YOon_b14_b15-and-YOon_b15_b16)) (when (val_Oon_b6_b7-and-YOon_b7_b8-and-YOon_b8_b9-and-YOon_b9_b10-and-YOon_b10_b11-and-YOon_b11_b12-and-YOon_b12_b13-and-YOon_b13_b14-and-YOon_b14_b15-and-YOon_b15_b16) (Oon_b6_b7-and-YOon_b7_b8-and-YOon_b8_b9-and-YOon_b9_b10-and-YOon_b10_b11-and-YOon_b11_b12-and-YOon_b12_b13-and-YOon_b13_b14-and-YOon_b14_b15-and-YOon_b15_b16)) (when (val_Oon_b9_b10-and-YOon_b10_b11-and-YOon_b11_b12-and-YOon_b12_b13-and-YOon_b13_b14-and-YOon_b14_b15-and-YOon_b15_b16) (Oon_b9_b10-and-YOon_b10_b11-and-YOon_b11_b12-and-YOon_b12_b13-and-YOon_b13_b14-and-YOon_b14_b15-and-YOon_b15_b16)) (when (val_Oon_b10_b11-and-YOon_b11_b12-and-YOon_b12_b13-and-YOon_b13_b14-and-YOon_b14_b15-and-YOon_b15_b16) (Oon_b10_b11-and-YOon_b11_b12-and-YOon_b12_b13-and-YOon_b13_b14-and-YOon_b14_b15-and-YOon_b15_b16)) (when (val_Oon_b12_b13-and-YOon_b13_b14-and-YOon_b14_b15-and-YOon_b15_b16) (Oon_b12_b13-and-YOon_b13_b14-and-YOon_b14_b15-and-YOon_b15_b16)) (when (val_Oon_b13_b14-and-YOon_b14_b15-and-YOon_b15_b16) (Oon_b13_b14-and-YOon_b14_b15-and-YOon_b15_b16)) (when (val_Oon_b11_b12-and-YOon_b12_b13-and-YOon_b13_b14-and-YOon_b14_b15-and-YOon_b15_b16) (Oon_b11_b12-and-YOon_b12_b13-and-YOon_b13_b14-and-YOon_b14_b15-and-YOon_b15_b16)) (when (val_Oon_b8_b9-and-YOon_b9_b10-and-YOon_b10_b11-and-YOon_b11_b12-and-YOon_b12_b13-and-YOon_b13_b14-and-YOon_b14_b15-and-YOon_b15_b16) (Oon_b8_b9-and-YOon_b9_b10-and-YOon_b10_b11-and-YOon_b11_b12-and-YOon_b12_b13-and-YOon_b13_b14-and-YOon_b14_b15-and-YOon_b15_b16)) (when (val_Oon_b4_b5-and-YOon_b5_b6-and-YOon_b6_b7-and-YOon_b7_b8-and-YOon_b8_b9-and-YOon_b9_b10-and-YOon_b10_b11-and-YOon_b11_b12-and-YOon_b12_b13-and-YOon_b13_b14-and-YOon_b14_b15-and-YOon_b15_b16) (Oon_b4_b5-and-YOon_b5_b6-and-YOon_b6_b7-and-YOon_b7_b8-and-YOon_b8_b9-and-YOon_b9_b10-and-YOon_b10_b11-and-YOon_b11_b12-and-YOon_b12_b13-and-YOon_b13_b14-and-YOon_b14_b15-and-YOon_b15_b16)) (when (val_Oon_b14_b15-and-YOon_b15_b16) (Oon_b14_b15-and-YOon_b15_b16)) (when (val_Oon_b2_b3-and-YOon_b3_b4-and-YOon_b4_b5-and-YOon_b5_b6-and-YOon_b6_b7-and-YOon_b7_b8-and-YOon_b8_b9-and-YOon_b9_b10-and-YOon_b10_b11-and-YOon_b11_b12-and-YOon_b12_b13-and-YOon_b13_b14-and-YOon_b14_b15-and-YOon_b15_b16) (Oon_b2_b3-and-YOon_b3_b4-and-YOon_b4_b5-and-YOon_b5_b6-and-YOon_b6_b7-and-YOon_b7_b8-and-YOon_b8_b9-and-YOon_b9_b10-and-YOon_b10_b11-and-YOon_b11_b12-and-YOon_b12_b13-and-YOon_b13_b14-and-YOon_b14_b15-and-YOon_b15_b16)) (when (val_Oon_b5_b6-and-YOon_b6_b7-and-YOon_b7_b8-and-YOon_b8_b9-and-YOon_b9_b10-and-YOon_b10_b11-and-YOon_b11_b12-and-YOon_b12_b13-and-YOon_b13_b14-and-YOon_b14_b15-and-YOon_b15_b16) (Oon_b5_b6-and-YOon_b6_b7-and-YOon_b7_b8-and-YOon_b8_b9-and-YOon_b9_b10-and-YOon_b10_b11-and-YOon_b11_b12-and-YOon_b12_b13-and-YOon_b13_b14-and-YOon_b14_b15-and-YOon_b15_b16)) (when (val_Oon_b7_b8-and-YOon_b8_b9-and-YOon_b9_b10-and-YOon_b10_b11-and-YOon_b11_b12-and-YOon_b12_b13-and-YOon_b13_b14-and-YOon_b14_b15-and-YOon_b15_b16) (Oon_b7_b8-and-YOon_b8_b9-and-YOon_b9_b10-and-YOon_b10_b11-and-YOon_b11_b12-and-YOon_b12_b13-and-YOon_b13_b14-and-YOon_b14_b15-and-YOon_b15_b16)) (when (val_Oon_b15_b16) (Oon_b15_b16)))
    )
     (:action stack
        :parameters (?x ?y)
        :precondition (and (holding ?x) (clear ?y))
        :effect (and (and (not (holding ?x)) (not (clear ?y)) (clear ?x) (emptyhand) (on ?x ?y)) (when (val_Oon_b3_b4-and-YOon_b4_b5-and-YOon_b5_b6-and-YOon_b6_b7-and-YOon_b7_b8-and-YOon_b8_b9-and-YOon_b9_b10-and-YOon_b10_b11-and-YOon_b11_b12-and-YOon_b12_b13-and-YOon_b13_b14-and-YOon_b14_b15-and-YOon_b15_b16) (Oon_b3_b4-and-YOon_b4_b5-and-YOon_b5_b6-and-YOon_b6_b7-and-YOon_b7_b8-and-YOon_b8_b9-and-YOon_b9_b10-and-YOon_b10_b11-and-YOon_b11_b12-and-YOon_b12_b13-and-YOon_b13_b14-and-YOon_b14_b15-and-YOon_b15_b16)) (when (val_Oon_b1_b2-and-YOon_b2_b3-and-YOon_b3_b4-and-YOon_b4_b5-and-YOon_b5_b6-and-YOon_b6_b7-and-YOon_b7_b8-and-YOon_b8_b9-and-YOon_b9_b10-and-YOon_b10_b11-and-YOon_b11_b12-and-YOon_b12_b13-and-YOon_b13_b14-and-YOon_b14_b15-and-YOon_b15_b16) (Oon_b1_b2-and-YOon_b2_b3-and-YOon_b3_b4-and-YOon_b4_b5-and-YOon_b5_b6-and-YOon_b6_b7-and-YOon_b7_b8-and-YOon_b8_b9-and-YOon_b9_b10-and-YOon_b10_b11-and-YOon_b11_b12-and-YOon_b12_b13-and-YOon_b13_b14-and-YOon_b14_b15-and-YOon_b15_b16)) (when (val_Oon_b6_b7-and-YOon_b7_b8-and-YOon_b8_b9-and-YOon_b9_b10-and-YOon_b10_b11-and-YOon_b11_b12-and-YOon_b12_b13-and-YOon_b13_b14-and-YOon_b14_b15-and-YOon_b15_b16) (Oon_b6_b7-and-YOon_b7_b8-and-YOon_b8_b9-and-YOon_b9_b10-and-YOon_b10_b11-and-YOon_b11_b12-and-YOon_b12_b13-and-YOon_b13_b14-and-YOon_b14_b15-and-YOon_b15_b16)) (when (val_Oon_b9_b10-and-YOon_b10_b11-and-YOon_b11_b12-and-YOon_b12_b13-and-YOon_b13_b14-and-YOon_b14_b15-and-YOon_b15_b16) (Oon_b9_b10-and-YOon_b10_b11-and-YOon_b11_b12-and-YOon_b12_b13-and-YOon_b13_b14-and-YOon_b14_b15-and-YOon_b15_b16)) (when (val_Oon_b10_b11-and-YOon_b11_b12-and-YOon_b12_b13-and-YOon_b13_b14-and-YOon_b14_b15-and-YOon_b15_b16) (Oon_b10_b11-and-YOon_b11_b12-and-YOon_b12_b13-and-YOon_b13_b14-and-YOon_b14_b15-and-YOon_b15_b16)) (when (val_Oon_b12_b13-and-YOon_b13_b14-and-YOon_b14_b15-and-YOon_b15_b16) (Oon_b12_b13-and-YOon_b13_b14-and-YOon_b14_b15-and-YOon_b15_b16)) (when (val_Oon_b13_b14-and-YOon_b14_b15-and-YOon_b15_b16) (Oon_b13_b14-and-YOon_b14_b15-and-YOon_b15_b16)) (when (val_Oon_b11_b12-and-YOon_b12_b13-and-YOon_b13_b14-and-YOon_b14_b15-and-YOon_b15_b16) (Oon_b11_b12-and-YOon_b12_b13-and-YOon_b13_b14-and-YOon_b14_b15-and-YOon_b15_b16)) (when (val_Oon_b8_b9-and-YOon_b9_b10-and-YOon_b10_b11-and-YOon_b11_b12-and-YOon_b12_b13-and-YOon_b13_b14-and-YOon_b14_b15-and-YOon_b15_b16) (Oon_b8_b9-and-YOon_b9_b10-and-YOon_b10_b11-and-YOon_b11_b12-and-YOon_b12_b13-and-YOon_b13_b14-and-YOon_b14_b15-and-YOon_b15_b16)) (when (val_Oon_b4_b5-and-YOon_b5_b6-and-YOon_b6_b7-and-YOon_b7_b8-and-YOon_b8_b9-and-YOon_b9_b10-and-YOon_b10_b11-and-YOon_b11_b12-and-YOon_b12_b13-and-YOon_b13_b14-and-YOon_b14_b15-and-YOon_b15_b16) (Oon_b4_b5-and-YOon_b5_b6-and-YOon_b6_b7-and-YOon_b7_b8-and-YOon_b8_b9-and-YOon_b9_b10-and-YOon_b10_b11-and-YOon_b11_b12-and-YOon_b12_b13-and-YOon_b13_b14-and-YOon_b14_b15-and-YOon_b15_b16)) (when (val_Oon_b14_b15-and-YOon_b15_b16) (Oon_b14_b15-and-YOon_b15_b16)) (when (val_Oon_b2_b3-and-YOon_b3_b4-and-YOon_b4_b5-and-YOon_b5_b6-and-YOon_b6_b7-and-YOon_b7_b8-and-YOon_b8_b9-and-YOon_b9_b10-and-YOon_b10_b11-and-YOon_b11_b12-and-YOon_b12_b13-and-YOon_b13_b14-and-YOon_b14_b15-and-YOon_b15_b16) (Oon_b2_b3-and-YOon_b3_b4-and-YOon_b4_b5-and-YOon_b5_b6-and-YOon_b6_b7-and-YOon_b7_b8-and-YOon_b8_b9-and-YOon_b9_b10-and-YOon_b10_b11-and-YOon_b11_b12-and-YOon_b12_b13-and-YOon_b13_b14-and-YOon_b14_b15-and-YOon_b15_b16)) (when (val_Oon_b5_b6-and-YOon_b6_b7-and-YOon_b7_b8-and-YOon_b8_b9-and-YOon_b9_b10-and-YOon_b10_b11-and-YOon_b11_b12-and-YOon_b12_b13-and-YOon_b13_b14-and-YOon_b14_b15-and-YOon_b15_b16) (Oon_b5_b6-and-YOon_b6_b7-and-YOon_b7_b8-and-YOon_b8_b9-and-YOon_b9_b10-and-YOon_b10_b11-and-YOon_b11_b12-and-YOon_b12_b13-and-YOon_b13_b14-and-YOon_b14_b15-and-YOon_b15_b16)) (when (val_Oon_b7_b8-and-YOon_b8_b9-and-YOon_b9_b10-and-YOon_b10_b11-and-YOon_b11_b12-and-YOon_b12_b13-and-YOon_b13_b14-and-YOon_b14_b15-and-YOon_b15_b16) (Oon_b7_b8-and-YOon_b8_b9-and-YOon_b9_b10-and-YOon_b10_b11-and-YOon_b11_b12-and-YOon_b12_b13-and-YOon_b13_b14-and-YOon_b14_b15-and-YOon_b15_b16)) (when (val_Oon_b15_b16) (Oon_b15_b16)))
    )
     (:action unstack
        :parameters (?x ?y)
        :precondition (and (on ?x ?y) (clear ?x) (emptyhand))
        :effect (and (and (holding ?x) (clear ?y) (not (clear ?x)) (not (emptyhand)) (not (on ?x ?y))) (when (val_Oon_b3_b4-and-YOon_b4_b5-and-YOon_b5_b6-and-YOon_b6_b7-and-YOon_b7_b8-and-YOon_b8_b9-and-YOon_b9_b10-and-YOon_b10_b11-and-YOon_b11_b12-and-YOon_b12_b13-and-YOon_b13_b14-and-YOon_b14_b15-and-YOon_b15_b16) (Oon_b3_b4-and-YOon_b4_b5-and-YOon_b5_b6-and-YOon_b6_b7-and-YOon_b7_b8-and-YOon_b8_b9-and-YOon_b9_b10-and-YOon_b10_b11-and-YOon_b11_b12-and-YOon_b12_b13-and-YOon_b13_b14-and-YOon_b14_b15-and-YOon_b15_b16)) (when (val_Oon_b1_b2-and-YOon_b2_b3-and-YOon_b3_b4-and-YOon_b4_b5-and-YOon_b5_b6-and-YOon_b6_b7-and-YOon_b7_b8-and-YOon_b8_b9-and-YOon_b9_b10-and-YOon_b10_b11-and-YOon_b11_b12-and-YOon_b12_b13-and-YOon_b13_b14-and-YOon_b14_b15-and-YOon_b15_b16) (Oon_b1_b2-and-YOon_b2_b3-and-YOon_b3_b4-and-YOon_b4_b5-and-YOon_b5_b6-and-YOon_b6_b7-and-YOon_b7_b8-and-YOon_b8_b9-and-YOon_b9_b10-and-YOon_b10_b11-and-YOon_b11_b12-and-YOon_b12_b13-and-YOon_b13_b14-and-YOon_b14_b15-and-YOon_b15_b16)) (when (val_Oon_b6_b7-and-YOon_b7_b8-and-YOon_b8_b9-and-YOon_b9_b10-and-YOon_b10_b11-and-YOon_b11_b12-and-YOon_b12_b13-and-YOon_b13_b14-and-YOon_b14_b15-and-YOon_b15_b16) (Oon_b6_b7-and-YOon_b7_b8-and-YOon_b8_b9-and-YOon_b9_b10-and-YOon_b10_b11-and-YOon_b11_b12-and-YOon_b12_b13-and-YOon_b13_b14-and-YOon_b14_b15-and-YOon_b15_b16)) (when (val_Oon_b9_b10-and-YOon_b10_b11-and-YOon_b11_b12-and-YOon_b12_b13-and-YOon_b13_b14-and-YOon_b14_b15-and-YOon_b15_b16) (Oon_b9_b10-and-YOon_b10_b11-and-YOon_b11_b12-and-YOon_b12_b13-and-YOon_b13_b14-and-YOon_b14_b15-and-YOon_b15_b16)) (when (val_Oon_b10_b11-and-YOon_b11_b12-and-YOon_b12_b13-and-YOon_b13_b14-and-YOon_b14_b15-and-YOon_b15_b16) (Oon_b10_b11-and-YOon_b11_b12-and-YOon_b12_b13-and-YOon_b13_b14-and-YOon_b14_b15-and-YOon_b15_b16)) (when (val_Oon_b12_b13-and-YOon_b13_b14-and-YOon_b14_b15-and-YOon_b15_b16) (Oon_b12_b13-and-YOon_b13_b14-and-YOon_b14_b15-and-YOon_b15_b16)) (when (val_Oon_b13_b14-and-YOon_b14_b15-and-YOon_b15_b16) (Oon_b13_b14-and-YOon_b14_b15-and-YOon_b15_b16)) (when (val_Oon_b11_b12-and-YOon_b12_b13-and-YOon_b13_b14-and-YOon_b14_b15-and-YOon_b15_b16) (Oon_b11_b12-and-YOon_b12_b13-and-YOon_b13_b14-and-YOon_b14_b15-and-YOon_b15_b16)) (when (val_Oon_b8_b9-and-YOon_b9_b10-and-YOon_b10_b11-and-YOon_b11_b12-and-YOon_b12_b13-and-YOon_b13_b14-and-YOon_b14_b15-and-YOon_b15_b16) (Oon_b8_b9-and-YOon_b9_b10-and-YOon_b10_b11-and-YOon_b11_b12-and-YOon_b12_b13-and-YOon_b13_b14-and-YOon_b14_b15-and-YOon_b15_b16)) (when (val_Oon_b4_b5-and-YOon_b5_b6-and-YOon_b6_b7-and-YOon_b7_b8-and-YOon_b8_b9-and-YOon_b9_b10-and-YOon_b10_b11-and-YOon_b11_b12-and-YOon_b12_b13-and-YOon_b13_b14-and-YOon_b14_b15-and-YOon_b15_b16) (Oon_b4_b5-and-YOon_b5_b6-and-YOon_b6_b7-and-YOon_b7_b8-and-YOon_b8_b9-and-YOon_b9_b10-and-YOon_b10_b11-and-YOon_b11_b12-and-YOon_b12_b13-and-YOon_b13_b14-and-YOon_b14_b15-and-YOon_b15_b16)) (when (val_Oon_b14_b15-and-YOon_b15_b16) (Oon_b14_b15-and-YOon_b15_b16)) (when (val_Oon_b2_b3-and-YOon_b3_b4-and-YOon_b4_b5-and-YOon_b5_b6-and-YOon_b6_b7-and-YOon_b7_b8-and-YOon_b8_b9-and-YOon_b9_b10-and-YOon_b10_b11-and-YOon_b11_b12-and-YOon_b12_b13-and-YOon_b13_b14-and-YOon_b14_b15-and-YOon_b15_b16) (Oon_b2_b3-and-YOon_b3_b4-and-YOon_b4_b5-and-YOon_b5_b6-and-YOon_b6_b7-and-YOon_b7_b8-and-YOon_b8_b9-and-YOon_b9_b10-and-YOon_b10_b11-and-YOon_b11_b12-and-YOon_b12_b13-and-YOon_b13_b14-and-YOon_b14_b15-and-YOon_b15_b16)) (when (val_Oon_b5_b6-and-YOon_b6_b7-and-YOon_b7_b8-and-YOon_b8_b9-and-YOon_b9_b10-and-YOon_b10_b11-and-YOon_b11_b12-and-YOon_b12_b13-and-YOon_b13_b14-and-YOon_b14_b15-and-YOon_b15_b16) (Oon_b5_b6-and-YOon_b6_b7-and-YOon_b7_b8-and-YOon_b8_b9-and-YOon_b9_b10-and-YOon_b10_b11-and-YOon_b11_b12-and-YOon_b12_b13-and-YOon_b13_b14-and-YOon_b14_b15-and-YOon_b15_b16)) (when (val_Oon_b7_b8-and-YOon_b8_b9-and-YOon_b9_b10-and-YOon_b10_b11-and-YOon_b11_b12-and-YOon_b12_b13-and-YOon_b13_b14-and-YOon_b14_b15-and-YOon_b15_b16) (Oon_b7_b8-and-YOon_b8_b9-and-YOon_b9_b10-and-YOon_b10_b11-and-YOon_b11_b12-and-YOon_b12_b13-and-YOon_b13_b14-and-YOon_b14_b15-and-YOon_b15_b16)) (when (val_Oon_b15_b16) (Oon_b15_b16)))
    )
)