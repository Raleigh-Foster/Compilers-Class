{-# OPTIONS_GHC -w #-}
module Main where    

import Tokens
import qualified Data.HashMap.Strict as HashMap
import Control.Applicative(Applicative(..))
import Control.Monad (ap)

-- parser produced by Happy Version 1.19.5

data HappyAbsSyn t4 t5 t6 t7 t8 t9 t10 t11 t12 t13 t14 t15 t16 t17 t18 t19 t20
	= HappyTerminal (Token)
	| HappyErrorToken Int
	| HappyAbsSyn4 t4
	| HappyAbsSyn5 t5
	| HappyAbsSyn6 t6
	| HappyAbsSyn7 t7
	| HappyAbsSyn8 t8
	| HappyAbsSyn9 t9
	| HappyAbsSyn10 t10
	| HappyAbsSyn11 t11
	| HappyAbsSyn12 t12
	| HappyAbsSyn13 t13
	| HappyAbsSyn14 t14
	| HappyAbsSyn15 t15
	| HappyAbsSyn16 t16
	| HappyAbsSyn17 t17
	| HappyAbsSyn18 t18
	| HappyAbsSyn19 t19
	| HappyAbsSyn20 t20

action_0 (21) = happyShift action_5
action_0 (4) = happyGoto action_6
action_0 (5) = happyGoto action_2
action_0 (7) = happyGoto action_3
action_0 (8) = happyGoto action_4
action_0 _ = happyReduce_2

action_1 (21) = happyShift action_5
action_1 (5) = happyGoto action_2
action_1 (7) = happyGoto action_3
action_1 (8) = happyGoto action_4
action_1 _ = happyFail

action_2 (22) = happyShift action_15
action_2 (26) = happyShift action_16
action_2 (27) = happyShift action_17
action_2 (29) = happyShift action_18
action_2 (38) = happyShift action_19
action_2 (43) = happyShift action_20
action_2 (44) = happyShift action_21
action_2 (53) = happyShift action_22
action_2 (6) = happyGoto action_11
action_2 (10) = happyGoto action_12
action_2 (13) = happyGoto action_13
action_2 (16) = happyGoto action_14
action_2 _ = happyReduce_4

action_3 (21) = happyShift action_5
action_3 (5) = happyGoto action_10
action_3 (7) = happyGoto action_3
action_3 (8) = happyGoto action_4
action_3 _ = happyReduce_2

action_4 (31) = happyShift action_9
action_4 (9) = happyGoto action_8
action_4 _ = happyFail

action_5 (27) = happyShift action_7
action_5 _ = happyFail

action_6 (55) = happyAccept
action_6 _ = happyFail

action_7 (29) = happyShift action_48
action_7 _ = happyFail

action_8 _ = happyReduce_6

action_9 (22) = happyShift action_15
action_9 (26) = happyShift action_16
action_9 (27) = happyShift action_17
action_9 (29) = happyShift action_18
action_9 (38) = happyShift action_19
action_9 (43) = happyShift action_20
action_9 (44) = happyShift action_21
action_9 (53) = happyShift action_22
action_9 (6) = happyGoto action_47
action_9 (10) = happyGoto action_12
action_9 (13) = happyGoto action_13
action_9 (16) = happyGoto action_14
action_9 _ = happyReduce_4

action_10 _ = happyReduce_3

action_11 _ = happyReduce_1

action_12 (22) = happyShift action_15
action_12 (26) = happyShift action_16
action_12 (27) = happyShift action_17
action_12 (29) = happyShift action_18
action_12 (38) = happyShift action_19
action_12 (43) = happyShift action_20
action_12 (44) = happyShift action_21
action_12 (53) = happyShift action_22
action_12 (6) = happyGoto action_46
action_12 (10) = happyGoto action_12
action_12 (13) = happyGoto action_13
action_12 (16) = happyGoto action_14
action_12 _ = happyReduce_4

action_13 (34) = happyShift action_33
action_13 (35) = happyShift action_34
action_13 (39) = happyShift action_35
action_13 (40) = happyShift action_36
action_13 (41) = happyShift action_37
action_13 (42) = happyShift action_38
action_13 (46) = happyShift action_39
action_13 (47) = happyShift action_40
action_13 (48) = happyShift action_41
action_13 (49) = happyShift action_42
action_13 (50) = happyShift action_43
action_13 (51) = happyShift action_44
action_13 (52) = happyShift action_45
action_13 _ = happyFail

action_14 (28) = happyShift action_31
action_14 (36) = happyShift action_32
action_14 _ = happyReduce_23

action_15 (27) = happyShift action_17
action_15 (29) = happyShift action_18
action_15 (43) = happyShift action_20
action_15 (44) = happyShift action_21
action_15 (53) = happyShift action_22
action_15 (13) = happyGoto action_30
action_15 (16) = happyGoto action_24
action_15 _ = happyFail

action_16 (27) = happyShift action_17
action_16 (29) = happyShift action_18
action_16 (43) = happyShift action_20
action_16 (44) = happyShift action_21
action_16 (53) = happyShift action_22
action_16 (13) = happyGoto action_29
action_16 (16) = happyGoto action_24
action_16 _ = happyFail

action_17 (29) = happyShift action_28
action_17 _ = happyReduce_43

action_18 (27) = happyShift action_17
action_18 (29) = happyShift action_18
action_18 (43) = happyShift action_20
action_18 (44) = happyShift action_21
action_18 (53) = happyShift action_22
action_18 (13) = happyGoto action_27
action_18 (16) = happyGoto action_24
action_18 _ = happyFail

action_19 (27) = happyShift action_17
action_19 (29) = happyShift action_18
action_19 (34) = happyShift action_26
action_19 (43) = happyShift action_20
action_19 (44) = happyShift action_21
action_19 (53) = happyShift action_22
action_19 (13) = happyGoto action_25
action_19 (16) = happyGoto action_24
action_19 _ = happyFail

action_20 _ = happyReduce_21

action_21 _ = happyReduce_22

action_22 (27) = happyShift action_17
action_22 (29) = happyShift action_18
action_22 (43) = happyShift action_20
action_22 (44) = happyShift action_21
action_22 (53) = happyShift action_22
action_22 (13) = happyGoto action_23
action_22 (16) = happyGoto action_24
action_22 _ = happyFail

action_23 (35) = happyShift action_34
action_23 (51) = happyShift action_44
action_23 (52) = happyShift action_45
action_23 _ = happyReduce_36

action_24 _ = happyReduce_23

action_25 (34) = happyShift action_73
action_25 (35) = happyShift action_34
action_25 (39) = happyShift action_35
action_25 (40) = happyShift action_36
action_25 (41) = happyShift action_37
action_25 (42) = happyShift action_38
action_25 (46) = happyShift action_39
action_25 (47) = happyShift action_40
action_25 (48) = happyShift action_41
action_25 (49) = happyShift action_42
action_25 (50) = happyShift action_43
action_25 (51) = happyShift action_44
action_25 (52) = happyShift action_45
action_25 _ = happyFail

action_26 _ = happyReduce_14

action_27 (30) = happyShift action_72
action_27 (35) = happyShift action_34
action_27 (39) = happyShift action_35
action_27 (40) = happyShift action_36
action_27 (41) = happyShift action_37
action_27 (42) = happyShift action_38
action_27 (46) = happyShift action_39
action_27 (47) = happyShift action_40
action_27 (48) = happyShift action_41
action_27 (49) = happyShift action_42
action_27 (50) = happyShift action_43
action_27 (51) = happyShift action_44
action_27 (52) = happyShift action_45
action_27 _ = happyFail

action_28 (27) = happyShift action_17
action_28 (29) = happyShift action_18
action_28 (43) = happyShift action_20
action_28 (44) = happyShift action_21
action_28 (53) = happyShift action_22
action_28 (13) = happyGoto action_70
action_28 (14) = happyGoto action_71
action_28 (16) = happyGoto action_24
action_28 _ = happyReduce_39

action_29 (31) = happyShift action_69
action_29 (35) = happyShift action_34
action_29 (39) = happyShift action_35
action_29 (40) = happyShift action_36
action_29 (41) = happyShift action_37
action_29 (42) = happyShift action_38
action_29 (46) = happyShift action_39
action_29 (47) = happyShift action_40
action_29 (48) = happyShift action_41
action_29 (49) = happyShift action_42
action_29 (50) = happyShift action_43
action_29 (51) = happyShift action_44
action_29 (52) = happyShift action_45
action_29 _ = happyFail

action_30 (31) = happyShift action_68
action_30 (35) = happyShift action_34
action_30 (39) = happyShift action_35
action_30 (40) = happyShift action_36
action_30 (41) = happyShift action_37
action_30 (42) = happyShift action_38
action_30 (46) = happyShift action_39
action_30 (47) = happyShift action_40
action_30 (48) = happyShift action_41
action_30 (49) = happyShift action_42
action_30 (50) = happyShift action_43
action_30 (51) = happyShift action_44
action_30 (52) = happyShift action_45
action_30 _ = happyFail

action_31 (27) = happyShift action_67
action_31 _ = happyFail

action_32 (27) = happyShift action_17
action_32 (29) = happyShift action_18
action_32 (43) = happyShift action_20
action_32 (44) = happyShift action_21
action_32 (53) = happyShift action_22
action_32 (13) = happyGoto action_66
action_32 (16) = happyGoto action_24
action_32 _ = happyFail

action_33 _ = happyReduce_17

action_34 (27) = happyShift action_65
action_34 _ = happyFail

action_35 (27) = happyShift action_17
action_35 (29) = happyShift action_18
action_35 (43) = happyShift action_20
action_35 (44) = happyShift action_21
action_35 (53) = happyShift action_22
action_35 (13) = happyGoto action_64
action_35 (16) = happyGoto action_24
action_35 _ = happyFail

action_36 (27) = happyShift action_17
action_36 (29) = happyShift action_18
action_36 (43) = happyShift action_20
action_36 (44) = happyShift action_21
action_36 (53) = happyShift action_22
action_36 (13) = happyGoto action_63
action_36 (16) = happyGoto action_24
action_36 _ = happyFail

action_37 (27) = happyShift action_17
action_37 (29) = happyShift action_18
action_37 (43) = happyShift action_20
action_37 (44) = happyShift action_21
action_37 (53) = happyShift action_22
action_37 (13) = happyGoto action_62
action_37 (16) = happyGoto action_24
action_37 _ = happyFail

action_38 (27) = happyShift action_17
action_38 (29) = happyShift action_18
action_38 (43) = happyShift action_20
action_38 (44) = happyShift action_21
action_38 (53) = happyShift action_22
action_38 (13) = happyGoto action_61
action_38 (16) = happyGoto action_24
action_38 _ = happyFail

action_39 (27) = happyShift action_17
action_39 (29) = happyShift action_18
action_39 (43) = happyShift action_20
action_39 (44) = happyShift action_21
action_39 (53) = happyShift action_22
action_39 (13) = happyGoto action_60
action_39 (16) = happyGoto action_24
action_39 _ = happyFail

action_40 (27) = happyShift action_17
action_40 (29) = happyShift action_18
action_40 (43) = happyShift action_20
action_40 (44) = happyShift action_21
action_40 (53) = happyShift action_22
action_40 (13) = happyGoto action_59
action_40 (16) = happyGoto action_24
action_40 _ = happyFail

action_41 (27) = happyShift action_17
action_41 (29) = happyShift action_18
action_41 (43) = happyShift action_20
action_41 (44) = happyShift action_21
action_41 (53) = happyShift action_22
action_41 (13) = happyGoto action_58
action_41 (16) = happyGoto action_24
action_41 _ = happyFail

action_42 (27) = happyShift action_17
action_42 (29) = happyShift action_18
action_42 (43) = happyShift action_20
action_42 (44) = happyShift action_21
action_42 (53) = happyShift action_22
action_42 (13) = happyGoto action_57
action_42 (16) = happyGoto action_24
action_42 _ = happyFail

action_43 (27) = happyShift action_17
action_43 (29) = happyShift action_18
action_43 (43) = happyShift action_20
action_43 (44) = happyShift action_21
action_43 (53) = happyShift action_22
action_43 (13) = happyGoto action_56
action_43 (16) = happyGoto action_24
action_43 _ = happyFail

action_44 (27) = happyShift action_17
action_44 (29) = happyShift action_18
action_44 (43) = happyShift action_20
action_44 (44) = happyShift action_21
action_44 (53) = happyShift action_22
action_44 (13) = happyGoto action_55
action_44 (16) = happyGoto action_24
action_44 _ = happyFail

action_45 (27) = happyShift action_17
action_45 (29) = happyShift action_18
action_45 (43) = happyShift action_20
action_45 (44) = happyShift action_21
action_45 (53) = happyShift action_22
action_45 (13) = happyGoto action_54
action_45 (16) = happyGoto action_24
action_45 _ = happyFail

action_46 _ = happyReduce_5

action_47 (37) = happyShift action_53
action_47 (19) = happyGoto action_51
action_47 (20) = happyGoto action_52
action_47 _ = happyReduce_49

action_48 (27) = happyShift action_50
action_48 (17) = happyGoto action_49
action_48 _ = happyReduce_45

action_49 (30) = happyShift action_86
action_49 _ = happyFail

action_50 (28) = happyShift action_85
action_50 _ = happyFail

action_51 (32) = happyShift action_84
action_51 _ = happyFail

action_52 (37) = happyShift action_53
action_52 (19) = happyGoto action_83
action_52 (20) = happyGoto action_52
action_52 _ = happyReduce_49

action_53 (27) = happyShift action_82
action_53 _ = happyFail

action_54 (35) = happyShift action_34
action_54 (51) = happyShift action_44
action_54 _ = happyReduce_35

action_55 (35) = happyShift action_34
action_55 _ = happyReduce_34

action_56 (35) = happyShift action_34
action_56 (39) = happyShift action_35
action_56 (40) = happyShift action_36
action_56 (41) = happyShift action_37
action_56 (42) = happyShift action_38
action_56 (46) = happyFail
action_56 (47) = happyFail
action_56 (48) = happyFail
action_56 (49) = happyFail
action_56 (50) = happyFail
action_56 (51) = happyShift action_44
action_56 (52) = happyShift action_45
action_56 _ = happyReduce_33

action_57 (35) = happyShift action_34
action_57 (39) = happyShift action_35
action_57 (40) = happyShift action_36
action_57 (41) = happyShift action_37
action_57 (42) = happyShift action_38
action_57 (46) = happyFail
action_57 (47) = happyFail
action_57 (48) = happyFail
action_57 (49) = happyFail
action_57 (50) = happyFail
action_57 (51) = happyShift action_44
action_57 (52) = happyShift action_45
action_57 _ = happyReduce_32

action_58 (35) = happyShift action_34
action_58 (39) = happyShift action_35
action_58 (40) = happyShift action_36
action_58 (41) = happyShift action_37
action_58 (42) = happyShift action_38
action_58 (46) = happyFail
action_58 (47) = happyFail
action_58 (48) = happyFail
action_58 (49) = happyFail
action_58 (50) = happyFail
action_58 (51) = happyShift action_44
action_58 (52) = happyShift action_45
action_58 _ = happyReduce_31

action_59 (35) = happyShift action_34
action_59 (39) = happyShift action_35
action_59 (40) = happyShift action_36
action_59 (41) = happyShift action_37
action_59 (42) = happyShift action_38
action_59 (46) = happyFail
action_59 (47) = happyFail
action_59 (48) = happyFail
action_59 (49) = happyFail
action_59 (50) = happyFail
action_59 (51) = happyShift action_44
action_59 (52) = happyShift action_45
action_59 _ = happyReduce_30

action_60 (35) = happyShift action_34
action_60 (39) = happyShift action_35
action_60 (40) = happyShift action_36
action_60 (41) = happyShift action_37
action_60 (42) = happyShift action_38
action_60 (46) = happyFail
action_60 (47) = happyFail
action_60 (48) = happyFail
action_60 (49) = happyFail
action_60 (50) = happyFail
action_60 (51) = happyShift action_44
action_60 (52) = happyShift action_45
action_60 _ = happyReduce_29

action_61 (35) = happyShift action_34
action_61 (51) = happyShift action_44
action_61 (52) = happyShift action_45
action_61 _ = happyReduce_27

action_62 (35) = happyShift action_34
action_62 (51) = happyShift action_44
action_62 (52) = happyShift action_45
action_62 _ = happyReduce_26

action_63 (35) = happyShift action_34
action_63 (41) = happyShift action_37
action_63 (42) = happyShift action_38
action_63 (51) = happyShift action_44
action_63 (52) = happyShift action_45
action_63 _ = happyReduce_25

action_64 (35) = happyShift action_34
action_64 (41) = happyShift action_37
action_64 (42) = happyShift action_38
action_64 (51) = happyShift action_44
action_64 (52) = happyShift action_45
action_64 _ = happyReduce_24

action_65 (29) = happyShift action_81
action_65 _ = happyReduce_44

action_66 (34) = happyShift action_80
action_66 (35) = happyShift action_34
action_66 (39) = happyShift action_35
action_66 (40) = happyShift action_36
action_66 (41) = happyShift action_37
action_66 (42) = happyShift action_38
action_66 (46) = happyShift action_39
action_66 (47) = happyShift action_40
action_66 (48) = happyShift action_41
action_66 (49) = happyShift action_42
action_66 (50) = happyShift action_43
action_66 (51) = happyShift action_44
action_66 (52) = happyShift action_45
action_66 _ = happyFail

action_67 (36) = happyShift action_79
action_67 _ = happyFail

action_68 (22) = happyShift action_15
action_68 (26) = happyShift action_16
action_68 (27) = happyShift action_17
action_68 (29) = happyShift action_18
action_68 (38) = happyShift action_19
action_68 (43) = happyShift action_20
action_68 (44) = happyShift action_21
action_68 (53) = happyShift action_22
action_68 (6) = happyGoto action_78
action_68 (10) = happyGoto action_12
action_68 (13) = happyGoto action_13
action_68 (16) = happyGoto action_14
action_68 _ = happyReduce_4

action_69 (22) = happyShift action_15
action_69 (26) = happyShift action_16
action_69 (27) = happyShift action_17
action_69 (29) = happyShift action_18
action_69 (38) = happyShift action_19
action_69 (43) = happyShift action_20
action_69 (44) = happyShift action_21
action_69 (53) = happyShift action_22
action_69 (6) = happyGoto action_77
action_69 (10) = happyGoto action_12
action_69 (13) = happyGoto action_13
action_69 (16) = happyGoto action_14
action_69 _ = happyReduce_4

action_70 (33) = happyShift action_76
action_70 (35) = happyShift action_34
action_70 (39) = happyShift action_35
action_70 (40) = happyShift action_36
action_70 (41) = happyShift action_37
action_70 (42) = happyShift action_38
action_70 (46) = happyShift action_39
action_70 (47) = happyShift action_40
action_70 (48) = happyShift action_41
action_70 (49) = happyShift action_42
action_70 (50) = happyShift action_43
action_70 (51) = happyShift action_44
action_70 (52) = happyShift action_45
action_70 (15) = happyGoto action_75
action_70 _ = happyReduce_41

action_71 (30) = happyShift action_74
action_71 _ = happyFail

action_72 _ = happyReduce_28

action_73 _ = happyReduce_13

action_74 _ = happyReduce_38

action_75 _ = happyReduce_40

action_76 (27) = happyShift action_17
action_76 (29) = happyShift action_18
action_76 (43) = happyShift action_20
action_76 (44) = happyShift action_21
action_76 (53) = happyShift action_22
action_76 (13) = happyGoto action_94
action_76 (16) = happyGoto action_24
action_76 _ = happyFail

action_77 (32) = happyShift action_93
action_77 _ = happyFail

action_78 (32) = happyShift action_92
action_78 _ = happyFail

action_79 (27) = happyShift action_17
action_79 (29) = happyShift action_18
action_79 (43) = happyShift action_20
action_79 (44) = happyShift action_21
action_79 (53) = happyShift action_22
action_79 (13) = happyGoto action_91
action_79 (16) = happyGoto action_24
action_79 _ = happyFail

action_80 _ = happyReduce_15

action_81 (27) = happyShift action_17
action_81 (29) = happyShift action_18
action_81 (43) = happyShift action_20
action_81 (44) = happyShift action_21
action_81 (53) = happyShift action_22
action_81 (13) = happyGoto action_70
action_81 (14) = happyGoto action_90
action_81 (16) = happyGoto action_24
action_81 _ = happyReduce_39

action_82 (29) = happyShift action_89
action_82 _ = happyFail

action_83 _ = happyReduce_50

action_84 _ = happyReduce_9

action_85 (27) = happyShift action_88
action_85 _ = happyFail

action_86 (24) = happyShift action_87
action_86 _ = happyReduce_7

action_87 (27) = happyShift action_104
action_87 _ = happyFail

action_88 (33) = happyShift action_103
action_88 (18) = happyGoto action_102
action_88 _ = happyReduce_47

action_89 (27) = happyShift action_50
action_89 (17) = happyGoto action_101
action_89 _ = happyReduce_45

action_90 (30) = happyShift action_100
action_90 _ = happyFail

action_91 (34) = happyShift action_99
action_91 (35) = happyShift action_34
action_91 (39) = happyShift action_35
action_91 (40) = happyShift action_36
action_91 (41) = happyShift action_37
action_91 (42) = happyShift action_38
action_91 (46) = happyShift action_39
action_91 (47) = happyShift action_40
action_91 (48) = happyShift action_41
action_91 (49) = happyShift action_42
action_91 (50) = happyShift action_43
action_91 (51) = happyShift action_44
action_91 (52) = happyShift action_45
action_91 _ = happyFail

action_92 _ = happyReduce_12

action_93 (23) = happyShift action_98
action_93 (11) = happyGoto action_96
action_93 (12) = happyGoto action_97
action_93 _ = happyReduce_18

action_94 (33) = happyShift action_76
action_94 (35) = happyShift action_34
action_94 (39) = happyShift action_35
action_94 (40) = happyShift action_36
action_94 (41) = happyShift action_37
action_94 (42) = happyShift action_38
action_94 (46) = happyShift action_39
action_94 (47) = happyShift action_40
action_94 (48) = happyShift action_41
action_94 (49) = happyShift action_42
action_94 (50) = happyShift action_43
action_94 (51) = happyShift action_44
action_94 (52) = happyShift action_45
action_94 (15) = happyGoto action_95
action_94 _ = happyReduce_41

action_95 _ = happyReduce_42

action_96 (25) = happyShift action_109
action_96 _ = happyReduce_10

action_97 (23) = happyShift action_98
action_97 (11) = happyGoto action_108
action_97 (12) = happyGoto action_97
action_97 _ = happyReduce_18

action_98 (27) = happyShift action_17
action_98 (29) = happyShift action_18
action_98 (43) = happyShift action_20
action_98 (44) = happyShift action_21
action_98 (53) = happyShift action_22
action_98 (13) = happyGoto action_107
action_98 (16) = happyGoto action_24
action_98 _ = happyFail

action_99 _ = happyReduce_16

action_100 _ = happyReduce_37

action_101 (30) = happyShift action_106
action_101 _ = happyFail

action_102 _ = happyReduce_46

action_103 (27) = happyShift action_105
action_103 _ = happyFail

action_104 _ = happyReduce_8

action_105 (28) = happyShift action_114
action_105 _ = happyFail

action_106 (28) = happyShift action_112
action_106 (31) = happyShift action_113
action_106 _ = happyFail

action_107 (31) = happyShift action_111
action_107 (35) = happyShift action_34
action_107 (39) = happyShift action_35
action_107 (40) = happyShift action_36
action_107 (41) = happyShift action_37
action_107 (42) = happyShift action_38
action_107 (46) = happyShift action_39
action_107 (47) = happyShift action_40
action_107 (48) = happyShift action_41
action_107 (49) = happyShift action_42
action_107 (50) = happyShift action_43
action_107 (51) = happyShift action_44
action_107 (52) = happyShift action_45
action_107 _ = happyFail

action_108 _ = happyReduce_19

action_109 (31) = happyShift action_110
action_109 _ = happyFail

action_110 (22) = happyShift action_15
action_110 (26) = happyShift action_16
action_110 (27) = happyShift action_17
action_110 (29) = happyShift action_18
action_110 (38) = happyShift action_19
action_110 (43) = happyShift action_20
action_110 (44) = happyShift action_21
action_110 (53) = happyShift action_22
action_110 (6) = happyGoto action_119
action_110 (10) = happyGoto action_12
action_110 (13) = happyGoto action_13
action_110 (16) = happyGoto action_14
action_110 _ = happyReduce_4

action_111 (22) = happyShift action_15
action_111 (26) = happyShift action_16
action_111 (27) = happyShift action_17
action_111 (29) = happyShift action_18
action_111 (38) = happyShift action_19
action_111 (43) = happyShift action_20
action_111 (44) = happyShift action_21
action_111 (53) = happyShift action_22
action_111 (6) = happyGoto action_118
action_111 (10) = happyGoto action_12
action_111 (13) = happyGoto action_13
action_111 (16) = happyGoto action_14
action_111 _ = happyReduce_4

action_112 (27) = happyShift action_117
action_112 _ = happyFail

action_113 (22) = happyShift action_15
action_113 (26) = happyShift action_16
action_113 (27) = happyShift action_17
action_113 (29) = happyShift action_18
action_113 (38) = happyShift action_19
action_113 (43) = happyShift action_20
action_113 (44) = happyShift action_21
action_113 (53) = happyShift action_22
action_113 (6) = happyGoto action_116
action_113 (10) = happyGoto action_12
action_113 (13) = happyGoto action_13
action_113 (16) = happyGoto action_14
action_113 _ = happyReduce_4

action_114 (27) = happyShift action_115
action_114 _ = happyFail

action_115 (33) = happyShift action_103
action_115 (18) = happyGoto action_124
action_115 _ = happyReduce_47

action_116 (32) = happyShift action_123
action_116 _ = happyFail

action_117 (31) = happyShift action_122
action_117 _ = happyFail

action_118 (32) = happyShift action_121
action_118 _ = happyFail

action_119 (32) = happyShift action_120
action_119 _ = happyFail

action_120 _ = happyReduce_11

action_121 _ = happyReduce_20

action_122 (22) = happyShift action_15
action_122 (26) = happyShift action_16
action_122 (27) = happyShift action_17
action_122 (29) = happyShift action_18
action_122 (38) = happyShift action_19
action_122 (43) = happyShift action_20
action_122 (44) = happyShift action_21
action_122 (53) = happyShift action_22
action_122 (6) = happyGoto action_125
action_122 (10) = happyGoto action_12
action_122 (13) = happyGoto action_13
action_122 (16) = happyGoto action_14
action_122 _ = happyReduce_4

action_123 _ = happyReduce_51

action_124 _ = happyReduce_48

action_125 (32) = happyShift action_126
action_125 _ = happyFail

action_126 _ = happyReduce_52

happyReduce_1 = happySpecReduce_2  4 happyReduction_1
happyReduction_1 (HappyAbsSyn6  happy_var_2)
	(HappyAbsSyn5  happy_var_1)
	 =  HappyAbsSyn4
		 (Program happy_var_1 happy_var_2
	)
happyReduction_1 _ _  = notHappyAtAll 

happyReduce_2 = happySpecReduce_0  5 happyReduction_2
happyReduction_2  =  HappyAbsSyn5
		 ([]
	)

happyReduce_3 = happySpecReduce_2  5 happyReduction_3
happyReduction_3 (HappyAbsSyn5  happy_var_2)
	(HappyAbsSyn7  happy_var_1)
	 =  HappyAbsSyn5
		 (happy_var_1 : happy_var_2
	)
happyReduction_3 _ _  = notHappyAtAll 

happyReduce_4 = happySpecReduce_0  6 happyReduction_4
happyReduction_4  =  HappyAbsSyn6
		 ([]
	)

happyReduce_5 = happySpecReduce_2  6 happyReduction_5
happyReduction_5 (HappyAbsSyn6  happy_var_2)
	(HappyAbsSyn10  happy_var_1)
	 =  HappyAbsSyn6
		 (happy_var_1 : happy_var_2
	)
happyReduction_5 _ _  = notHappyAtAll 

happyReduce_6 = happySpecReduce_2  7 happyReduction_6
happyReduction_6 (HappyAbsSyn9  happy_var_2)
	(HappyAbsSyn8  happy_var_1)
	 =  HappyAbsSyn7
		 (ClassDef happy_var_1 happy_var_2
	)
happyReduction_6 _ _  = notHappyAtAll 

happyReduce_7 = happyReduce 5 8 happyReduction_7
happyReduction_7 (_ `HappyStk`
	(HappyAbsSyn17  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (Identifier happy_var_2)) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn8
		 (ClassSignature happy_var_2 happy_var_4 (Just "Object") {-Michal said that I might want to use an option type here instead of default object, if the type itself is Object. Perhaps though that should wait until a future point. -}
	) `HappyStk` happyRest

happyReduce_8 = happyReduce 7 8 happyReduction_8
happyReduction_8 ((HappyTerminal (Identifier happy_var_7)) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn17  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (Identifier happy_var_2)) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn8
		 (ClassSignature happy_var_2 happy_var_4 (Just happy_var_7)
	) `HappyStk` happyRest

happyReduce_9 = happyReduce 4 9 happyReduction_9
happyReduction_9 (_ `HappyStk`
	(HappyAbsSyn19  happy_var_3) `HappyStk`
	(HappyAbsSyn6  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn9
		 (ClassBody happy_var_2 happy_var_3
	) `HappyStk` happyRest

happyReduce_10 = happyReduce 6 10 happyReduction_10
happyReduction_10 ((HappyAbsSyn11  happy_var_6) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn6  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn13  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn10
		 (ParserIfWithoutElse happy_var_2 happy_var_4 happy_var_6
	) `HappyStk` happyRest

happyReduce_11 = happyReduce 10 10 happyReduction_11
happyReduction_11 (_ `HappyStk`
	(HappyAbsSyn6  happy_var_9) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn11  happy_var_6) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn6  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn13  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn10
		 (ParserIfWithElse happy_var_2 happy_var_4 happy_var_6 happy_var_9
	) `HappyStk` happyRest

happyReduce_12 = happyReduce 5 10 happyReduction_12
happyReduction_12 (_ `HappyStk`
	(HappyAbsSyn6  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn13  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn10
		 (ParserWhile happy_var_2 happy_var_4
	) `HappyStk` happyRest

happyReduce_13 = happySpecReduce_3  10 happyReduction_13
happyReduction_13 _
	(HappyAbsSyn13  happy_var_2)
	_
	 =  HappyAbsSyn10
		 (ParserReturn happy_var_2
	)
happyReduction_13 _ _ _  = notHappyAtAll 

happyReduce_14 = happySpecReduce_2  10 happyReduction_14
happyReduction_14 _
	_
	 =  HappyAbsSyn10
		 (ParserReturnUnit
	)

happyReduce_15 = happyReduce 4 10 happyReduction_15
happyReduction_15 (_ `HappyStk`
	(HappyAbsSyn13  happy_var_3) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn16  happy_var_1) `HappyStk`
	happyRest)
	 = HappyAbsSyn10
		 (ParserAssign happy_var_1 happy_var_3
	) `HappyStk` happyRest

happyReduce_16 = happyReduce 6 10 happyReduction_16
happyReduction_16 (_ `HappyStk`
	(HappyAbsSyn13  happy_var_5) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn16  happy_var_1) `HappyStk`
	happyRest)
	 = HappyAbsSyn10
		 (ParserAssign happy_var_1 happy_var_5
	) `HappyStk` happyRest

happyReduce_17 = happySpecReduce_2  10 happyReduction_17
happyReduction_17 _
	(HappyAbsSyn13  happy_var_1)
	 =  HappyAbsSyn10
		 (ParserBareExpression happy_var_1
	)
happyReduction_17 _ _  = notHappyAtAll 

happyReduce_18 = happySpecReduce_0  11 happyReduction_18
happyReduction_18  =  HappyAbsSyn11
		 ([]
	)

happyReduce_19 = happySpecReduce_2  11 happyReduction_19
happyReduction_19 (HappyAbsSyn11  happy_var_2)
	(HappyAbsSyn12  happy_var_1)
	 =  HappyAbsSyn11
		 (happy_var_1 : happy_var_2
	)
happyReduction_19 _ _  = notHappyAtAll 

happyReduce_20 = happyReduce 5 12 happyReduction_20
happyReduction_20 (_ `HappyStk`
	(HappyAbsSyn6  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn13  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn12
		 ((happy_var_2,happy_var_4)
	) `HappyStk` happyRest

happyReduce_21 = happySpecReduce_1  13 happyReduction_21
happyReduction_21 (HappyTerminal (Number happy_var_1))
	 =  HappyAbsSyn13
		 (RExprIntLiteral happy_var_1
	)
happyReduction_21 _  = notHappyAtAll 

happyReduce_22 = happySpecReduce_1  13 happyReduction_22
happyReduction_22 (HappyTerminal (TargetString happy_var_1))
	 =  HappyAbsSyn13
		 (RExprStringLiteral happy_var_1
	)
happyReduction_22 _  = notHappyAtAll 

happyReduce_23 = happySpecReduce_1  13 happyReduction_23
happyReduction_23 (HappyAbsSyn16  happy_var_1)
	 =  HappyAbsSyn13
		 (RExprFromLExpr happy_var_1
	)
happyReduction_23 _  = notHappyAtAll 

happyReduce_24 = happySpecReduce_3  13 happyReduction_24
happyReduction_24 (HappyAbsSyn13  happy_var_3)
	_
	(HappyAbsSyn13  happy_var_1)
	 =  HappyAbsSyn13
		 (RExprPlus happy_var_1 happy_var_3
	)
happyReduction_24 _ _ _  = notHappyAtAll 

happyReduce_25 = happySpecReduce_3  13 happyReduction_25
happyReduction_25 (HappyAbsSyn13  happy_var_3)
	_
	(HappyAbsSyn13  happy_var_1)
	 =  HappyAbsSyn13
		 (RExprMinus happy_var_1 happy_var_3
	)
happyReduction_25 _ _ _  = notHappyAtAll 

happyReduce_26 = happySpecReduce_3  13 happyReduction_26
happyReduction_26 (HappyAbsSyn13  happy_var_3)
	_
	(HappyAbsSyn13  happy_var_1)
	 =  HappyAbsSyn13
		 (RExprTimes happy_var_1 happy_var_3
	)
happyReduction_26 _ _ _  = notHappyAtAll 

happyReduce_27 = happySpecReduce_3  13 happyReduction_27
happyReduction_27 (HappyAbsSyn13  happy_var_3)
	_
	(HappyAbsSyn13  happy_var_1)
	 =  HappyAbsSyn13
		 (RExprDivide happy_var_1 happy_var_3
	)
happyReduction_27 _ _ _  = notHappyAtAll 

happyReduce_28 = happySpecReduce_3  13 happyReduction_28
happyReduction_28 _
	(HappyAbsSyn13  happy_var_2)
	_
	 =  HappyAbsSyn13
		 (happy_var_2
	)
happyReduction_28 _ _ _  = notHappyAtAll 

happyReduce_29 = happySpecReduce_3  13 happyReduction_29
happyReduction_29 (HappyAbsSyn13  happy_var_3)
	_
	(HappyAbsSyn13  happy_var_1)
	 =  HappyAbsSyn13
		 (RExprEquality happy_var_1 happy_var_3
	)
happyReduction_29 _ _ _  = notHappyAtAll 

happyReduce_30 = happySpecReduce_3  13 happyReduction_30
happyReduction_30 (HappyAbsSyn13  happy_var_3)
	_
	(HappyAbsSyn13  happy_var_1)
	 =  HappyAbsSyn13
		 (RExprLeq happy_var_1 happy_var_3
	)
happyReduction_30 _ _ _  = notHappyAtAll 

happyReduce_31 = happySpecReduce_3  13 happyReduction_31
happyReduction_31 (HappyAbsSyn13  happy_var_3)
	_
	(HappyAbsSyn13  happy_var_1)
	 =  HappyAbsSyn13
		 (RExprLt happy_var_1 happy_var_3
	)
happyReduction_31 _ _ _  = notHappyAtAll 

happyReduce_32 = happySpecReduce_3  13 happyReduction_32
happyReduction_32 (HappyAbsSyn13  happy_var_3)
	_
	(HappyAbsSyn13  happy_var_1)
	 =  HappyAbsSyn13
		 (RExprGeq happy_var_1 happy_var_3
	)
happyReduction_32 _ _ _  = notHappyAtAll 

happyReduce_33 = happySpecReduce_3  13 happyReduction_33
happyReduction_33 (HappyAbsSyn13  happy_var_3)
	_
	(HappyAbsSyn13  happy_var_1)
	 =  HappyAbsSyn13
		 (RExprGt happy_var_1 happy_var_3
	)
happyReduction_33 _ _ _  = notHappyAtAll 

happyReduce_34 = happySpecReduce_3  13 happyReduction_34
happyReduction_34 (HappyAbsSyn13  happy_var_3)
	_
	(HappyAbsSyn13  happy_var_1)
	 =  HappyAbsSyn13
		 (RExprAnd happy_var_1 happy_var_3
	)
happyReduction_34 _ _ _  = notHappyAtAll 

happyReduce_35 = happySpecReduce_3  13 happyReduction_35
happyReduction_35 (HappyAbsSyn13  happy_var_3)
	_
	(HappyAbsSyn13  happy_var_1)
	 =  HappyAbsSyn13
		 (RExprOr happy_var_1 happy_var_3
	)
happyReduction_35 _ _ _  = notHappyAtAll 

happyReduce_36 = happySpecReduce_2  13 happyReduction_36
happyReduction_36 (HappyAbsSyn13  happy_var_2)
	_
	 =  HappyAbsSyn13
		 (RExprNot happy_var_2
	)
happyReduction_36 _ _  = notHappyAtAll 

happyReduce_37 = happyReduce 6 13 happyReduction_37
happyReduction_37 (_ `HappyStk`
	(HappyAbsSyn14  happy_var_5) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (Identifier happy_var_3)) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn13  happy_var_1) `HappyStk`
	happyRest)
	 = HappyAbsSyn13
		 (RExprMethodInvocation happy_var_1 happy_var_3 happy_var_5
	) `HappyStk` happyRest

happyReduce_38 = happyReduce 4 13 happyReduction_38
happyReduction_38 (_ `HappyStk`
	(HappyAbsSyn14  happy_var_3) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (Identifier happy_var_1)) `HappyStk`
	happyRest)
	 = HappyAbsSyn13
		 (RExprConstructorInvocation happy_var_1 happy_var_3
	) `HappyStk` happyRest

happyReduce_39 = happySpecReduce_0  14 happyReduction_39
happyReduction_39  =  HappyAbsSyn14
		 ([]
	)

happyReduce_40 = happySpecReduce_2  14 happyReduction_40
happyReduction_40 (HappyAbsSyn15  happy_var_2)
	(HappyAbsSyn13  happy_var_1)
	 =  HappyAbsSyn14
		 (happy_var_1 : happy_var_2
	)
happyReduction_40 _ _  = notHappyAtAll 

happyReduce_41 = happySpecReduce_0  15 happyReduction_41
happyReduction_41  =  HappyAbsSyn15
		 ([]
	)

happyReduce_42 = happySpecReduce_3  15 happyReduction_42
happyReduction_42 (HappyAbsSyn15  happy_var_3)
	(HappyAbsSyn13  happy_var_2)
	_
	 =  HappyAbsSyn15
		 (happy_var_2 : happy_var_3
	)
happyReduction_42 _ _ _  = notHappyAtAll 

happyReduce_43 = happySpecReduce_1  16 happyReduction_43
happyReduction_43 (HappyTerminal (Identifier happy_var_1))
	 =  HappyAbsSyn16
		 (LExprId happy_var_1
	)
happyReduction_43 _  = notHappyAtAll 

happyReduce_44 = happySpecReduce_3  16 happyReduction_44
happyReduction_44 (HappyTerminal (Identifier happy_var_3))
	_
	(HappyAbsSyn13  happy_var_1)
	 =  HappyAbsSyn16
		 (LExprDotted happy_var_1 happy_var_3
	)
happyReduction_44 _ _ _  = notHappyAtAll 

happyReduce_45 = happySpecReduce_0  17 happyReduction_45
happyReduction_45  =  HappyAbsSyn17
		 ([]
	)

happyReduce_46 = happyReduce 4 17 happyReduction_46
happyReduction_46 ((HappyAbsSyn18  happy_var_4) `HappyStk`
	(HappyTerminal (Identifier happy_var_3)) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (Identifier happy_var_1)) `HappyStk`
	happyRest)
	 = HappyAbsSyn17
		 ((happy_var_1,happy_var_3):happy_var_4
	) `HappyStk` happyRest

happyReduce_47 = happySpecReduce_0  18 happyReduction_47
happyReduction_47  =  HappyAbsSyn18
		 ([]
	)

happyReduce_48 = happyReduce 5 18 happyReduction_48
happyReduction_48 ((HappyAbsSyn18  happy_var_5) `HappyStk`
	(HappyTerminal (Identifier happy_var_4)) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (Identifier happy_var_2)) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn18
		 ((happy_var_2,happy_var_4):happy_var_5
	) `HappyStk` happyRest

happyReduce_49 = happySpecReduce_0  19 happyReduction_49
happyReduction_49  =  HappyAbsSyn19
		 ([]
	)

happyReduce_50 = happySpecReduce_2  19 happyReduction_50
happyReduction_50 (HappyAbsSyn19  happy_var_2)
	(HappyAbsSyn20  happy_var_1)
	 =  HappyAbsSyn19
		 (happy_var_1:happy_var_2
	)
happyReduction_50 _ _  = notHappyAtAll 

happyReduce_51 = happyReduce 8 20 happyReduction_51
happyReduction_51 (_ `HappyStk`
	(HappyAbsSyn6  happy_var_7) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn17  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (Identifier happy_var_2)) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn20
		 (InferredMethod happy_var_2 happy_var_4 happy_var_7
	) `HappyStk` happyRest

happyReduce_52 = happyReduce 10 20 happyReduction_52
happyReduction_52 (_ `HappyStk`
	(HappyAbsSyn6  happy_var_9) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (Identifier happy_var_7)) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn17  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (Identifier happy_var_2)) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn20
		 (TypedMethod happy_var_2 happy_var_4 happy_var_7 happy_var_9
	) `HappyStk` happyRest

happyNewToken action sts stk [] =
	action 55 55 notHappyAtAll (HappyState action) sts stk []

happyNewToken action sts stk (tk:tks) =
	let cont i = action i i tk (HappyState action) sts stk tks in
	case tk of {
	Class -> cont 21;
	While -> cont 22;
	Elif -> cont 23;
	Extends -> cont 24;
	Else -> cont 25;
	If -> cont 26;
	Identifier happy_dollar_dollar -> cont 27;
	Colon -> cont 28;
	Lparen -> cont 29;
	Rparen -> cont 30;
	Lbracket -> cont 31;
	Rbracket -> cont 32;
	Comma -> cont 33;
	Semicolon -> cont 34;
	Dot -> cont 35;
	Equals -> cont 36;
	Def -> cont 37;
	Return -> cont 38;
	Sum -> cont 39;
	Difference -> cont 40;
	Product -> cont 41;
	Quotient -> cont 42;
	Number happy_dollar_dollar -> cont 43;
	TargetString happy_dollar_dollar -> cont 44;
	Error happy_dollar_dollar -> cont 45;
	Equality -> cont 46;
	LEQ -> cont 47;
	Lt -> cont 48;
	GEQ -> cont 49;
	Gt -> cont 50;
	And -> cont 51;
	Or -> cont 52;
	Not -> cont 53;
	EOFToken -> cont 54;
	_ -> happyError' (tk:tks)
	}

happyError_ 55 tk tks = happyError' tks
happyError_ _ tk tks = happyError' (tk:tks)

newtype HappyIdentity a = HappyIdentity a
happyIdentity = HappyIdentity
happyRunIdentity (HappyIdentity a) = a

instance Functor HappyIdentity where
    fmap f (HappyIdentity a) = HappyIdentity (f a)

instance Applicative HappyIdentity where
    pure  = return
    (<*>) = ap
instance Monad HappyIdentity where
    return = HappyIdentity
    (HappyIdentity p) >>= q = q p

happyThen :: () => HappyIdentity a -> (a -> HappyIdentity b) -> HappyIdentity b
happyThen = (>>=)
happyReturn :: () => a -> HappyIdentity a
happyReturn = (return)
happyThen1 m k tks = (>>=) m (\a -> k a tks)
happyReturn1 :: () => a -> b -> HappyIdentity a
happyReturn1 = \a tks -> (return) a
happyError' :: () => [(Token)] -> HappyIdentity a
happyError' = HappyIdentity . parseError

calc tks = happyRunIdentity happySomeParser where
  happySomeParser = happyThen (happyParse action_0 tks) (\x -> case x of {HappyAbsSyn4 z -> happyReturn z; _other -> notHappyAtAll })

happySeq = happyDontSeq


{-I'm currently throwing away typing information in my AST.-}


parseError :: [Token] -> a
parseError _ = error "Parse error"

data Program = Program [ClassDef] [Statement]
             deriving Show
data Method = TypedMethod String [(String,String)] String [Statement]
            | InferredMethod String [(String,String)] [Statement]
            | FFIMethod String [(String, String)] String
            deriving Show
{- Formal arguments have to supply a type? -}


{-
data FormalArgs = FormalArgs [(String, String)]
                deriving Show
-}

data ClassBody = ClassBody [Statement] [Method]
               deriving Show 
data ClassSignature = ClassSignature String [(String,String)] (Maybe String)
                    deriving Show
data ClassDef = ClassDef ClassSignature ClassBody
              deriving Show
data Statement = ParserIfWithElse RExpr [Statement] [(RExpr, [Statement])] [Statement]
               | ParserIfWithoutElse RExpr [Statement] [(RExpr, [Statement])]
               | ParserWhile RExpr [Statement]
               | ParserReturn RExpr
               | ParserReturnUnit
               | ParserAssign LExpr {- type : String-} RExpr
               | ParserBareExpression RExpr
               deriving Show
data LExpr = LExprId String
           | LExprDotted RExpr String
           deriving Show
data RExpr = RExprStringLiteral String
           | RExprIntLiteral String
           | RExprFromLExpr LExpr
           | RExprPlus RExpr RExpr
           | RExprMinus RExpr RExpr
           | RExprTimes RExpr RExpr
           | RExprDivide RExpr RExpr
           | RExprEquality RExpr RExpr
           | RExprLeq RExpr RExpr
           | RExprLt RExpr RExpr
           | RExprGeq RExpr RExpr
           | RExprGt RExpr RExpr
           | RExprAnd RExpr RExpr
           | RExprOr RExpr RExpr
           | RExprNot RExpr
           | RExprMethodInvocation RExpr String [RExpr]
           | RExprConstructorInvocation String [RExpr]
           deriving Show

getTokens :: String -> [Token] {-For now, no error handling-}
getTokens s = case runAlex s gather of
                   Left _ -> []
                   Right x -> (map fst x)

programPrint :: Program -> IO ()
programPrint p = print p

getProgram :: IO Program
getProgram = do
             s <- getContents
             pure (calc $ getTokens s)









data HierarchyError = NoHierarchyError
                    | ParentClassNotPresent String {-This is the string for the parent. ignores child for now.-}
                    | CycleDetected String {-Just gives one of the classes in the cycle for now.-}
                    deriving Show





exists :: Eq a => a -> [a] -> Bool
exists a [] = False
exists a (x:xs) = if a == x then True else exists a xs

subset :: [String] -> [String] -> [String] {- not subset... -}
subset (x:xs) all = if exists x all then subset xs all else x:(subset xs all)
subset [] all = []


classNameExists :: String -> [(String, Maybe String)] -> Bool
classNameExists n l = exists n (map fst l)

checkParentExists :: (String, Maybe String) -> [(String, Maybe String)] -> Bool
checkParentExists (_,Just parentName) l = classNameExists parentName l
checkParentExists (_,Nothing) _ = True



get :: String -> [(String, Maybe String)] -> Maybe (Maybe String)
get n [] = Nothing
get n (x:xs) = if n == fst x then Just $ snd x else get n xs






getAncestry :: String -> [(String, Maybe String)] -> [String]
getAncestry name hierarchy = case get name hierarchy of Nothing -> [name] {-ERROR CASE-}
                                                        Just Nothing -> [name]
                                                        Just (Just parentName) -> name : (getAncestry parentName hierarchy)

getUsefulAncestry :: String -> [(String, Maybe String)] -> [String]
getUsefulAncestry className hierarchy = reverse $ getAncestry className hierarchy



{-THIS IS AN INCOMPLETE PATTERN MATCH!!!-}
getCommonAncestor' :: [String] -> [String] -> String
getCommonAncestor' (x:(x2:xs)) (y:(y2:ys)) = if x2 == y2 then getCommonAncestor' (x2:xs) (y2:ys) else x
getCommonAncestor' (x:xs) (y:ys) = x



getCommonAncestor :: String -> String -> [(String, Maybe String)] -> String
getCommonAncestor x y hierarchy = getCommonAncestor' (getUsefulAncestry x hierarchy) (getUsefulAncestry y hierarchy)



{-This code for common ancestors might be correct, but I am not testing it yet. It's really a type checking thing.-}







{-My cycle detection runs in time cubic in the number of class definitions. This is terrible, and I may change it later.-}

{-Oh wait, I can check for cycles just by counting the depth traversed.... I'm dumb :(-}

checkForCyclesOneClass' :: (String, Maybe String) -> [(String, Maybe String)] -> [String] -> Bool -> HierarchyError
checkForCyclesOneClass' (name, Nothing) _ seenNames deep = if exists name seenNames then CycleDetected name else NoHierarchyError
checkForCyclesOneClass' (name, Just parentName) hierarchy seenNames deep =
 if exists name seenNames then CycleDetected name
 else case get parentName hierarchy of Nothing -> if deep then NoHierarchyError else ParentClassNotPresent parentName 
                                       Just grandParentName -> checkForCyclesOneClass' (parentName, grandParentName) hierarchy (name:seenNames) True


checkForCyclesOneClass :: [(String, Maybe String)] -> (String, Maybe String) -> HierarchyError
checkForCyclesOneClass x y = checkForCyclesOneClass' y x [] False



filterErrors :: [HierarchyError] -> [HierarchyError]
filterErrors (NoHierarchyError:xs) = filterErrors xs
filterErrors (x:xs) = x:(filterErrors xs)
filterErrors [] = []

checkForCycles :: [(String, Maybe String)] -> [HierarchyError]
checkForCycles l = filterErrors $ map (checkForCyclesOneClass l) l








getSubtypeHierarchy' :: (String, (Maybe String, ClassDef)) -> (String, Maybe String)
getSubtypeHierarchy' (className, (parentName, _)) = (className, parentName)

getSubtypeHierarchy :: [(String, (Maybe String, ClassDef))] -> [(String, Maybe String)]
getSubtypeHierarchy = map getSubtypeHierarchy'




{-For now, I'm only going to add in Object and its methods to the built in stuff. Eventually I may need to add more-}

generateObject :: ClassDef
generateObject = ClassDef (ClassSignature "Object" [] Nothing) (ClassBody [] [FFIMethod "PRINT" [] "",FFIMethod "toStr" [] ""]) {-Saying "" now for unit, although I might want to change.-}




addBuiltIns :: Program -> Program
addBuiltIns (Program classDefs statements) = Program (classDefs ++ [generateObject]) statements

{- I am assuming for now that the user did not add in anything called "Object", etc.
That is not a reasonable assumption, but this is due soon.
-}







{-


{-Where am I putting these return types in? Are these actually required? Did I mess up my parser??-}

data Program = Program [ClassDef] [Statement]
             deriving Show
data Method = TypedMethod String [(String,String)] String [Statement]
            | InferredMethod String [(String,String)] [Statement]
            | FFIMethod String [(String, String)] String
            deriving Show
{- Formal arguments have to supply a type? -}


{-
data FormalArgs = FormalArgs [(String, String)]
                deriving Show
-}

data ClassBody = ClassBody [Statement] [Method]
               deriving Show
data ClassSignature = ClassSignature String [(String,String)] (Maybe String)
                    deriving Show
data ClassDef = ClassDef ClassSignature ClassBody
              deriving Show


-}



{- DO I HAVE TO CHECK CONSTRUCTORS TO MAKE SURE THAT EVERYTHING IS THERE??? -}





okLExpr :: LExpr -> [String]
okLExpr (LExprId _) = []
okLExpr (LExprDotted rexpr string) = okRExpr rexpr

okRExpr :: RExpr -> [String]
okRExpr (RExprStringLiteral _ ) = []
okRExpr (RExprIntLiteral _ )= []
okRExpr (RExprFromLExpr lexpr) = okLExpr lexpr
okRExpr (RExprPlus rexpr1 rexpr2) = (okRExpr rexpr1) ++ (okRExpr rexpr2)
okRExpr (RExprMinus rexpr1 rexpr2) = (okRExpr rexpr1) ++ (okRExpr rexpr2)
okRExpr (RExprTimes rexpr1 rexpr2) = (okRExpr rexpr1) ++ (okRExpr rexpr2)
okRExpr (RExprDivide rexpr1 rexpr2) = (okRExpr rexpr1) ++ (okRExpr rexpr2)
okRExpr (RExprEquality rexpr1 rexpr2) =(okRExpr rexpr1) ++ (okRExpr rexpr2)
okRExpr (RExprLeq rexpr1 rexpr2) = (okRExpr rexpr1) ++ (okRExpr rexpr2)
okRExpr (RExprLt rexpr1 rexpr2) = (okRExpr rexpr1) ++ (okRExpr rexpr2)
okRExpr (RExprGeq rexpr1 rexpr2) = (okRExpr rexpr1) ++ (okRExpr rexpr2)
okRExpr (RExprGt rexpr1 rexpr2) = (okRExpr rexpr1) ++ (okRExpr rexpr2)
okRExpr (RExprAnd rexpr1 rexpr2) = (okRExpr rexpr1) ++ (okRExpr rexpr2)
okRExpr (RExprOr rexpr1 rexpr2) = (okRExpr rexpr1) ++ (okRExpr rexpr2)
okRExpr (RExprNot rexpr) = okRExpr rexpr
okRExpr (RExprMethodInvocation rexpr string listRExpr) = okRExpr rexpr ++ (concat $ map okRExpr listRExpr)
okRExpr (RExprConstructorInvocation string listRExpr) = string : (concat $ map okRExpr listRExpr)


okStatementHelper :: (RExpr,[Statement]) -> [String]
okStatementHelper (x,y) = (okRExpr x) ++ (concat $ map okStatement y)

okStatement :: Statement -> [String]
okStatement (ParserIfWithElse rexpr listStatement1 listRExprListStatement listStatement2) = (okRExpr rexpr) ++ (concat $ map okStatement listStatement1) ++ (concat $ map okStatementHelper listRExprListStatement) ++ (concat $ map okStatement listStatement2)
okStatement (ParserIfWithoutElse rexpr listStatement listRExprListStatement) = (okRExpr rexpr) ++ (concat $ map okStatement listStatement) ++ (concat $ map okStatementHelper listRExprListStatement)
okStatement (ParserWhile rexpr listStatement) = (okRExpr rexpr) ++ (concat $ map okStatement listStatement)
okStatement (ParserReturn rexpr) = okRExpr rexpr
okStatement (ParserReturnUnit) = []
okStatement (ParserAssign lexpr rexpr) = (okLExpr lexpr) ++ (okRExpr rexpr)
okStatement (ParserBareExpression rexpr) = okRExpr rexpr


okMethod :: Method -> [String]
okMethod (TypedMethod _ _ _ listStatement) = concat $ map okStatement listStatement
okMethod (InferredMethod _ _ listStatement) = concat $ map okStatement listStatement
okMethod (FFIMethod _ _ _) = []


okClassBody :: ClassBody -> [String]
okClassBody (ClassBody statements methods) = (concat $ map okStatement statements) ++ (concat $ map okMethod methods)

okClassDef :: ClassDef -> [String]
okClassDef (ClassDef _ classBody) = okClassBody classBody

okProgram :: Program -> [String]
okProgram (Program classDefs statements) = (concat $ map okClassDef classDefs) ++ (concat $ map okStatement statements)




















{-Some repeated information. I will likely reorganize later when I know what I'm doing.....-}
getSelfParentDef :: ClassDef -> (String,(Maybe String, ClassDef))
getSelfParentDef x = case x of (ClassDef (ClassSignature self _ super) _) -> (self, (super, x))


getHierarchy :: Program -> [(String,(Maybe String, ClassDef))]
getHierarchy (Program classDefs _) = map getSelfParentDef classDefs

buildHierarchyMap :: Program -> HashMap.HashMap String (Maybe String, ClassDef)
buildHierarchyMap program = HashMap.fromList $ getHierarchy program

{-Now I have to distinguish between Nothing (not found) and Just Nothing (Object) -}

{-Am I also factoring in the fact that I should at some point know that
Objects like Integer will have methods, which I will need to know about?-}

{-Is this the point where I do the desugaring if +, etc???? -}

{-
fooPrint :: Either String String -> IO ()
fooPrint (Left s) = putStrLn s
fooPrint (Right s) = hPutStrLn stderr s
-}

{-Also have to add in the built in classes, Object, etc.-}


toPrintCheckForCycles :: [HierarchyError] -> Either String String
toPrintCheckForCycles [] = Left ""
toPrintCheckForCycles x = Right ("Cycles/nonexistent classes (no line numbers yet :():\n\n" ++ show x)

toPrintErroneousConstructorCalls :: [String] -> Either String String
toPrintErroneousConstructorCalls [] = Left ""
toPrintErroneousConstructorCalls x = Right ("These constructors do not exist! I claim!:\n\n" ++ show x)

{- I can print out the AST, but I am not supposed to. You will have to believe me that I made it. -}
main = do
       x <- getProgram
       {-_ <- print $ getSubtypeHierarchy $ HashMap.toList $ buildHierarchyMap (addBuiltIns x)-}
       _ <- fooPrint $ toPrintCheckForCycles $ checkForCycles $ getSubtypeHierarchy $ HashMap.toList $ buildHierarchyMap (addBuiltIns x)
       _ <- fooPrint $ toPrintErroneousConstructorCalls $ subset ( okProgram x)  (map fst $ getSubtypeHierarchy $ HashMap.toList $ buildHierarchyMap (addBuiltIns x) )
       {-programPrint (addBuiltIns x)-}
       pure ()
{-# LINE 1 "templates/GenericTemplate.hs" #-}
{-# LINE 1 "templates/GenericTemplate.hs" #-}
{-# LINE 1 "<built-in>" #-}
{-# LINE 1 "<command-line>" #-}
{-# LINE 8 "<command-line>" #-}
# 1 "/usr/include/stdc-predef.h" 1 3 4

# 17 "/usr/include/stdc-predef.h" 3 4










































{-# LINE 8 "<command-line>" #-}
{-# LINE 1 "/usr/lib/ghc/include/ghcversion.h" #-}

















{-# LINE 8 "<command-line>" #-}
{-# LINE 1 "templates/GenericTemplate.hs" #-}
-- Id: GenericTemplate.hs,v 1.26 2005/01/14 14:47:22 simonmar Exp 

{-# LINE 13 "templates/GenericTemplate.hs" #-}

{-# LINE 46 "templates/GenericTemplate.hs" #-}








{-# LINE 67 "templates/GenericTemplate.hs" #-}

{-# LINE 77 "templates/GenericTemplate.hs" #-}

{-# LINE 86 "templates/GenericTemplate.hs" #-}

infixr 9 `HappyStk`
data HappyStk a = HappyStk a (HappyStk a)

-----------------------------------------------------------------------------
-- starting the parse

happyParse start_state = happyNewToken start_state notHappyAtAll notHappyAtAll

-----------------------------------------------------------------------------
-- Accepting the parse

-- If the current token is (1), it means we've just accepted a partial
-- parse (a %partial parser).  We must ignore the saved token on the top of
-- the stack in this case.
happyAccept (1) tk st sts (_ `HappyStk` ans `HappyStk` _) =
        happyReturn1 ans
happyAccept j tk st sts (HappyStk ans _) = 
         (happyReturn1 ans)

-----------------------------------------------------------------------------
-- Arrays only: do the next action

{-# LINE 155 "templates/GenericTemplate.hs" #-}

-----------------------------------------------------------------------------
-- HappyState data type (not arrays)



newtype HappyState b c = HappyState
        (Int ->                    -- token number
         Int ->                    -- token number (yes, again)
         b ->                           -- token semantic value
         HappyState b c ->              -- current state
         [HappyState b c] ->            -- state stack
         c)



-----------------------------------------------------------------------------
-- Shifting a token

happyShift new_state (1) tk st sts stk@(x `HappyStk` _) =
     let i = (case x of { HappyErrorToken (i) -> i }) in
--     trace "shifting the error token" $
     new_state i i tk (HappyState (new_state)) ((st):(sts)) (stk)

happyShift new_state i tk st sts stk =
     happyNewToken new_state ((st):(sts)) ((HappyTerminal (tk))`HappyStk`stk)

-- happyReduce is specialised for the common cases.

happySpecReduce_0 i fn (1) tk st sts stk
     = happyFail (1) tk st sts stk
happySpecReduce_0 nt fn j tk st@((HappyState (action))) sts stk
     = action nt j tk st ((st):(sts)) (fn `HappyStk` stk)

happySpecReduce_1 i fn (1) tk st sts stk
     = happyFail (1) tk st sts stk
happySpecReduce_1 nt fn j tk _ sts@(((st@(HappyState (action))):(_))) (v1`HappyStk`stk')
     = let r = fn v1 in
       happySeq r (action nt j tk st sts (r `HappyStk` stk'))

happySpecReduce_2 i fn (1) tk st sts stk
     = happyFail (1) tk st sts stk
happySpecReduce_2 nt fn j tk _ ((_):(sts@(((st@(HappyState (action))):(_))))) (v1`HappyStk`v2`HappyStk`stk')
     = let r = fn v1 v2 in
       happySeq r (action nt j tk st sts (r `HappyStk` stk'))

happySpecReduce_3 i fn (1) tk st sts stk
     = happyFail (1) tk st sts stk
happySpecReduce_3 nt fn j tk _ ((_):(((_):(sts@(((st@(HappyState (action))):(_))))))) (v1`HappyStk`v2`HappyStk`v3`HappyStk`stk')
     = let r = fn v1 v2 v3 in
       happySeq r (action nt j tk st sts (r `HappyStk` stk'))

happyReduce k i fn (1) tk st sts stk
     = happyFail (1) tk st sts stk
happyReduce k nt fn j tk st sts stk
     = case happyDrop (k - ((1) :: Int)) sts of
         sts1@(((st1@(HappyState (action))):(_))) ->
                let r = fn stk in  -- it doesn't hurt to always seq here...
                happyDoSeq r (action nt j tk st1 sts1 r)

happyMonadReduce k nt fn (1) tk st sts stk
     = happyFail (1) tk st sts stk
happyMonadReduce k nt fn j tk st sts stk =
      case happyDrop k ((st):(sts)) of
        sts1@(((st1@(HappyState (action))):(_))) ->
          let drop_stk = happyDropStk k stk in
          happyThen1 (fn stk tk) (\r -> action nt j tk st1 sts1 (r `HappyStk` drop_stk))

happyMonad2Reduce k nt fn (1) tk st sts stk
     = happyFail (1) tk st sts stk
happyMonad2Reduce k nt fn j tk st sts stk =
      case happyDrop k ((st):(sts)) of
        sts1@(((st1@(HappyState (action))):(_))) ->
         let drop_stk = happyDropStk k stk





             new_state = action

          in
          happyThen1 (fn stk tk) (\r -> happyNewToken new_state sts1 (r `HappyStk` drop_stk))

happyDrop (0) l = l
happyDrop n ((_):(t)) = happyDrop (n - ((1) :: Int)) t

happyDropStk (0) l = l
happyDropStk n (x `HappyStk` xs) = happyDropStk (n - ((1)::Int)) xs

-----------------------------------------------------------------------------
-- Moving to a new state after a reduction

{-# LINE 256 "templates/GenericTemplate.hs" #-}
happyGoto action j tk st = action j j tk (HappyState action)


-----------------------------------------------------------------------------
-- Error recovery ((1) is the error token)

-- parse error if we are in recovery and we fail again
happyFail (1) tk old_st _ stk@(x `HappyStk` _) =
     let i = (case x of { HappyErrorToken (i) -> i }) in
--      trace "failing" $ 
        happyError_ i tk

{-  We don't need state discarding for our restricted implementation of
    "error".  In fact, it can cause some bogus parses, so I've disabled it
    for now --SDM

-- discard a state
happyFail  (1) tk old_st (((HappyState (action))):(sts)) 
                                                (saved_tok `HappyStk` _ `HappyStk` stk) =
--      trace ("discarding state, depth " ++ show (length stk))  $
        action (1) (1) tk (HappyState (action)) sts ((saved_tok`HappyStk`stk))
-}

-- Enter error recovery: generate an error token,
--                       save the old token and carry on.
happyFail  i tk (HappyState (action)) sts stk =
--      trace "entering error recovery" $
        action (1) (1) tk (HappyState (action)) sts ( (HappyErrorToken (i)) `HappyStk` stk)

-- Internal happy errors:

notHappyAtAll :: a
notHappyAtAll = error "Internal Happy error\n"

-----------------------------------------------------------------------------
-- Hack to get the typechecker to accept our action functions







-----------------------------------------------------------------------------
-- Seq-ing.  If the --strict flag is given, then Happy emits 
--      happySeq = happyDoSeq
-- otherwise it emits
--      happySeq = happyDontSeq

happyDoSeq, happyDontSeq :: a -> b -> b
happyDoSeq   a b = a `seq` b
happyDontSeq a b = b

-----------------------------------------------------------------------------
-- Don't inline any functions from the template.  GHC has a nasty habit
-- of deciding to inline happyGoto everywhere, which increases the size of
-- the generated parser quite a bit.

{-# LINE 322 "templates/GenericTemplate.hs" #-}
{-# NOINLINE happyShift #-}
{-# NOINLINE happySpecReduce_0 #-}
{-# NOINLINE happySpecReduce_1 #-}
{-# NOINLINE happySpecReduce_2 #-}
{-# NOINLINE happySpecReduce_3 #-}
{-# NOINLINE happyReduce #-}
{-# NOINLINE happyMonadReduce #-}
{-# NOINLINE happyGoto #-}
{-# NOINLINE happyFail #-}

-- end of Happy Template.
