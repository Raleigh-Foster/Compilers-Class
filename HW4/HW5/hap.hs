{-# OPTIONS_GHC -w #-}
module Main where    
import qualified Data.Set as Set
import Tokens
import qualified Data.Map.Strict as HashMap
import Data.List
import System.IO
import Debug.Trace
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
	(HappyTerminal happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn8
		 (ClassSignature (stringFromIdentifierToken happy_var_2) happy_var_4 (Just "Obj") {-Michal said that I might want to use an option type here instead of default Obj, if the type itself is Obj. Perhaps though that should wait until a future point. -}
	) `HappyStk` happyRest

happyReduce_8 = happyReduce 7 8 happyReduction_8
happyReduction_8 ((HappyTerminal happy_var_7) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn17  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyTerminal happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn8
		 (ClassSignature (stringFromIdentifierToken happy_var_2) happy_var_4 (Just (stringFromIdentifierToken happy_var_7))
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
	(HappyTerminal happy_var_1) `HappyStk`
	happyRest)
	 = HappyAbsSyn10
		 (ParserIfWithoutElse happy_var_2 happy_var_4 happy_var_6 (lineNumberFromToken happy_var_1)
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
	(HappyTerminal happy_var_1) `HappyStk`
	happyRest)
	 = HappyAbsSyn10
		 (ParserIfWithElse happy_var_2 happy_var_4 happy_var_6 happy_var_9 (lineNumberFromToken happy_var_1)
	) `HappyStk` happyRest

happyReduce_12 = happyReduce 5 10 happyReduction_12
happyReduction_12 (_ `HappyStk`
	(HappyAbsSyn6  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn13  happy_var_2) `HappyStk`
	(HappyTerminal happy_var_1) `HappyStk`
	happyRest)
	 = HappyAbsSyn10
		 (ParserWhile happy_var_2 happy_var_4 (lineNumberFromToken happy_var_1)
	) `HappyStk` happyRest

happyReduce_13 = happySpecReduce_3  10 happyReduction_13
happyReduction_13 _
	(HappyAbsSyn13  happy_var_2)
	(HappyTerminal happy_var_1)
	 =  HappyAbsSyn10
		 (ParserReturn happy_var_2 (lineNumberFromToken happy_var_1)
	)
happyReduction_13 _ _ _  = notHappyAtAll 

happyReduce_14 = happySpecReduce_2  10 happyReduction_14
happyReduction_14 _
	(HappyTerminal happy_var_1)
	 =  HappyAbsSyn10
		 (ParserReturnUnit (lineNumberFromToken happy_var_1)
	)
happyReduction_14 _ _  = notHappyAtAll 

happyReduce_15 = happyReduce 4 10 happyReduction_15
happyReduction_15 (_ `HappyStk`
	(HappyAbsSyn13  happy_var_3) `HappyStk`
	(HappyTerminal happy_var_2) `HappyStk`
	(HappyAbsSyn16  happy_var_1) `HappyStk`
	happyRest)
	 = HappyAbsSyn10
		 (ParserAssign happy_var_1 happy_var_3 (lineNumberFromToken happy_var_2)
	) `HappyStk` happyRest

happyReduce_16 = happyReduce 6 10 happyReduction_16
happyReduction_16 (_ `HappyStk`
	(HappyAbsSyn13  happy_var_5) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyTerminal happy_var_2) `HappyStk`
	(HappyAbsSyn16  happy_var_1) `HappyStk`
	happyRest)
	 = HappyAbsSyn10
		 (ParserAssign happy_var_1 happy_var_5 (lineNumberFromToken happy_var_2)
	) `HappyStk` happyRest

happyReduce_17 = happySpecReduce_2  10 happyReduction_17
happyReduction_17 (HappyTerminal happy_var_2)
	(HappyAbsSyn13  happy_var_1)
	 =  HappyAbsSyn10
		 (ParserBareExpression happy_var_1 (lineNumberFromToken happy_var_2)
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
happyReduction_21 (HappyTerminal (Token (Number happy_var_1) (_)))
	 =  HappyAbsSyn13
		 (RExprIntLiteral happy_var_1 (-1000)
	)
happyReduction_21 _  = notHappyAtAll 

happyReduce_22 = happySpecReduce_1  13 happyReduction_22
happyReduction_22 (HappyTerminal (Token (TargetString happy_var_1) (_)))
	 =  HappyAbsSyn13
		 (RExprStringLiteral happy_var_1 (-1000)
	)
happyReduction_22 _  = notHappyAtAll 

happyReduce_23 = happySpecReduce_1  13 happyReduction_23
happyReduction_23 (HappyAbsSyn16  happy_var_1)
	 =  HappyAbsSyn13
		 (RExprFromLExpr happy_var_1 (-1000)
	)
happyReduction_23 _  = notHappyAtAll 

happyReduce_24 = happySpecReduce_3  13 happyReduction_24
happyReduction_24 (HappyAbsSyn13  happy_var_3)
	(HappyTerminal happy_var_2)
	(HappyAbsSyn13  happy_var_1)
	 =  HappyAbsSyn13
		 (RExprMethodInvocation happy_var_1 "PLUS" [happy_var_3] (lineNumberFromToken happy_var_2)
	)
happyReduction_24 _ _ _  = notHappyAtAll 

happyReduce_25 = happySpecReduce_3  13 happyReduction_25
happyReduction_25 (HappyAbsSyn13  happy_var_3)
	(HappyTerminal happy_var_2)
	(HappyAbsSyn13  happy_var_1)
	 =  HappyAbsSyn13
		 (RExprMethodInvocation happy_var_1 "MINUS" [happy_var_3] (lineNumberFromToken happy_var_2)
	)
happyReduction_25 _ _ _  = notHappyAtAll 

happyReduce_26 = happySpecReduce_3  13 happyReduction_26
happyReduction_26 (HappyAbsSyn13  happy_var_3)
	(HappyTerminal happy_var_2)
	(HappyAbsSyn13  happy_var_1)
	 =  HappyAbsSyn13
		 (RExprMethodInvocation happy_var_1 "PRODUCT" [happy_var_3] (lineNumberFromToken happy_var_2)
	)
happyReduction_26 _ _ _  = notHappyAtAll 

happyReduce_27 = happySpecReduce_3  13 happyReduction_27
happyReduction_27 (HappyAbsSyn13  happy_var_3)
	(HappyTerminal happy_var_2)
	(HappyAbsSyn13  happy_var_1)
	 =  HappyAbsSyn13
		 (RExprMethodInvocation happy_var_1 "QUOTIENT" [happy_var_3] (lineNumberFromToken happy_var_2)
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
	(HappyTerminal happy_var_2)
	(HappyAbsSyn13  happy_var_1)
	 =  HappyAbsSyn13
		 (RExprMethodInvocation happy_var_1 "EQUALS" [happy_var_3] (lineNumberFromToken happy_var_2)
	)
happyReduction_29 _ _ _  = notHappyAtAll 

happyReduce_30 = happySpecReduce_3  13 happyReduction_30
happyReduction_30 (HappyAbsSyn13  happy_var_3)
	(HappyTerminal happy_var_2)
	(HappyAbsSyn13  happy_var_1)
	 =  HappyAbsSyn13
		 (RExprMethodInvocation happy_var_1 "ATMOST" [happy_var_3] (lineNumberFromToken happy_var_2)
	)
happyReduction_30 _ _ _  = notHappyAtAll 

happyReduce_31 = happySpecReduce_3  13 happyReduction_31
happyReduction_31 (HappyAbsSyn13  happy_var_3)
	(HappyTerminal happy_var_2)
	(HappyAbsSyn13  happy_var_1)
	 =  HappyAbsSyn13
		 (RExprMethodInvocation happy_var_1 "LESS" [happy_var_3] (lineNumberFromToken happy_var_2)
	)
happyReduction_31 _ _ _  = notHappyAtAll 

happyReduce_32 = happySpecReduce_3  13 happyReduction_32
happyReduction_32 (HappyAbsSyn13  happy_var_3)
	(HappyTerminal happy_var_2)
	(HappyAbsSyn13  happy_var_1)
	 =  HappyAbsSyn13
		 (RExprMethodInvocation happy_var_1 "ATLEAST" [happy_var_3] (lineNumberFromToken happy_var_2)
	)
happyReduction_32 _ _ _  = notHappyAtAll 

happyReduce_33 = happySpecReduce_3  13 happyReduction_33
happyReduction_33 (HappyAbsSyn13  happy_var_3)
	(HappyTerminal happy_var_2)
	(HappyAbsSyn13  happy_var_1)
	 =  HappyAbsSyn13
		 (RExprMethodInvocation happy_var_1 "MORE" [happy_var_3] (lineNumberFromToken happy_var_2)
	)
happyReduction_33 _ _ _  = notHappyAtAll 

happyReduce_34 = happySpecReduce_3  13 happyReduction_34
happyReduction_34 (HappyAbsSyn13  happy_var_3)
	(HappyTerminal happy_var_2)
	(HappyAbsSyn13  happy_var_1)
	 =  HappyAbsSyn13
		 (RExprAnd happy_var_1 happy_var_3 (lineNumberFromToken happy_var_2)
	)
happyReduction_34 _ _ _  = notHappyAtAll 

happyReduce_35 = happySpecReduce_3  13 happyReduction_35
happyReduction_35 (HappyAbsSyn13  happy_var_3)
	(HappyTerminal happy_var_2)
	(HappyAbsSyn13  happy_var_1)
	 =  HappyAbsSyn13
		 (RExprOr happy_var_1 happy_var_3 (lineNumberFromToken happy_var_2)
	)
happyReduction_35 _ _ _  = notHappyAtAll 

happyReduce_36 = happySpecReduce_2  13 happyReduction_36
happyReduction_36 (HappyAbsSyn13  happy_var_2)
	(HappyTerminal happy_var_1)
	 =  HappyAbsSyn13
		 (RExprNot happy_var_2 (lineNumberFromToken happy_var_1)
	)
happyReduction_36 _ _  = notHappyAtAll 

happyReduce_37 = happyReduce 6 13 happyReduction_37
happyReduction_37 (_ `HappyStk`
	(HappyAbsSyn14  happy_var_5) `HappyStk`
	(HappyTerminal happy_var_4) `HappyStk`
	(HappyTerminal happy_var_3) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn13  happy_var_1) `HappyStk`
	happyRest)
	 = HappyAbsSyn13
		 (RExprMethodInvocation happy_var_1 (stringFromIdentifierToken happy_var_3) happy_var_5 (lineNumberFromToken happy_var_4)
	) `HappyStk` happyRest

happyReduce_38 = happyReduce 4 13 happyReduction_38
happyReduction_38 (_ `HappyStk`
	(HappyAbsSyn14  happy_var_3) `HappyStk`
	_ `HappyStk`
	(HappyTerminal happy_var_1) `HappyStk`
	happyRest)
	 = HappyAbsSyn13
		 (RExprConstructorInvocation (stringFromIdentifierToken happy_var_1) happy_var_3 (lineNumberFromToken happy_var_1)
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
happyReduction_43 (HappyTerminal happy_var_1)
	 =  HappyAbsSyn16
		 (LExprId (stringFromIdentifierToken happy_var_1) (lineNumberFromToken happy_var_1)
	)
happyReduction_43 _  = notHappyAtAll 

happyReduce_44 = happySpecReduce_3  16 happyReduction_44
happyReduction_44 (HappyTerminal happy_var_3)
	_
	(HappyAbsSyn13  happy_var_1)
	 =  HappyAbsSyn16
		 (LExprDotted happy_var_1 (stringFromIdentifierToken happy_var_3) (-1000)
	)
happyReduction_44 _ _ _  = notHappyAtAll 

happyReduce_45 = happySpecReduce_0  17 happyReduction_45
happyReduction_45  =  HappyAbsSyn17
		 ([]
	)

happyReduce_46 = happyReduce 4 17 happyReduction_46
happyReduction_46 ((HappyAbsSyn18  happy_var_4) `HappyStk`
	(HappyTerminal happy_var_3) `HappyStk`
	_ `HappyStk`
	(HappyTerminal happy_var_1) `HappyStk`
	happyRest)
	 = HappyAbsSyn17
		 (((stringFromIdentifierToken happy_var_1),(stringFromIdentifierToken happy_var_3)):happy_var_4
	) `HappyStk` happyRest

happyReduce_47 = happySpecReduce_0  18 happyReduction_47
happyReduction_47  =  HappyAbsSyn18
		 ([]
	)

happyReduce_48 = happyReduce 5 18 happyReduction_48
happyReduction_48 ((HappyAbsSyn18  happy_var_5) `HappyStk`
	(HappyTerminal happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyTerminal happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn18
		 (((stringFromIdentifierToken happy_var_2),(stringFromIdentifierToken happy_var_4)):happy_var_5
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
	(HappyTerminal happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn20
		 (InferredMethod (stringFromIdentifierToken happy_var_2) happy_var_4 happy_var_7
	) `HappyStk` happyRest

happyReduce_52 = happyReduce 10 20 happyReduction_52
happyReduction_52 (_ `HappyStk`
	(HappyAbsSyn6  happy_var_9) `HappyStk`
	_ `HappyStk`
	(HappyTerminal happy_var_7) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn17  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyTerminal happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn20
		 (TypedMethod (stringFromIdentifierToken happy_var_2) happy_var_4 (stringFromIdentifierToken happy_var_7) happy_var_9
	) `HappyStk` happyRest

happyNewToken action sts stk
	= lexer(\tk -> 
	let cont i = action i i tk (HappyState action) sts stk in
	case tk of {
	(Token EOFToken (_)) -> action 55 55 tk (HappyState action) sts stk;
	Token Class (_) -> cont 21;
	Token While (_) -> cont 22;
	Token Elif (_) -> cont 23;
	Token Extends (_) -> cont 24;
	Token Else (_) -> cont 25;
	Token If (_) -> cont 26;
	Token (Identifier _) (_) -> cont 27;
	Token Colon (_) -> cont 28;
	Token Lparen (_) -> cont 29;
	Token Rparen (_) -> cont 30;
	Token Lbracket (_) -> cont 31;
	Token Rbracket (_) -> cont 32;
	Token Comma (_) -> cont 33;
	Token Semicolon (_) -> cont 34;
	Token Dot (_) -> cont 35;
	Token Equals (_) -> cont 36;
	Token Def (_) -> cont 37;
	Token Return (_) -> cont 38;
	Token Sum (_) -> cont 39;
	Token Difference (_) -> cont 40;
	Token Product (_) -> cont 41;
	Token Quotient (_) -> cont 42;
	Token (Number happy_dollar_dollar) (_) -> cont 43;
	Token (TargetString happy_dollar_dollar) (_) -> cont 44;
	Token (Error happy_dollar_dollar) (_) -> cont 45;
	Token Equality (_) -> cont 46;
	Token LEQ (_) -> cont 47;
	Token Lt (_) -> cont 48;
	Token GEQ (_) -> cont 49;
	Token Gt (_) -> cont 50;
	Token And (_) -> cont 51;
	Token Or (_) -> cont 52;
	Token Not (_) -> cont 53;
	Token EOFToken (_) -> cont 54;
	_ -> happyError' tk
	})

happyError_ 55 tk = happyError' tk
happyError_ _ tk = happyError' tk

happyThen :: () => P a -> (a -> P b) -> P b
happyThen = (thenP)
happyReturn :: () => a -> P a
happyReturn = (returnP)
happyThen1 = happyThen
happyReturn1 :: () => a -> P a
happyReturn1 = happyReturn
happyError' :: () => (Token) -> P a
happyError' tk = parseError tk

calc = happySomeParser where
  happySomeParser = happyThen (happyParse action_0) (\x -> case x of {HappyAbsSyn4 z -> happyReturn z; _other -> notHappyAtAll })

happySeq = happyDontSeq


stringFromIdentifierToken :: Token -> String
stringFromIdentifierToken (Token (Identifier s) _) = s
lineNumberFromToken :: Token -> Int
lineNumberFromToken (Token _ n) = n                
type P a = Alex a
thenP = (>>=)
returnP = return
catchP m c = fail "catch not implemented"
lexer :: (Token -> P a) -> P a
lexer = (alexMonadScan >>=)
parseError tokens = do
 i <- getLineNumber
 alexError $ show i
data Program = Program [ClassDef] [Statement]
             deriving Show
data Method = TypedMethod String [(String,String)] String [Statement]
            | InferredMethod String [(String,String)] [Statement]
            | FFIMethod String [(String, String)] String
            deriving Show
data ClassBody = ClassBody [Statement] [Method]
               deriving Show 
data ClassSignature = ClassSignature String [(String,String)] (Maybe String)
                    deriving Show
data ClassDef = ClassDef ClassSignature ClassBody
              deriving Show
data Statement = ParserIfWithElse RExpr [Statement] [(RExpr, [Statement])] [Statement] Int
               | ParserIfWithoutElse RExpr [Statement] [(RExpr, [Statement])] Int
               | ParserWhile RExpr [Statement] Int
               | ParserReturn RExpr Int
               | ParserReturnUnit Int
               | ParserAssign LExpr {- type : String-} RExpr Int
               | ParserBareExpression RExpr Int
               deriving Show
data LExpr = LExprId String Int
           | LExprDotted RExpr String Int
           deriving Show
thisDotFieldHack :: String
thisDotFieldHack = "this_dot_"
data RExpr = RExprStringLiteral String Int
           | RExprIntLiteral String Int
           | RExprFromLExpr LExpr Int
           | RExprAnd RExpr RExpr Int
           | RExprOr RExpr RExpr Int
           | RExprNot RExpr Int
           | RExprMethodInvocation RExpr String [RExpr] Int
           | RExprConstructorInvocation String [RExpr] Int
           deriving Show
getTokens :: String -> [Token] {-For now, no error handling-}
getTokens s = case runAlex s gather of Left _ -> []
                                       Right x -> x {-(map fst x)-}
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
getAncestry' :: String -> HashMap.Map String (Maybe String, ClassDef) -> [String]
getAncestry' name myMap = getAncestry name (map (\x -> (fst x, fst $ snd x)) $ HashMap.toList myMap)
getUsefulAncestry :: String -> [(String, Maybe String)] -> [String]
getUsefulAncestry className hierarchy = reverse $ getAncestry className hierarchy
{-THIS IS AN INCOMPLETE PATTERN MATCH!!!-}
getCommonAncestor' :: [String] -> [String] -> String
getCommonAncestor' (x:(x2:xs)) (y:(y2:ys)) = if x2 == y2 then getCommonAncestor' (x2:xs) (y2:ys) else x
getCommonAncestor' (x:xs) (y:ys) = x
getCommonAncestor :: String -> String -> [(String, Maybe String)] -> String
getCommonAncestor x y hierarchy = getCommonAncestor' (getUsefulAncestry x hierarchy) (getUsefulAncestry y hierarchy)
getCommonAncestorFromMap :: HashMap.Map String (Maybe String, ClassDef) -> String -> String -> String
getCommonAncestorFromMap myMap s1 s2 = getCommonAncestor s1 s2 (map (\x -> (fst x, fst $ snd x)) $ HashMap.toList myMap)
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

{-RIGHT NOW, NONE OF THE BUILTINS OVERRIDE ANYTHING FROM Obj, INCLUDING PRINTING OUT. THEY WILL ONCE I KNOW WHAT THAT MEANS-}
generateObj :: ClassDef
generateObj = ClassDef (ClassSignature "Obj" [] Nothing) (ClassBody [] [FFIMethod "PRINT" [] "Nothing", FFIMethod "STRING" [] "String", FFIMethod "EQUALS" [("argumentName", "Obj")] "Boolean"])

{-I AM NOT ENFORCING THAT THE USER CANNOT CREATE A NOTHING CURRENTLY-}

generateNothing :: ClassDef
generateNothing = ClassDef (ClassSignature "Nothing" [] (Just "Obj")) (ClassBody [] []) 

generateString :: ClassDef
generateString = ClassDef (ClassSignature "String" [] (Just "Obj")) (ClassBody [] [ FFIMethod "PRINT" [("argumentName", "String")] "String"])


generateInt :: ClassDef
generateInt = ClassDef (ClassSignature "Int" [] (Just "Obj")) (ClassBody []
 [FFIMethod "PLUS" [("argumentName", "Int")] "Int",
  FFIMethod "MINUS" [("argumentName", "Int")] "Int",
  FFIMethod "PRODUCT" [("argumentName", "Int")] "Int",
  FFIMethod "QUOTIENT" [("argumentName", "Int")] "Int",
  FFIMethod "ATMOST" [("argumentName", "Int")] "Boolean",
  FFIMethod "LESS" [("argumentName", "Int")] "Boolean",
  FFIMethod "ATLEAST" [("argumentName", "Int")] "Boolean",
  FFIMethod "MORE" [("argumentName", "Int")] "Boolean",
  FFIMethod "PRINT" [("argumentName", "String")] "String"
  
  ])


generateBoolean :: ClassDef
generateBoolean = ClassDef (ClassSignature "Boolean" [] (Just "Obj")) (ClassBody [] [ FFIMethod "PRINT" [("argumentName", "String")] "String"])




addBuiltIns :: Program -> (Program, [ClassDef])
addBuiltIns (Program classDefs statements) = (Program (classDefs ++ [generateObj, generateInt, generateNothing, generateString, generateBoolean]) statements, classDefs)

okLExpr :: LExpr -> [String]
okLExpr (LExprId _ lineNumber) = []
okLExpr (LExprDotted rexpr string lineNumber) = okRExpr rexpr

okRExpr :: RExpr -> [String]
okRExpr (RExprStringLiteral _ lineNumber) = []
okRExpr (RExprIntLiteral _ lineNumber)= []
okRExpr (RExprFromLExpr lexpr lineNumber) = okLExpr lexpr
okRExpr (RExprAnd rexpr1 rexpr2 lineNumber) = (okRExpr rexpr1) ++ (okRExpr rexpr2)
okRExpr (RExprOr rexpr1 rexpr2 lineNumber) = (okRExpr rexpr1) ++ (okRExpr rexpr2)
okRExpr (RExprNot rexpr lineNumber) = okRExpr rexpr
okRExpr (RExprMethodInvocation rexpr string listRExpr lineNumber) = okRExpr rexpr ++ (concat $ map okRExpr listRExpr)
okRExpr (RExprConstructorInvocation string listRExpr lineNumber) = string : (concat $ map okRExpr listRExpr)


okStatementHelper :: (RExpr,[Statement]) -> [String]
okStatementHelper (x,y) = (okRExpr x) ++ (concat $ map okStatement y)

okStatement :: Statement -> [String]
okStatement (ParserIfWithElse rexpr listStatement1 listRExprListStatement listStatement2 lineNumber) = (okRExpr rexpr) ++ (concat $ map okStatement listStatement1) ++ (concat $ map okStatementHelper listRExprListStatement) ++ (concat $ map okStatement listStatement2)
okStatement (ParserIfWithoutElse rexpr listStatement listRExprListStatement lineNumber) = (okRExpr rexpr) ++ (concat $ map okStatement listStatement) ++ (concat $ map okStatementHelper listRExprListStatement)
okStatement (ParserWhile rexpr listStatement lineNumber) = (okRExpr rexpr) ++ (concat $ map okStatement listStatement)
okStatement (ParserReturn rexpr lineNumber) = okRExpr rexpr
okStatement (ParserReturnUnit lineNumber) = []
okStatement (ParserAssign lexpr rexpr lineNumber) = (okLExpr lexpr) ++ (okRExpr rexpr)
okStatement (ParserBareExpression rexpr lineNumber) = okRExpr rexpr


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


{-I am using "Obj", not "Obj" (which is in the manual) The manual is inconsistent about whether Int or Integer is what is defined.-}

{-HAVE TO BUILD ALL OF THE FFI CALLS HERE INTO A CLASS DEF THAT I MAKE.... -}


getHierarchy :: Program -> [(String,(Maybe String, ClassDef))]
getHierarchy (Program classDefs _) = (map getSelfParentDef classDefs) ++
   [("Nothing", (Just "Obj", generateNothing )),
     ("Int",(Just "Obj", generateInt)),
       ("String", (Just "Obj", generateString )),
         ("Boolean", (Just "Obj", generateBoolean )),
           ("Obj", (Nothing, generateObj))
             ]
              
buildHierarchyMap :: Program -> HashMap.Map String (Maybe String, ClassDef)
buildHierarchyMap program = HashMap.fromList $ getHierarchy program




{-Now I have to distinguish between Nothing (not found) and Just Nothing (Obj) -}

{-Am I also factoring in the fact that I should at some point know that
Objs like Integer will have methods, which I will need to know about?-}

{-Is this the point where I do the desugaring if +, etc???? -}

toPrintCheckForCycles :: [HierarchyError] -> Either String String
toPrintCheckForCycles [] = Left ""
toPrintCheckForCycles x = Right ("Cycles/nonexistent classes (no line numbers yet :():\n\n" ++ show x)

toPrintErroneousConstructorCalls :: [String] -> Either String String
toPrintErroneousConstructorCalls [] = Left ""
toPrintErroneousConstructorCalls x = Right ("These constructors do not exist! I claim!:\n\n" ++ show x)



{- I can print out the AST, but I am not supposed to. You will have to believe me that I made it. -}

getStatements :: Program -> [Statement]
getStatements (Program _ statements) = statements

printOutInitFail :: (String,Int) -> IO ()
printOutInitFail (s,x) = (hPutStrLn stderr $ "identifier " ++ s ++  " on line " ++ (show x))

printOutInitFails' :: [(String,Int)] -> IO ()
printOutInitFails' [] = pure ()
printOutInitFails' (x:xs) = (printOutInitFail x) >> (printOutInitFails' xs)

printOutInitFails :: [(String, Int)] -> IO ()
printOutInitFails [] = pure ()                
printOutInitFails (x:xs) = (hPutStrLn stderr "You use the following identifiers without initializing:") >> (printOutInitFails' (x:xs)) 

dealWith :: Program -> IO ()
dealWith x = do
 
 {-
 _ <- print $ getSubtypeHierarchy $ HashMap.toList $ buildHierarchyMap (addBuiltIns x)
 _ <- fooPrint $ toPrintCheckForCycles $ checkForCycles $ getSubtypeHierarchy $ HashMap.toList $ buildHierarchyMap (addBuiltIns x)
 
 _ <- fooPrint $ toPrintErroneousConstructorCalls $ subset ( okProgram x)  (map fst $ getSubtypeHierarchy $ HashMap.toList $ buildHierarchyMap (addBuiltIns x) )
 -}
 
 
 


{-
 _ <- allMethodsWorkForProgram x
 
 
 
 

 
 _ <- printOutInitFails $ checkInitializationBeforeUse $ getStatements x
 
 -}
 
 
 
 
 {-_ <- programPrint (addBuiltIns x)-}
 generateProgramC (addBuiltIns x) {-doing this even if typechecking fails.-}
 {-pure ()-}


main = do
 x <- getContents


 case runAlex x calc of Right x -> dealWith x
                        Left x -> error x
 
isSubtype :: String -> String -> HashMap.Map String (Maybe String, ClassDef) -> Bool
isSubtype subtype supertype map =
 if supertype == "Obj" || subtype == supertype
  then True
  else
   if subtype == "Obj"
    then False
    else case HashMap.lookup subtype map of Nothing -> error "is subtype error1" {-ERROR CASE-}
                                            Just (Just a,_) -> isSubtype a supertype map
                                            Just _ -> error "is subtype error 2"

isSupertype :: String -> String -> HashMap.Map String (Maybe String, ClassDef) -> Bool
isSupertype supertype subtype map = isSubtype subtype supertype map

isSupertype' :: HashMap.Map String (Maybe String, ClassDef) -> String -> String -> Bool
isSupertype' myMap a b = isSupertype a b myMap


data MethodType = MethodType String [String] String {-name, argument types, return type-}
                deriving Show
data ClassType = ClassType String [(String, String)] [MethodType] {- class name fields (name,type), Methods -}
               deriving Show
data RawClassType = RawClassType String [MethodType]
                  deriving Show

{-This ignores statements-}

data TypedProgram = TypedProgram [ClassType]


{-WHERE DO WE CARE ABOUT CLASS SIGNATURE IN TERMS OF TYPING!?!?!?!? DO WE CARE ABOUT THE FORMAL ARGUMENTS TO A CLASS??? HOW DO THESE HAVE TO TYPECHECK????-}

{-I allow the user to override a method and change its argument names-}


allTrue :: [Bool] -> Bool
allTrue [] = True
allTrue (True:xs) = allTrue xs
allTrue (False:_) = False



{-I don't say which argument in particular violates contravariance yet-}
checkClassSingleMethodCompatibleWithParent :: HashMap.Map String (Maybe String, ClassDef) -> MethodType {-child method -} -> MethodType {- parent method -} -> [String] {-Nothing means works. Just s means s is the error message-}
checkClassSingleMethodCompatibleWithParent myMap (MethodType methodName argumentType returnType) (MethodType parentMethodName parentArgumentType parentReturnType) =
 (if not ((length parentArgumentType) == (length argumentType)) then ["Method " ++ methodName ++ " has different number of arguments to method in parent"] else []) ++
 (let b = zipWith (isSupertype' myMap) argumentType parentArgumentType in
   if allTrue b then []
   else ["Method " ++ methodName ++ " argument types violate contravariance when compared to parent method"]) ++
 (if isSubtype returnType parentReturnType myMap then [] else ["Method " ++ methodName ++ " return type of " ++ returnType ++ " violates covariance when compared to return type of parent method return type of " ++ parentReturnType])

{-Currently this only returns a single error... hmm....-}



listMaybe :: Maybe a -> [a]
listMaybe (Just s) = [s]
listMaybe Nothing = []

collectMaybe :: [Maybe a] -> [a]
collectMaybe arg = concat $ (map listMaybe arg)

{-

This is where I need to be working with maps from String to Method Type.

Oh, and I also need to be making sure that there are no duplicates, but redefinitions of what appears in a parent is okay.

IGNORING THIS FOR NOW.


-}

generateMethodMap :: [MethodType] -> HashMap.Map String MethodType
generateMethodMap [] = HashMap.empty
generateMethodMap ((MethodType name argTypes returnType):xs) = HashMap.insert name (MethodType name argTypes returnType) (generateMethodMap xs)

getMethodName :: MethodType -> String
getMethodName (MethodType name _ _ ) = name


checkClassMethodsCompatibleWithOneAncestor :: HashMap.Map String (Maybe String, ClassDef) -> [MethodType] -> [MethodType] -> [String]
checkClassMethodsCompatibleWithOneAncestor myMap childMethods parentMethods =
 let parentMethodMap = generateMethodMap parentMethods in
 let f = (\x -> case HashMap.lookup (getMethodName x) parentMethodMap of Nothing -> []
                                                                         Just parentMethod -> checkClassSingleMethodCompatibleWithParent myMap x parentMethod) in
 concat $ map f childMethods


{- collectMaybe $ {-zipWith (checkClassSingleMethodCompatibleWithParent myMap) childMethods parentMethods-} -}

checkClassMethodsCompatibleWithAllAncestors :: HashMap.Map String (Maybe String, ClassDef) -> [MethodType] -> [[MethodType]] -> [String]
checkClassMethodsCompatibleWithAllAncestors myMap childMethods ancestorsMethods = concat $ map (checkClassMethodsCompatibleWithOneAncestor myMap childMethods) ancestorsMethods


generateRawMethodSubtypeSingleMethod :: Method -> MethodType
generateRawMethodSubtypeSingleMethod (TypedMethod methodName methodArguments returnType _) = MethodType methodName (map snd methodArguments) returnType
generateRawMethodSubtypeSingleMethod (InferredMethod methodName methodArguments _ ) = MethodType methodName (map snd methodArguments) "Nothing"
generateRawMethodSubtypeSingleMethod (FFIMethod methodName methodArguments returnType) = MethodType methodName (map snd methodArguments) returnType


{-
I AM NOT HANDLING FIELDS YET, ONLY METHODS.

-}

getMethodTypeList :: HashMap.Map String (Maybe String, ClassDef) -> String -> [MethodType]
getMethodTypeList myMap name = case HashMap.lookup name myMap of Just (Just _, classDef) -> let (_, methods) = generateRawMethodTypesSingleClass classDef in methods
                                                                 Just (Nothing, classDef) -> [] {-NEED TO CHANGE BECAUSE Obj DOES HAVE STUFF-}
                                                                 Nothing -> error ("Error when considering" ++ name)


{-I think I'm including the class itself as its ancestor here... though it doesn't matter for now.-}
methodsWorkForAllAncestors :: HashMap.Map String (Maybe String, ClassDef) -> String -> [String]
methodsWorkForAllAncestors myMap name = let ancestry = getAncestry' name myMap in let methodTypes = map (getMethodTypeList myMap) ancestry in checkClassMethodsCompatibleWithAllAncestors myMap (getMethodTypeList myMap name) methodTypes


methodsWorkForAllAncestorsAllClasses :: HashMap.Map String (Maybe String, ClassDef) -> [String] -> [String]
methodsWorkForAllAncestorsAllClasses myMap names = concat $ map (methodsWorkForAllAncestors myMap) names

getAncestry'' :: HashMap.Map String (Maybe String, ClassDef) -> String -> (String, [String])
getAncestry'' a b = (b, (getAncestry' b a))


convertS :: HashMap.Map String (Maybe String, ClassDef) -> (String, [String]) -> (String, [[MethodType]])
convertS myMap (s, ss) = (s, map (getMethodTypeList myMap) ss)

{-YAY!!!!-}
allMethodsWorkForProgram' :: Program -> Either [(String, [MethodType])] [String]
allMethodsWorkForProgram' program =
 let myMap = buildHierarchyMap program in
 let k = HashMap.keys myMap in
 let ancestries = map (getAncestry'' myMap) k in
 let methodLists = map (convertS myMap) ancestries in
 let y = map generateCompleteMethodTypesAndName methodLists in
 let x = methodsWorkForAllAncestorsAllClasses myMap k in
 case x of [] -> Left y
           _ -> Right x                  


{- I DO NOT HAVE TRUE AND FALSE AS BOOLEAN LITERALS!!!!!!!!!! -}

allMethodsWorkForProgram :: Program -> IO ()
allMethodsWorkForProgram program =
 case allMethodsWorkForProgram' program of
  Left x ->
   let classMethodMap = generateClassMethodMap x in
   let hierarchy = buildHierarchyMap program in 
   let identifierMap = generateSubtypes hierarchy classMethodMap [] HashMap.empty in
   let k = checkTypesOkay hierarchy classMethodMap identifierMap (getProgramStatements program) in
    case k of
     [] -> pure ()
     h -> print h
  Right x -> mapM (hPutStrLn stderr) x >> pure ()


{-getAncestry' :: String -> HashMap.Map String (Maybe String, ClassDef) -> [String]-}


generateRawMethodTypesSingleClass :: ClassDef -> (String, [MethodType])
generateRawMethodTypesSingleClass (ClassDef (ClassSignature className classArguments classParent) (ClassBody statements methods)) = (className, map generateRawMethodSubtypeSingleMethod methods)                                 
{-This doesn't care about constructors or the contents of methods. IT ALSO DOES NOT VALIDATE METHODS. IT ALSO DOES NOT PUT IN INHERITED STUFF-}
generateRawMethodTypes :: Program -> [(String, [MethodType])]
generateRawMethodTypes (Program [] _) = []
generateRawMethodTypes (Program (classDef:classDefs) statements) = (generateRawMethodTypesSingleClass classDef) : (generateRawMethodTypes (Program classDefs statements))



{-This generates the actual method types for a single class, given the base methods in the class and the parents.
  It assumes that everything typechecks.

  Assuming this, all that needs to happen is to iteratively traverse the ancestors to the root, adding methods as they do not exist.

-}

{-THIS ASSUMES THAT THE LIST OF ANCESTORS INCLUDES THE CURRENT CLASS!!!-}




{-REALLY INEFFICIENT!!-}
fuse :: [MethodType] -> [MethodType] -> [MethodType]
fuse x [] = x
fuse x (y:ys) = if exists (getMethodName y) (map getMethodName x) then fuse x ys else fuse (y:x) ys

generateCompleteMethodTypes :: [[MethodType]] -> [MethodType]
generateCompleteMethodTypes [] = []
generateCompleteMethodTypes (currentClassMethodList:rest) = let x = generateCompleteMethodTypes rest in fuse currentClassMethodList x

generateCompleteMethodTypesAndName :: (String, [[MethodType]]) -> (String, [MethodType])
generateCompleteMethodTypesAndName (s, m) = (s, generateCompleteMethodTypes m)                        






{-considering some impossible cases below -}



collectIdentifiersDeclarationStatementHelper :: (RExpr,[Statement]) -> [(String, Int)]
collectIdentifiersDeclarationStatementHelper (x,y) = intersect (collectIdentifiersDeclarationRExpr x) (concat $ map collectIdentifiersDeclarationStatement y)

collectIdentifiersDeclarationStatement :: Statement -> [(String, Int)]
collectIdentifiersDeclarationStatement (ParserIfWithElse rExpr statements list statements2 lineNumber) =
 case list of [] ->  intersect (concat $ map collectIdentifiersDeclarationStatement statements) (concat $ map collectIdentifiersDeclarationStatement statements2)
              _ -> intersect (concat $ map collectIdentifiersDeclarationStatement statements) $ intersect (concat $ map collectIdentifiersDeclarationStatementHelper list) (concat $ map collectIdentifiersDeclarationStatement statements2)

collectIdentifiersDeclarationStatement (ParserIfWithoutElse rExpr statements list lineNumber) = []
collectIdentifiersDeclarationStatement (ParserWhile rExpr statements lineNumber) = (collectIdentifiersDeclarationRExpr rExpr) ++ (concat $ map collectIdentifiersDeclarationStatement statements)
collectIdentifiersDeclarationStatement (ParserReturn rExpr lineNumber) = collectIdentifiersDeclarationRExpr rExpr
collectIdentifiersDeclarationStatement (ParserReturnUnit lineNumber) = []
collectIdentifiersDeclarationStatement (ParserAssign lExpr rExpr lineNumber) = collectIdentifiersDeclarationLExpr lExpr
collectIdentifiersDeclarationStatement (ParserBareExpression rExpr lineNumber) = collectIdentifiersDeclarationRExpr rExpr


{-These literals probably should be turned into instances of Int, etc.... hmm.... THIS MIGHT BE A PROBLEM..-}
{-RExpr Equality, etc.... should be a method call? What about LEQ? YES I CAN REMOVE THE EQUALITY TAG-}


{- When I parse the class signatures I should keep track of the arguments to the class so that I can check the constructors somewhere around here.-}


collectIdentifiersDeclarationRExpr :: RExpr -> [(String, Int)]
collectIdentifiersDeclarationRExpr (RExprStringLiteral _ lineNumber) = []
collectIdentifiersDeclarationRExpr (RExprIntLiteral _ lineNumber) = []
collectIdentifiersDeclarationRExpr (RExprFromLExpr lExpr lineNumber) = collectIdentifiersDeclarationLExpr lExpr
collectIdentifiersDeclarationRExpr (RExprAnd rExpr1 rExpr2 lineNumber) = (collectIdentifiersDeclarationRExpr rExpr1) ++ (collectIdentifiersDeclarationRExpr rExpr2)
collectIdentifiersDeclarationRExpr (RExprOr rExpr1 rExpr2 lineNumber) = (collectIdentifiersDeclarationRExpr rExpr1) ++ (collectIdentifiersDeclarationRExpr rExpr2) 
collectIdentifiersDeclarationRExpr (RExprNot rExpr lineNumber) = collectIdentifiersDeclarationRExpr rExpr
collectIdentifiersDeclarationRExpr (RExprMethodInvocation rExpr methodName arguments lineNumber) = (collectIdentifiersDeclarationRExpr rExpr) ++ (concat $ map collectIdentifiersDeclarationRExpr arguments)
collectIdentifiersDeclarationRExpr (RExprConstructorInvocation constructorName arguments lineNumber) = concat $ map collectIdentifiersDeclarationRExpr arguments

collectIdentifiersDeclarationLExpr :: LExpr -> [(String, Int)]
collectIdentifiersDeclarationLExpr (LExprId s lineNumber) = [(s, lineNumber)]
collectIdentifiersDeclarationLExpr (LExprDotted rExpr s lineNumber) = (s, lineNumber):(collectIdentifiersDeclarationRExpr rExpr)








collectIdentifiersUsageStatementHelper :: (RExpr,[Statement]) -> [(String,Int)]
collectIdentifiersUsageStatementHelper (x,y) = (collectIdentifiersUsageRExpr x) ++ (concat $ map collectIdentifiersUsageStatement y)

collectIdentifiersUsageStatement :: Statement -> [(String,Int)]
collectIdentifiersUsageStatement (ParserIfWithElse rExpr statements list statements2 lineNumber) = (collectIdentifiersUsageRExpr rExpr) ++ (concat $ map collectIdentifiersUsageStatement statements)
                                                                                   ++ (concat $ map collectIdentifiersUsageStatementHelper list) ++ (concat $ map collectIdentifiersUsageStatement statements2)
collectIdentifiersUsageStatement (ParserIfWithoutElse rExpr statements list lineNumber) = (collectIdentifiersUsageRExpr rExpr) ++ (concat $ map collectIdentifiersUsageStatement statements)
                                                                          ++ (concat $ map collectIdentifiersUsageStatementHelper list)
collectIdentifiersUsageStatement (ParserWhile rExpr statements lineNumber) = (collectIdentifiersUsageRExpr rExpr) ++ (concat $ map collectIdentifiersUsageStatement statements)
collectIdentifiersUsageStatement (ParserReturn rExpr lineNumber) = collectIdentifiersUsageRExpr rExpr
collectIdentifiersUsageStatement (ParserReturnUnit lineNumber) = []
collectIdentifiersUsageStatement (ParserAssign lExpr rExpr lineNumber) = (collectIdentifiersUsageRExpr rExpr)
collectIdentifiersUsageStatement (ParserBareExpression rExpr lineNumber) = collectIdentifiersUsageRExpr rExpr



{- When I parse the class signatures I should keep track of the arguments to the class so that I can check the constructors somewhere around here.-}


collectIdentifiersUsageRExpr :: RExpr -> [(String,Int)]
collectIdentifiersUsageRExpr (RExprStringLiteral _ lineNumber) = []
collectIdentifiersUsageRExpr (RExprIntLiteral _ lineNumber) = []
collectIdentifiersUsageRExpr (RExprFromLExpr lExpr lineNumber) = collectIdentifiersUsageLExpr lExpr
collectIdentifiersUsageRExpr (RExprAnd rExpr1 rExpr2 lineNumber) = (collectIdentifiersUsageRExpr rExpr1) ++ (collectIdentifiersUsageRExpr rExpr2)
collectIdentifiersUsageRExpr (RExprOr rExpr1 rExpr2 lineNumber) = (collectIdentifiersUsageRExpr rExpr1) ++ (collectIdentifiersUsageRExpr rExpr2) 
collectIdentifiersUsageRExpr (RExprNot rExpr lineNumber) = collectIdentifiersUsageRExpr rExpr
collectIdentifiersUsageRExpr (RExprMethodInvocation rExpr methodName arguments lineNumber) = (collectIdentifiersUsageRExpr rExpr) ++ (concat $ map collectIdentifiersUsageRExpr arguments)
collectIdentifiersUsageRExpr (RExprConstructorInvocation constructorName arguments lineNumber) = concat $ map collectIdentifiersUsageRExpr arguments

collectIdentifiersUsageLExpr :: LExpr -> [(String,Int)]
collectIdentifiersUsageLExpr (LExprId s lineNumber) = [(s,lineNumber)]
collectIdentifiersUsageLExpr (LExprDotted rExpr s lineNumber) = (s, lineNumber):(collectIdentifiersUsageRExpr rExpr)








{-ignores recursive case with while for now-}


checkInitializationBeforeUseSingleStatement :: [Statement] -> Statement -> [(String,Int)]
checkInitializationBeforeUseSingleStatement statements statement =
 let doRecursiveCase = case statement of (ParserWhile _ statements2 lineNumber) -> checkInitializationBeforeUse (statements2 ++ statements)
                                         _ -> []
 in                                        
 let defined = concat $ map collectIdentifiersDeclarationStatement statements in
 let used = collectIdentifiersUsageStatement statement in
 let foo = (filter (\x -> not (exists x defined)) used) ++ doRecursiveCase
 in foo



checkInitializationBeforeUse' :: [Statement] -> [(String, Int)]
checkInitializationBeforeUse' [] = []
checkInitializationBeforeUse' (statement:statements) =
 (checkInitializationBeforeUseSingleStatement statements statement) ++ 
 (checkInitializationBeforeUse' statements)


checkInitializationBeforeUse :: [Statement] -> [(String,Int)]
checkInitializationBeforeUse statements = checkInitializationBeforeUse' $ reverse statements





{-Given the methods and their type signatures, and the class hierarchy, generate the full signature of each class. If there is a type error, return the error -}
{-generateFullSignature :: ClassDef ->  -> HashMap.Map String (Maybe String, ClassDef) -> 
-}

{-Given full signatures for each class, and a call to a method, -}
{-checkCompatibleSubtype :: HashMap 
-}




{-


okStatement :: Statement -> [String]
            okStatement (ParserIfWithElse rexpr listStatement1 listRExprListStatement listStatement2 lineNumber) = (okRExpr rexpr) ++ (concat $ map okStatement listStatement1) ++ (concat $ map okStatementHelper listRExprListStatement) ++ (concat $ map okStatement listStatement2)
            okStatement (ParserIfWithoutElse rexpr listStatement listRExprListStatement lineNumber) = (okRExpr rexpr) ++ (concat $ map okStatement listStatement) ++ (concat $ map okStatementHelper listRExprListStatement)
            okStatement (ParserWhile rexpr listStatement lineNumber) = (okRExpr rexpr) ++ (concat $ map okStatement listStatement)
            okStatement (ParserReturn rexpr lineNumber) = okRExpr rexpr
            okStatement (ParserReturnUnit lineNumber) = []
            okStatement (ParserAssign lexpr rexpr lineNumber) = (okLExpr lexpr) ++ (okRExpr rexpr)
            okStatement (ParserBareExpression rexpr lineNumber) = okRExpr rexpr


-}






getTypeLExpr :: HashMap.Map String (Maybe String, ClassDef) -> HashMap.Map (String, String) MethodType -> HashMap.Map String String -> LExpr -> Maybe String
getTypeLExpr hierarchy classMethodMap currentIdentifierMap (LExprId s lineNumber) = HashMap.lookup s currentIdentifierMap
getTypeLExpr hierarchy classMethodMap currentIdentifierMap (LExprDotted rExpr s lineNumber) = HashMap.lookup (thisDotFieldHack ++ s) currentIdentifierMap




{-This is the case of field projection. I am ignoring this for now....-}

{-
 case getTypeRExpr hierarchy classMethodMap currentIdentifierMap rExpr of
  Nothing -> Nothing
{-  Just rType -> HashMap.lookup (rType,s) classMethodMap-}
-}




getMethodReturn :: Maybe MethodType -> Maybe String
getMethodReturn (Just (MethodType _ _ s)) = Just s                
getMethodReturn Nothing = Nothing





{-This checks to make sure that:

Ands are made out of two booleans
Ors are made out of two booleans
Nots are made out of one boolean

If/Else/Elif conditionals are booleans

While conditionals are booleans

Method Invocations have the correct number of arguments

Method Inocations have correct types for all arguments


Method Invocations refer to methods that exist


Method Invocations have correct return type


return is not performed (outside of method)


Again, this is not for code inside of classes....


-}




checkTypesOkayRExpr :: HashMap.Map String (Maybe String, ClassDef) -> HashMap.Map (String, String) MethodType -> HashMap.Map String String -> RExpr -> [(String, Int)]
checkTypesOkayRExpr hierarchy classMethodMap identifierMap rExpr =
 case rExpr of
   RExprStringLiteral s lineNumber -> [] {-I'm not sure if there's an issue here. I couldn't be making this the wrong type could I?-}
   RExprIntLiteral i lineNumber -> []
   RExprFromLExpr lExpr lineNumber -> checkTypesOkayLExpr hierarchy classMethodMap identifierMap lExpr
   RExprAnd rExpr1 rExpr2 lineNumber -> 
    (checkTypesOkayRExpr hierarchy classMethodMap identifierMap rExpr1) ++
    (checkTypesOkayRExpr hierarchy classMethodMap identifierMap rExpr2) ++ 
    (if getTypeRExpr hierarchy classMethodMap identifierMap rExpr1 /= Just "Boolean" then [("First argument of AND must be a boolean", lineNumber)] else []) ++
    (if getTypeRExpr hierarchy classMethodMap identifierMap rExpr2 /= Just "Boolean" then [("Second argument of AND must be a boolean", lineNumber)] else [])
   RExprOr rExpr1 rExpr2 lineNumber ->
     (checkTypesOkayRExpr hierarchy classMethodMap identifierMap rExpr1) ++
     (checkTypesOkayRExpr hierarchy classMethodMap identifierMap rExpr2) ++
     (if getTypeRExpr hierarchy classMethodMap identifierMap rExpr1 /= Just "Boolean" then [("First argument of OR must be a boolean", lineNumber)] else []) ++
     (if getTypeRExpr hierarchy classMethodMap identifierMap rExpr2 /= Just "Boolean" then [("Second argument of OR must be a boolean", lineNumber)] else [])
   RExprNot rExpr lineNumber ->
     (checkTypesOkayRExpr hierarchy classMethodMap identifierMap rExpr) ++           
     (if getTypeRExpr hierarchy classMethodMap identifierMap rExpr /= Just "Boolean" then [("Argument of NOT must be a boolean", lineNumber)] else []) 
   RExprMethodInvocation rExpr methodName arguments lineNumber ->
     (checkTypesOkayRExpr hierarchy classMethodMap identifierMap rExpr) ++
     ([]
     
     {-
     
     NOT DONE YET!!!!!!
     -}
     )
   RExprConstructorInvocation constructorName arguments lineNumber -> error "constructor type checking not implemented yet"

checkTypesOkayLExpr :: HashMap.Map String (Maybe String, ClassDef) -> HashMap.Map (String, String) MethodType -> HashMap.Map String String -> LExpr -> [(String, Int)]
checkTypesOkayLExpr hierarchy classMethodMap identifierMap lExpr =
 case lExpr of
  LExprId s lineNumber -> []
  LExprDotted rExpr s lineNumber -> (checkTypesOkayRExpr hierarchy classMethodMap identifierMap rExpr) ++ [("Cannot access fields of external Obj", lineNumber)]





getLineNumberRExpr :: RExpr -> Int
getLineNumberRExpr (RExprStringLiteral _ n) = n
getLineNumberRExpr (RExprIntLiteral _ n) = n
getLineNumberRExpr (RExprFromLExpr _ n) = n
getLineNumberRExpr (RExprAnd _ _ n) = n
getLineNumberRExpr (RExprOr _ _ n) = n
getLineNumberRExpr (RExprNot _ n) = n
getLineNumberRExpr (RExprMethodInvocation _ _ _ n) = n
getLineNumbeRExpr (RExprConstructorInvocation _ _ n) = n

checkIfBool :: HashMap.Map String (Maybe String, ClassDef) -> HashMap.Map (String, String) MethodType -> HashMap.Map String String -> RExpr -> [(String, Int)]
checkIfBool hierarchy classMethodMap identifierMap rExpr =
 if getTypeRExpr hierarchy classMethodMap identifierMap rExpr == Just "Boolean" then []
 else [("conditional must be boolean", getLineNumberRExpr rExpr)]

helpCheckTypesOkaySingleStatement :: HashMap.Map String (Maybe String, ClassDef) -> HashMap.Map (String, String) MethodType -> HashMap.Map String String -> (RExpr, [Statement]) -> [(String, Int)]
helpCheckTypesOkaySingleStatement hierarchy classMethodMap identifierMap (rExpr,statements) =
 (checkTypesOkayRExpr hierarchy classMethodMap identifierMap rExpr) ++
 (checkTypesOkay hierarchy classMethodMap identifierMap statements) ++
 (checkIfBool hierarchy classMethodMap identifierMap rExpr)

checkTypesOkaySingleStatement :: HashMap.Map String (Maybe String, ClassDef) -> HashMap.Map (String, String) MethodType -> HashMap.Map String String -> Statement -> [(String,Int)]
checkTypesOkaySingleStatement hierarchy classMethodMap identifierMap statement =
 case statement of
  ParserIfWithElse rExpr statements list statements2 lineNumber ->
   (checkTypesOkayRExpr hierarchy classMethodMap identifierMap rExpr) ++
   (checkTypesOkay hierarchy classMethodMap identifierMap statements) ++
   (concat $ map (helpCheckTypesOkaySingleStatement hierarchy classMethodMap identifierMap) list) ++
   (checkTypesOkay hierarchy classMethodMap identifierMap statements2)
  ParserIfWithoutElse rExpr statements list lineNumber ->
   (checkTypesOkayRExpr hierarchy classMethodMap identifierMap rExpr) ++
   (checkTypesOkay hierarchy classMethodMap identifierMap statements) ++
   (concat $ map (helpCheckTypesOkaySingleStatement hierarchy classMethodMap identifierMap) list)

  ParserWhile rExpr statements lineNumber -> undefined
  ParserReturn rExpr lineNumber -> [("Return statement only valid inside method", lineNumber)]
  ParserReturnUnit lineNumber -> [] {-?#$?@#?@#???!!?!?!?!?!?-}
  ParserAssign lExpr rExpr lineNumber ->
   let r = getTypeRExpr hierarchy classMethodMap identifierMap rExpr in
   let l = getTypeLExpr hierarchy classMethodMap identifierMap lExpr in
    (if (r==l) then [] else [("Incompatible l-type and r-type", lineNumber)]) ++
    (checkTypesOkayRExpr hierarchy classMethodMap identifierMap rExpr) ++
    (checkTypesOkayLExpr hierarchy classMethodMap identifierMap lExpr)
  ParserBareExpression rExpr lineNumber -> []





checkTypesOkay :: HashMap.Map String (Maybe String, ClassDef) -> HashMap.Map (String, String) MethodType -> HashMap.Map String String -> [Statement] -> [(String,Int)]
checkTypesOkay hierarchy classMethodMap identifierMap statements = concat $ map (checkTypesOkaySingleStatement hierarchy classMethodMap identifierMap) statements


{-WANT SEPARATE CHECK TO MAKE SURE ANDS ORS AND NOT REFER TO BOOLEANS...-}

{-Want a separate check to make sure all methods have the right number of arguments and all arguments are of okay type.-}

getTypeRExpr :: HashMap.Map String (Maybe String, ClassDef) -> HashMap.Map (String, String) MethodType ->  HashMap.Map String String -> RExpr -> Maybe String
getTypeRExpr hierarchy classMethodMap currentIdentifierMap rExpr =
 case rExpr of
  (RExprStringLiteral s lineNumber) -> Just "String"
  (RExprIntLiteral s lineNumber) -> Just "Int"
  (RExprFromLExpr lExpr lineNumber) -> getTypeLExpr hierarchy classMethodMap currentIdentifierMap lExpr
  (RExprAnd rExpr1 rExpr2 lineNumber) -> Just "Boolean"
  (RExprOr rExpr1 rExpr2 lineNumber) -> Just "Boolean"
  (RExprNot rExpr lineNumber) -> Just "Boolean"
  (RExprMethodInvocation rExpr methodName arguments lineNumber) ->
   case getTypeRExpr hierarchy classMethodMap currentIdentifierMap rExpr of
    Nothing -> Nothing
    Just rType -> getMethodReturn $ HashMap.lookup (rType, methodName) classMethodMap {-assuming only one method per class and method name-}
  (RExprConstructorInvocation constructorName arguments lineNumber) -> Just constructorName



updateSubtypesSingleStatement :: HashMap.Map String (Maybe String, ClassDef) -> HashMap.Map (String,String) MethodType -> Statement -> HashMap.Map String String -> (HashMap.Map String String,Bool)
updateSubtypesSingleStatement hierarchy classMethodMap (ParserIfWithElse rexpr listStatement1 listRExprListStatement listStatement2 lineNumber) currentIdentifierMap = generateSubtypes' hierarchy classMethodMap (listStatement1 ++ (concat $ map snd listRExprListStatement) ++ listStatement2) currentIdentifierMap
updateSubtypesSingleStatement hierarchy classMethodMap (ParserIfWithoutElse rexpr listStatement listRExprListStatement lineNumber) currentIdentifierMap = generateSubtypes' hierarchy classMethodMap (listStatement ++ (concat $ map snd listRExprListStatement)) currentIdentifierMap
updateSubtypesSingleStatement hierarchy classMethodMap (ParserWhile rexpr listStatement lineNumber) currentIdentifierMap = generateSubtypes' hierarchy classMethodMap listStatement currentIdentifierMap
updateSubtypesSingleStatement hierarchy classMethodMap (ParserReturn rexpr lineNumber) currentIdentifierMap = (currentIdentifierMap, False)
updateSubtypesSingleStatement hierarchy classMethodMap (ParserReturnUnit lineNumber) currentIdentifierMap = (currentIdentifierMap, False)
updateSubtypesSingleStatement hierarchy classMethodMap (ParserAssign (LExprId identifier lineNumber) rExpr lineNumber22) currentIdentifierMap =
 let currentType = HashMap.lookup identifier currentIdentifierMap in
  case currentType of
   Nothing -> case getTypeRExpr hierarchy classMethodMap currentIdentifierMap rExpr of
    Just s -> (HashMap.insert identifier s currentIdentifierMap, True)
    Nothing -> (currentIdentifierMap,False)
   Just currentType' -> case getTypeRExpr hierarchy classMethodMap currentIdentifierMap rExpr of
    Just s -> let unifiedTypes = getCommonAncestorFromMap hierarchy s currentType' in (HashMap.insert identifier unifiedTypes currentIdentifierMap, if unifiedTypes == currentType' then False else True)
    Nothing -> (currentIdentifierMap,False)


updateSubtypesSingleStatement hierarchy classMethodMap (ParserAssign (LExprDotted rExpr fieldName lineNumber2) rExpr2 lineNumber3) currentIdentifierMap =
 let nameThing = thisDotFieldHack ++ fieldName in
 let currentType = HashMap.lookup nameThing currentIdentifierMap in
  case currentType of
   Nothing -> case getTypeRExpr hierarchy classMethodMap currentIdentifierMap rExpr2 of
    Just s -> (HashMap.insert nameThing s currentIdentifierMap, True)
    Nothing -> (currentIdentifierMap, False)
   Just currentType' -> case getTypeRExpr hierarchy classMethodMap currentIdentifierMap rExpr2 of
    Just s ->
     let unifiedTypes = getCommonAncestorFromMap hierarchy s currentType' in
     (HashMap.insert nameThing unifiedTypes currentIdentifierMap, if unifiedTypes == currentType' then False else True)
    Nothing -> (currentIdentifierMap, False)


updateSubtypesSingleStatement hierarchy classMethodMap (ParserBareExpression rexpr lineNumber) currentIdentifierMap = (currentIdentifierMap, False)

generateSubtypes' :: HashMap.Map String (Maybe String, ClassDef) -> HashMap.Map (String, String) MethodType -> [Statement] -> HashMap.Map String String -> (HashMap.Map String String, Bool)
generateSubtypes' hierarchy classMethodMap [] currentIdentifierMap = (currentIdentifierMap,False)
generateSubtypes' hierarchy classMethodMap (x:xs) currentIdentifierMap =
 let (newMap, wasUpdated) = updateSubtypesSingleStatement hierarchy classMethodMap x currentIdentifierMap in
 let (newMap', wasUpdated') = generateSubtypes' hierarchy classMethodMap xs newMap in (newMap', wasUpdated || wasUpdated')

generateSubtypes :: HashMap.Map String (Maybe String, ClassDef) -> HashMap.Map (String,String) MethodType -> [Statement] -> HashMap.Map String String -> HashMap.Map String String
generateSubtypes hierarchy classMethodMap statements currentIdentifierMap =
 let (newMap,wasUpdated) = generateSubtypes' hierarchy classMethodMap statements currentIdentifierMap in
  case wasUpdated of
   True -> generateSubtypes hierarchy classMethodMap statements newMap
   False -> newMap



keepThisOrNot :: (String,String) -> [(String,String)]
keepThisOrNot (varName, varType) =
 if (take 9 varName == "this_dot_") then [({-drop 9 -}varName, varType)] else []


whatAreTheThis :: [(String,String)] -> [(String,String)]
whatAreTheThis identifierMap = concat $ map keepThisOrNot identifierMap



makeSureBooleanL :: HashMap.Map (String,String) MethodType -> HashMap.Map String String -> LExpr -> Bool
makeSureBooleanL classMethodMap identifierMap (LExprId s lineNumber) = undefined
makeSureBooleanL classMethodMap identifierMap (LExprDotted rExpr fieldName lineNumber) = undefined

makeSureBoolean :: HashMap.Map (String,String) MethodType -> HashMap.Map String String -> RExpr -> Bool
makeSureBoolean classMethodMap identifierMap (RExprStringLiteral _ lineNumber) = False
makeSureBoolean classMethodMap identifierMap (RExprIntLiteral _ lineNumber) = False
makeSureBoolean classMethodMap identifierMap (RExprFromLExpr lExpr lineNumber) = makeSureBooleanL classMethodMap identifierMap lExpr
makeSureBoolean classMethodMap identifierMap (RExprAnd rExpr1 rExpr2 lineNumber) = (makeSureBoolean classMethodMap identifierMap rExpr1) && (makeSureBoolean classMethodMap identifierMap rExpr2)
makeSureBoolean classMethodMap identifierMap (RExprOr rExpr1 rExpr2 lineNumber) = (makeSureBoolean classMethodMap identifierMap rExpr1) && (makeSureBoolean classMethodMap identifierMap rExpr2)
makeSureBoolean classMethodMap identifierMap (RExprNot rExpr lineNumber) = makeSureBoolean classMethodMap identifierMap rExpr
makeSureBoolean classMethodMap identifierMap (RExprMethodInvocation rExpr methodName arguments lineNumber) = undefined {-lots of type checking to do here.-}
makeSureBoolean classMethodMap identifierMap (RExprConstructorInvocation constructorName arguments lineNumber) = undefined




generateClassMethodsSingle :: String -> MethodType -> HashMap.Map (String, String) MethodType
generateClassMethodsSingle s (MethodType methodName arguments returnType) = HashMap.insert (s,methodName) (MethodType methodName arguments returnType) (HashMap.empty)                           

generateClassMethods :: String -> [MethodType] -> HashMap.Map (String, String) MethodType
generateClassMethods s [] = HashMap.empty
generateClassMethods s (x:xs) = HashMap.union (generateClassMethodsSingle s x) (generateClassMethods s xs)

generateClassMethodMap :: [(String, [MethodType])] -> HashMap.Map (String,String) MethodType
generateClassMethodMap [] = HashMap.empty
generateClassMethodMap ((s,m):xs) = HashMap.union (generateClassMethods s m) (generateClassMethodMap xs) 

getProgramStatements :: Program -> [Statement] {-Just get the statements after the class definitions...-}
getProgramStatements (Program _ statements) = statements




























getNextIdentifier :: Integer -> String
getNextIdentifier x = "varName" ++ ( show $ x + 1   )               

{-

 checkTypesOkaySingleStatement :: HashMap.Map String (Maybe String, ClassDef) -> HashMap.Map (String, String) MethodType -> HashMap.Map String String -> Statement -> [(String,Int)]
  checkTypesOkaySingleStatement hierarchy classMethodMap identifierMap statement =

-}

{-


switched to using separate argument for this. identifierTypeMap . Oh identifier type map has name and type, as opposed to just type. UGH

Wait, I should have the C type as well.... let's just say that's what it has.



This whole scheme doesn't really work.. :(

 hierarchy, classMethodMap, identifierMap. Here identifierMap maps to (name,type), where name is the name of the term in the generated C file
-}








{-
    case rExpr of
         RExprIntLiteral value lineNumber -> (HashMap.empty {-WRONG-} , HashMap.empty {-WRONG-},argCounter + 1,"obj_Int " ++ (getNextIdentifier argCounter) ++ ";\n" ++ (getNextIdentifier   argCounter) ++ " = (obj_Int) int_literal(" ++ (value) ++ ");")
              _ -> undefined
                 -}




shaveObj_ :: String -> String
shaveObj_ s = drop 4 s


getMethodType :: String -> String -> HashMap.Map (String, String) MethodType -> MethodType
getMethodType classType methodName classMethodMap =
 case HashMap.lookup (classType, methodName) classMethodMap of
  Just methodType -> methodType
  Nothing -> error $ "class method not found!" ++ (show classMethodMap) ++ "\n" ++ (classType) ++ "\n" ++ (methodName)




shouldBeMonad :: HashMap.Map String (Maybe String, ClassDef) ->
                 HashMap.Map (String, String) MethodType ->
                 HashMap.Map String (String,String) ->
                 HashMap.Map String String ->
                 Integer ->
                 [HashMap.Map String (Maybe String, ClassDef) ->
                  HashMap.Map (String, String) MethodType ->
                  HashMap.Map String (String, String) ->
                  HashMap.Map String String ->
                  Integer ->
                  (HashMap.Map String (String, String), HashMap.Map String String, Integer, String, String, String)
                 ] ->
                 (HashMap.Map String (String, String), HashMap.Map String String, Integer, String, [(String, String)])

{-the final pair here is a list of the name that a variable has, followed by its type. These are the return values from all of the subexpressions passed.-}

shouldBeMonad hierarchy classMethodMap identifierTypeMap identifierMap argCounter functions =
 case functions of
  [] -> (identifierTypeMap, identifierMap, argCounter, "", [])
  (x:xs) ->
   let (identifierTypeMap', identifierMap', argCounter', code', varName', varType') = x hierarchy classMethodMap identifierTypeMap identifierMap argCounter in
   let (identifierTypeMap'', identifierMap'', argCounter'', code'', returns) = shouldBeMonad hierarchy classMethodMap identifierTypeMap' identifierMap' argCounter' xs in
   let retVal = (identifierTypeMap'', identifierMap'', argCounter'', code'++code'', (varName',varType'):returns) in
   retVal




{-

return:

code,
name of variable that value is stored in,
type of variable that value is stored in.


-}




{-
generateArguments :: [RExpr] -> HashMap String (Maybe String, ClassDef) -> 
-}





generateMethodInvocation :: [String] -> String
generateMethodInvocation [] = ""
generateMethodInvocation [x] = x
generateMethodInvocation (x1:x2:xs) = x1 ++ "," ++ generateMethodInvocation (x2 : xs)

{-returns new identfierTypeMap, new identifierMap, new counter, and the name of the variable used.-}
pushVariable :: HashMap.Map String (String,String) -> Integer -> String -> (HashMap.Map String (String, String),  Integer, String)
pushVariable identifierTypeMap counter varType =
 let varName = getNextIdentifier counter in
 (HashMap.insert varName (varName, varType) identifierTypeMap, counter + 1, varName)







generateRExpr :: RExpr -> HashMap.Map String (Maybe String, ClassDef) -> HashMap.Map (String, String) MethodType -> HashMap.Map String (String, String) -> HashMap.Map String String -> Integer -> (HashMap.Map String (String, String), HashMap.Map String String, Integer, String, String, String)
generateRExpr rExpr hierarchy classMethodMap identifierTypeMap identifierMap argCounter =
 case rExpr of
  (RExprStringLiteral value _) ->
   let (identifierTypeMap', counter', varName') = pushVariable identifierTypeMap argCounter "obj_String" in
   (identifierTypeMap', identifierMap, counter', "obj_String " ++ varName' ++ ";\n" ++ varName' ++ " = (obj_String) str_literal(" ++ ("\"" ++ value ++ "\"") ++ ");\n" , varName', "obj_String")

  (RExprIntLiteral value lineNumber) ->
   let (identifierTypeMap', counter', varName') = pushVariable identifierTypeMap argCounter "obj_Int" in
   (identifierTypeMap', identifierMap, counter', "obj_Int " ++ varName' ++ ";\n" ++ varName' ++ " = (obj_Int) int_literal(" ++ value ++ ");\n" ,varName',"obj_Int")

  (RExprAnd rExpr1 rExpr2 _) ->
   let (identifierTypeMap', identifierMap', counter', code', varName', varType') = generateRExpr rExpr1 hierarchy classMethodMap identifierTypeMap identifierMap argCounter in
   let (identifierTypeMap'', identifierMap'', counter'', code'', varName'', varType'') = generateRExpr rExpr2 hierarchy classMethodMap identifierTypeMap' identifierMap' counter' in
   let (identifierTypeMap''', counter''', varName''') = pushVariable identifierTypeMap'' counter'' "obj_Boolean" in
   (identifierTypeMap''', identifierMap'', counter''', "obj_Boolean " ++ varName'''  ++ " = lit_false;\n" ++ code' ++ "if(" ++ varName' ++ " == lit_true){\n" ++ code'' ++ "if(" ++ varName'' ++ " == lit_true){\n" ++ varName''' ++ " = (obj_Boolean) " ++ "lit_true" ++ ";\n}\n}", varName''', "obj_Boolean")
  (RExprOr rExpr1 rExpr2 _) ->
   let (identifierTypeMap', identifierMap', counter', code', varName', varType') = generateRExpr rExpr1 hierarchy classMethodMap identifierTypeMap identifierMap argCounter in
   let (identifierTypeMap'', identifierMap'', counter'', code'', varName'', varType'') = generateRExpr rExpr2 hierarchy classMethodMap identifierTypeMap' identifierMap' counter' in
   let (identifierTypeMap''', counter''', varName''') = pushVariable identifierTypeMap'' counter'' "obj_Boolean" in
   (identifierTypeMap''', identifierMap'', counter''', "obj_Boolean " ++ varName'''  ++ " = lit_true;\n" ++ code' ++ "if(" ++ varName' ++ " == lit_false){\n" ++ code'' ++ "if(" ++ varName'' ++ " == lit_false){\n" ++ varName''' ++ " = (obj_Boolean) " ++ "lit_false" ++ ";\n}\n}", varName''', "obj_Boolean")




  (RExprNot rExpr1 _) ->
   let (identifierTypeMap', identifierMap', counter', code', varName', varType') = generateRExpr rExpr1 hierarchy classMethodMap identifierTypeMap identifierMap argCounter in
   let (identifierTypeMap'', counter'', varName'') = pushVariable identifierTypeMap' counter' "obj_Boolean" in
   (identifierTypeMap'', identifierMap', counter'', code' ++ "obj_Boolean " ++ varName'' ++ ";\n" ++ varName'' ++ " = (obj_Boolean) " ++ varName' ++ ";\n" ++ "if(" ++ varName'' ++ " == lit_true){" ++ varName'' ++ "= lit_false;}\nelse{" ++ varName'' ++ "= lit_true;}"      , varName'', "obj_Boolean")



  (RExprMethodInvocation rExpr methodName arguments _) ->
   let (identifierTypeMap',identifierMap',counter',code', varName' , varType') = (generateRExpr rExpr hierarchy classMethodMap identifierTypeMap identifierMap argCounter) in
   let methodType = getMethodType (shaveObj_ $ getTypeBack varName' identifierTypeMap') methodName classMethodMap in
   let (MethodType mn argt rett) = methodType in
   let (identifierTypeMap'', identifierMap'', counter'', code'', pairs'') = shouldBeMonad hierarchy classMethodMap identifierTypeMap' identifierMap' counter' (map generateRExpr arguments) in
   let methodCall = varName' ++ "->clazz->" ++ mn ++ "(" in
   let nextName = getNextIdentifier counter'' in
   let (identifierTypeMap''', counter''', varName''') = pushVariable identifierTypeMap'' counter'' ("obj_" ++ rett) in
   let ggg = "obj_" ++ rett ++ " " ++ nextName ++ ";\n" in
   (identifierTypeMap''', identifierMap'', counter''', (code' ++ code''++ ggg ++ nextName ++ " = (obj_" ++ rett ++ ") " ++ methodCall ++ (generateMethodInvocation $ varName' : (map fst pairs'') ) ++ ");\n"), nextName, rett)

{-  (HashMap.Map String (String, String), HashMap.Map String String, Integer, String, [(String, String)]) -}
{-shouldBeMonad hierarchy classMethodMap identifierTypeMap identifierMap argCounter functions =-}

   {-error (mn ++ (show argt) ++ (show rett))-}
   {-let call = (getTypeBack (getNextIdentifier (c-1{-really -1 here?-})) a) ++ "__" ++ methodName ++ "(" ++ ")" in
   (a,b,c,d ++ "\n" ++ call) {-incorrect-}
  -}
  (RExprConstructorInvocation className rExprArguments _) ->
   let (identifierTypeMap', counter', code', varName', varType') = generateConstructorApplication className rExprArguments hierarchy classMethodMap identifierTypeMap identifierMap argCounter in
   (identifierTypeMap', identifierMap, counter', code', varName', varType')
  (RExprFromLExpr lExpr _) -> let (a,b,c,d, e ,f) = generateLExpr lExpr hierarchy classMethodMap identifierTypeMap identifierMap argCounter in (a,b,c,d,e, f)

generateConstructorApplication :: String -> [RExpr] -> HashMap.Map String (Maybe String, ClassDef) -> HashMap.Map (String, String) MethodType -> HashMap.Map String (String, String) -> HashMap.Map String String -> Integer -> (HashMap.Map String (String, String), Integer, String, String, String)


generateConstructorApplication className arguments hierarchy classMethodMap identifierTypeMap identifierMap argCounter =


 let (identifierTypeMap', counter', varName') = pushVariable identifierTypeMap argCounter ("obj_" ++ className) in
 let (identifierTypeMap'', _, counter'', code'', pairs'') = shouldBeMonad hierarchy classMethodMap identifierTypeMap' identifierMap counter' (map generateRExpr arguments) in
 let constructorCall = "the_class_" ++ className ++ "->constructor(" ++ (generateMethodInvocation $ map fst pairs'') ++ ");\n" in
 let foo = "obj_" ++ className ++ " " ++ varName' ++ ";\n" in
 let bar = varName' ++ " = " in
 let retVal = (identifierTypeMap'', counter'',foo ++ bar ++ constructorCall, varName', "obj_" ++ className) in
 retVal


getThisType :: HashMap.Map String String -> String
getThisType identifierMap =
 case HashMap.lookup "this" identifierMap of
  Nothing -> error "error: this not found"
  Just s -> s

generateLExpr :: LExpr -> HashMap.Map String (Maybe String, ClassDef) -> HashMap.Map (String, String) MethodType -> HashMap.Map String (String, String) -> HashMap.Map String String -> Integer -> (HashMap.Map String (String, String), HashMap.Map String String, Integer, String, String, String)
generateLExpr lExpr hierarchy classMethodMap identifierTypeMap identifierMap argCounter =
 case lExpr of
  LExprId quackVarName _ ->
   case HashMap.lookup quackVarName identifierTypeMap of
    Just (a,b) -> (identifierTypeMap, identifierMap, argCounter, "", a, b) {-code field maybe wrong..-}
    Nothing ->
     case HashMap.lookup quackVarName identifierMap of
      Nothing -> error $ "static type not found " ++ quackVarName
      {-This way x = ... will insert both x and the cvar used for x into the key.-}
      Just t -> (HashMap.insert (getNextIdentifier $ argCounter)  (getNextIdentifier $ argCounter,"obj_"++t) (HashMap.insert quackVarName (getNextIdentifier $ argCounter,"obj_"++t) identifierTypeMap),
                identifierMap,
                argCounter + 1,
                "obj_" ++ t ++ " " ++ (getNextIdentifier $ argCounter) ++ ";\n", (getNextIdentifier $ argCounter), "obj_"++t)
  LExprDotted rExpr fieldName _ ->
   let (identifierTypeMap', _, counter', code', varName', varType') = generateRExpr rExpr hierarchy classMethodMap identifierTypeMap identifierMap argCounter in
   let thisType = getThisType identifierMap in
   let (identifierTypeMap'', counter'', varName'') = pushVariable identifierTypeMap' counter' thisType in
   let code'' = "obj_" ++ thisType ++ " " ++ varName'' ++ " = this->" ++ fieldName ++ ";\n" in
   (identifierTypeMap'', identifierMap, counter'', code'++code'', {-varName''-} "this->" ++ fieldName, thisType)
    
{-wrong type as I care about the type of the field...  eventually I will have that in my identifierMap....-}




generateElif :: HashMap.Map String (Maybe String, ClassDef) -> HashMap.Map (String, String) MethodType -> HashMap.Map String (String, String) -> HashMap.Map String String -> Integer -> (RExpr, [Statement]) -> (HashMap.Map String (String, String), HashMap.Map String String, Integer, String)
generateElif = undefined

generateElifs :: HashMap.Map String (Maybe String, ClassDef) -> HashMap.Map (String, String) MethodType -> HashMap.Map String (String, String) -> HashMap.Map String String -> Integer -> [(RExpr, [Statement])] -> (HashMap.Map String (String, String), HashMap.Map String String, Integer, String) {-HAS TO PUT elif {} WRAPPER-}
generateElifs hierarchy classMethodMap identifierTypeMap identifierMap argCounter elifs =
 case elifs of
  [] -> (identifierTypeMap, identifierMap, argCounter, "")
  (x:xs) -> error "elifs not implemented"




getTypeBack :: String -> HashMap.Map String (String, String) -> String
getTypeBack s m =
 case HashMap.lookup s m of
  Just(n,t) -> t
  Nothing -> error ("c variable name not found.. " ++ s ++ (show m))


generateStatement :: HashMap.Map String (Maybe String, ClassDef) -> HashMap.Map (String, String) MethodType -> HashMap.Map String (String, String) -> HashMap.Map String String -> Integer -> Statement -> (HashMap.Map String (String,String), HashMap.Map String String, Integer, String, String, String)
generateStatement hierarchy classMethodMap identifierTypeMap identifierMap argCounter statement =
 case statement of {- not sure this should be here for bare expression... but at least I can test some stuff? -}
  ParserBareExpression rExpr lineNumber -> generateRExpr rExpr hierarchy classMethodMap identifierTypeMap identifierMap argCounter
  
  




  ParserAssign lExpr rExpr lineNumber ->
   let (identifierTypeMap', identifierMap', argCounter', code', varName' , varType' ) = generateRExpr rExpr hierarchy classMethodMap identifierTypeMap identifierMap argCounter in
   let (identifierTypeMap'', identifierMap'', argCounter'', code'', varName'', varType'') = generateLExpr lExpr hierarchy classMethodMap identifierTypeMap' identifierMap' argCounter' in
   (identifierTypeMap'', identifierMap'', argCounter'', code' ++"\n"++ code'' ++ varName'' ++ " = (" ++ (getTypeBack (getNextIdentifier (argCounter'-1)) identifierTypeMap') ++ ") "
    ++ (getNextIdentifier (argCounter' - 1)) ++ ";", getNextIdentifier (argCounter'' - 1), varType' {-varType dummy value...-}
   )
   
  ParserReturnUnit _ -> error "empty return not implemented."{-(identifierTypeMap, identifierMap, argCounter, "return;\n", undefined, undefined)-}
  ParserReturn rExpr _ ->
   let (identifierTypeMap', identifierMap', argCounter', code', varName', varType') = generateRExpr rExpr hierarchy classMethodMap identifierTypeMap identifierMap argCounter in
   (identifierTypeMap', identifierMap', argCounter', code' ++ "return " ++ varName' ++ ";\n", varName', varType') {-really dummy values here.-}
  ParserWhile rExpr statements _ ->
   let (identifierTypeMap', identifierMap', argCounter', code', varName', varType') = generateRExpr rExpr hierarchy classMethodMap identifierTypeMap identifierMap argCounter in
   let (identifierTypeMap'', identifierMap'', argCounter'', code'') = generateStatements hierarchy classMethodMap identifierTypeMap' identifierMap' argCounter' statements in
   let (identifierTypeMap''', identifierMap''', argCounter''', code''', varName''', varType''') = generateRExpr rExpr hierarchy classMethodMap identifierTypeMap'' identifierMap'' argCounter'' in
   (identifierTypeMap''', identifierMap''', argCounter''', code' ++ "while(" ++ varName' ++ " == lit_true){\n" ++ code'' ++ code''' ++
    {-store back in conditional-} varName' ++ " = (obj_Boolean) " ++ varName''' ++ ";\n" {-issue with varType being Boolean instead of obj_Boolean..-}
    ++ "}\n", varName', varType') {-again, dummy values...-}

  ParserIfWithoutElse rExpr statements elifs _ -> 
   let (identifierTypeMap', identifierMap', argCounter', code', varName', varType') = generateRExpr rExpr hierarchy classMethodMap identifierTypeMap identifierMap argCounter in
   let (identifierTypeMap'', identifierMap'', argCounter'', code'') = generateStatements hierarchy classMethodMap identifierTypeMap' identifierMap' argCounter' statements in
   let (identifierTypeMap''', identifierMap''', argCounter''', code''') = generateElifs hierarchy classMethodMap identifierTypeMap'' identifierMap'' argCounter'' elifs in
    (identifierTypeMap''',identifierMap''',argCounter''',code' ++ "if(" ++ varName' ++ " == lit_true){\n" ++ code'' ++ "}" ++ code''', varName', varType') {-name and type dummy values...-}
  ParserIfWithElse rExpr statements elifs elseStatements _ -> 
   let (identifierTypeMap', identifierMap', argCounter', code', varName', varType') = generateRExpr rExpr hierarchy classMethodMap identifierTypeMap identifierMap argCounter in
   let (identifierTypeMap'', identifierMap'', argCounter'', code'') = generateStatements hierarchy classMethodMap identifierTypeMap' identifierMap' argCounter' statements in
   let (identifierTypeMap''', identifierMap''', argCounter''', code''') = generateElifs hierarchy classMethodMap identifierTypeMap'' identifierMap'' argCounter'' elifs in
   let (identifierTypeMap'''', identifierMap'''', argCounter'''', code'''') = generateStatements hierarchy classMethodMap identifierTypeMap''' identifierMap''' argCounter''' elseStatements in
        (identifierTypeMap'''',identifierMap'''',argCounter'''',code' ++ "if(" ++ varName' ++ " == lit_true)\n{" ++ code'' ++ "}" ++ code''' ++ "else {\n" ++ code'''' ++ "\n}\n"
        , varName', varType') {-name and type dummy values-}



generateStatements :: HashMap.Map String (Maybe String, ClassDef) -> HashMap.Map (String, String) MethodType -> HashMap.Map String (String, String) -> HashMap.Map String String -> Integer -> [Statement] -> (HashMap.Map String (String, String), HashMap.Map String String, Integer, String)
generateStatements hierarchy classMethodMap identifierTypeMap identifierMap argCounter statements =
 case statements of
  [] -> (identifierTypeMap, identifierMap, argCounter, "")
  (x:xs) ->
   let (identifierTypeMap', identifierMap', argCounter', code', _, _) = generateStatement hierarchy classMethodMap identifierTypeMap identifierMap argCounter x in
   let (identifierTypeMap'', identifierMap'', argCounter'', code'') = generateStatements hierarchy classMethodMap identifierTypeMap' identifierMap' argCounter' xs in
     (identifierTypeMap'', identifierMap'', argCounter'', code' ++ "\n" ++ code'')






generateStatements' :: HashMap.Map String (Maybe String, ClassDef) -> HashMap.Map (String, String) MethodType -> HashMap.Map String (String, String) -> HashMap.Map String String -> Integer -> [Statement] -> String
generateStatements' hierarchy classMethodMap identifierTypeMap identifierMap argCounter statements =
  let (w,x,y,z) = generateStatements hierarchy classMethodMap identifierTypeMap identifierMap argCounter statements in z





getReturnTypeBlarg :: Maybe MethodType -> String
getReturnTypeBlarg methodType =
 case methodType of
  Just (MethodType _ _ returnType) -> returnType
  Nothing -> error "unexpected herp derp"




{-REMEMBER TO ADD THIS TO ARGUMENT LIST-}

generateArgumentThing :: HashMap.Map String (String, String) -> Integer -> [(String,String)] -> (HashMap.Map String (String, String) , Integer, String)
generateArgumentThing identifierTypeMap counter [] = (identifierTypeMap, counter, "")
generateArgumentThing identifierTypeMap counter [(varName, varType)] =
 let (identifierTypeMap', counter', varName') = pushVariable identifierTypeMap counter ("obj_" ++ varType) in
 (HashMap.insert varName (varName', "obj_" ++ varType) identifierTypeMap', counter', "obj_" ++ varType ++ " " ++ varName')
 
generateArgumentThing identifierTypeMap counter ((varName, varType):x2:xs) =
 let (identifierTypeMap', counter', varName') = pushVariable identifierTypeMap counter ("obj_" ++ varType) in
 let newMap = (HashMap.insert varName (varName', "obj_" ++ varType) identifierTypeMap') in
 let (identifierTypeMap''', counter''', varList) = generateArgumentThing newMap counter' (x2:xs) in
 (identifierTypeMap''', counter''', "obj_" ++ varType ++ " " ++ varName' ++ "," ++ varList)



generateArgumentThingJustType :: [(String, String)] -> String
generateArgumentThingJustType arguments =
 case arguments of
  [] -> "void"
  [x] -> "obj_" ++ snd x
  (x1:x2:xs) -> ("obj_"++ (snd x1)) ++ "," ++ (generateArgumentThingJustType (x2:xs))


{-

These actually aren't typed and inferred method.

I always assume methods are given their return type.

If they are not, it is nothing, but I still put it in an "InferredMethod" node. This is terrible.
-}


doComma x =
 case x of
 [] -> ""
 _ -> ","




argumentsIdentifierMap :: [(String, String)] -> HashMap.Map String String
argumentsIdentifierMap = HashMap.fromList  

generateMethod :: HashMap.Map String String -> HashMap.Map String (Maybe String, ClassDef) -> HashMap.Map (String, String) MethodType -> String -> Method -> String
generateMethod identifierMap__ hierarchy classMethodMap className method =
 case method of
  TypedMethod methodName arguments returnType body ->
   let identifierMap_ = generateSubtypes hierarchy classMethodMap body (HashMap.union identifierMap__ $ argumentsIdentifierMap arguments) in
   let identifierMap = (HashMap.insert "this" className identifierMap_) in

{-NEED TO PUT THIS IN CONSTRUCTORS AS WELL, AND ALSO NEED TO PUT FIELDS IN THE METHOD CALLS GENERATION AND SUBTYPING... AND IN GENERATION FOR CONSTRUCTORS....-}
{-IDENTIFIER TYPE MAP MIGHT ALSO NEED TO HAVE THIS ADDED.... NOT 100% SURE... -}

   let typelalala = HashMap.lookup (className, methodName) classMethodMap in
   let returnType = getReturnTypeBlarg typelalala in
   let counter = 1 in
   let identifierTypeMap = (HashMap.insert "this" ("this","obj_" ++ className) HashMap.empty) in
   let (identifierTypeMap', counter', argumentListString) = generateArgumentThing identifierTypeMap counter arguments in
   let header = "obj_" ++ returnType ++ " " ++ className ++ "_method_" ++ methodName ++ "(obj_" ++ className ++ " this " ++ (doComma arguments) ++ argumentListString ++ "){\n" in
       header ++  (generateStatements' hierarchy classMethodMap identifierTypeMap' identifierMap counter' body) ++ "return nothing;\n}"

{-I AM ASSUMING EVERY METHOD RETURNS!!!. (or rather, if it does not, return nothing, but return nothing at the end, anyway...)-}

  InferredMethod methodName arguments body -> error "methods without return type specified disabled for now"
  
{-
   let identifierMap = generateSubtypes hierarchy classMethodMap body HashMap.empty in
   let typelalala = HashMap.lookup (className, methodName) classMethodMap in
   let returnType = getReturnTypeBlarg typelalala in
   let header = "obj_" ++ returnType ++ " " ++ className ++ "_method_" ++ methodName ++ "(" ++ (generateArgumentThing arguments) ++ "){\n" in
  
    error (header ++  (generateStatements' hierarchy classMethodMap HashMap.empty identifierMap 1 body))
-}

  FFIMethod _ _ _ -> error "I should not be generating code for the builtins..."




{-

I am currently not adding all of the inherited methods.

I need to do that.


-}



getMethods :: HashMap.Map String (Maybe String, ClassDef) -> String -> [Method]
getMethods hierarchy className =
 case HashMap.lookup className hierarchy of
  Nothing -> error "getMethods error. No such class found."
  Just (_, ClassDef classSignature (ClassBody constructor methods)) -> undefined




{-returns pairs of methods, along with the name of the class that they derive from-}



{- this code is terrible. -}




{-We are assuming we can't have multiple methods with the same name.-}
getMethodName' :: Method -> String
getMethodName' method =
 case method of
  TypedMethod methodName _ _ _ -> methodName
  InferredMethod methodName _ _ -> methodName
  FFIMethod methodName _ _ -> methodName




replaceThing :: (Method, String) -> [(Method, String)] -> [(Method, String)]
replaceThing x [] = [x]
replaceThing (method1,className1) ((method2,className2):ys) =
 if (getMethodName' method1 == getMethodName' method2)
  then
   (method1, className1) : ys
  else
   (method2, className2) : (replaceThing (method1,className1) ys)


{-can use where here-}







{-I AM IGNORING CONSTRUCTORS CURRENTLY.-}


            {-start with-}      {-overwrite with-}
myConcat :: [(Method, String)] -> [(Method, String)] -> [(Method, String)]
myConcat [] x = x
myConcat x [] = x
myConcat x (y:ys) = (myConcat (replaceThing y x) ys)



{-should fold-}
myConcatAll :: [[(Method,String)]] -> [(Method,String)]
myConcatAll [] = error "wait, nothing in hierarchy? You should at least have one thing."
myConcatAll [x] = x
myConcatAll (x1:x2:xs) = myConcatAll ((myConcat x2 x1) : xs)


foobar :: String -> [Method] ->[(Method, String)]
foobar s m = map (\x -> (x,s)) m



getWhateverFuckMyLife :: HashMap.Map String (Maybe String, ClassDef) -> String -> [(Method, String)]
getWhateverFuckMyLife hierarchy className =
 case HashMap.lookup className hierarchy of
  Nothing -> error "I hate my life"
  Just (_, ClassDef classSignature (ClassBody constructor methods)) -> foobar className methods


getAllFuckery :: HashMap.Map String (Maybe String, ClassDef) -> [String] -> [[(Method, String)]]
getAllFuckery hierarchy classNames = map (getWhateverFuckMyLife hierarchy) classNames



getActualThing :: HashMap.Map String (Maybe String, ClassDef) -> String -> [(Method, String)]
getActualThing hierarchy className =
 let ancestry = getAncestry' className hierarchy in
 let theFuck = getAllFuckery hierarchy ancestry in
  myConcatAll theFuck


{-also has all the original methods.-}


{-YAYAYAYAY!!!!!!!-}
{-I do not have constructors yet, but when I do, I will only want to add them for the original class, not for the inherited classes (can't call super) same holds for fields later...-}
getInheritedMethods :: HashMap.Map String (Maybe String, ClassDef) -> HashMap.Map (String, String) MethodType -> String -> [(Method, String)]
getInheritedMethods hierarchy classMethodMap className = {- [] {-nothing for now...-}-}
 getActualThing hierarchy className


getClassDef :: HashMap.Map String (Maybe String, ClassDef) -> String -> ClassDef
getClassDef hierarchy className = 
 case HashMap.lookup className hierarchy of
  Nothing -> error $ ("error : class def not found: " ++ className)
  Just (_, classDef) -> classDef

getConstructor :: HashMap.Map String (Maybe String, ClassDef) -> String -> ([(String,String)], [Statement])
getConstructor hierarchy className =
 let (ClassDef (ClassSignature _ classArguments parent) (ClassBody constructor methods)) = getClassDef hierarchy className in
 (classArguments, constructor)
 



{-from stackoverflow, though pretty obvious.-}
mkUniq :: Ord a => [a] -> [a]
mkUniq = Set.toList . Set.fromList
{-actually I probably won't use this....-}



{-
{-I also need to know the type, so better to grab out of identifer map...-}
getConstructorDerivedFieldsSingleStatement :: Statement -> [String]
getConstructorDerivedFieldsSingleStatement statement =
 case statement of
  ParserAssign lExpr _ _ -> 
  _ -> []

getConstructorDerivedFields :: [Statement] -> [String]
getConstructorDerivedFields statements = mkUniq $ concat $ map getConstructorDerivedFieldsSingleStatement statements

-}





{- e.g. the following
/* The Obj Class (a singleton) */
struct  class_Obj_struct  the_class_Obj_struct = {
  new_Obj,     /* Constructor */
    Obj_method_STRING, 
      Obj_method_PRINT, 
        Obj_method_EQUALS
        };
-}



generateCClassStructMethod :: (Method, String) -> Bool -> String
generateCClassStructMethod (method, origin) addComma =
 let methodName = getMethodName' method in
 origin ++ "_method_" ++ methodName ++ (if addComma then "," else "") ++ "\n"


generateCClassStructMethods :: [(Method,String)] -> String
generateCClassStructMethods methods =
 case methods of
  [] -> ""
  [x] -> generateCClassStructMethod x False
  (x1:x2:xs) -> (generateCClassStructMethod x1 True) ++ (generateCClassStructMethods (x2:xs))


{-

class_Pt the_class_Pt = &the_class_Pt_struct; 

-}


generateCClassStruct :: (String , [(Method, String)]) -> String
generateCClassStruct (className,methods) =
 let header = "struct class_" ++ className ++ "_struct the_class_" ++ className ++ "_struct = {\n" in
 let constructor = "new_" ++ className ++ ",\n" in
 let methodStuff = generateCClassStructMethods methods in
 let footer = "};\n" in
 let cIsTerriblePartOneMillion = "class_" ++ className ++ " the_class_" ++ className ++ " = &the_class_" ++ className ++ "_struct;\n" in
 header ++ constructor ++ methodStuff ++ footer ++ cIsTerriblePartOneMillion
 



generateAllCClassStructs :: [(String, [(Method, String)])] -> String
generateAllCClassStructs x = concat $ map generateCClassStruct x

getClassName :: ClassDef -> String
getClassName (ClassDef (ClassSignature className _ _) _) = className

getAllClassNames :: [ClassDef] -> [String]
getAllClassNames classes = map getClassName classes 




{-


  obj_String new_thing = (obj_String) malloc(sizeof(struct obj_String_struct));
    new_thing->clazz = the_class_String;
      return new_thing; 










struct class_Int_struct;
typedef struct class_Int_struct* class_Int; 

typedef struct obj_Int_struct {
  class_Int  clazz;
    int value; 
    } * obj_Int;

struct class_Int_struct {
  /* Method table: Inherited or overridden */
    obj_Int (*constructor) ( void );
      obj_String (*STRING) (obj_Int);  /* Overridden */
        obj_Obj (*PRINT) (obj_Obj);      /* Inherited */
          obj_Boolean (*EQUALS) (obj_Int, obj_Obj); /* Overridden */
            obj_Boolean (*LESS) (obj_Int, obj_Int);   /* Introduced */
              obj_Int (*PLUS) (obj_Int, obj_Int);       /* Introduced */
              };

extern class_Int the_class_Int; 



-}





{-

getMethodSignatureBlah :: MethodType -> String
getMethodSignatureBlah (MethodType methodName argumentTypes returnType) = 





WORKING HERE




-}


{-

getClassThing :: Maybe a -> a
getClassThing Nothing = error "it's not there..."
getClassThing (Just x) = x
-}


{-don't forget () should be ( void). the constructor is the only function with this possibility, as all other functions take the called Obj as an argument-}

generateArgumentListFoo :: [String] -> String
generateArgumentListFoo arguments =
 case arguments of
 [] -> "void"
 [x] -> "obj_" ++ x
 (x1:x2:xs) -> "obj_" ++ x1 ++ "," ++ (generateArgumentListFoo (x2:xs))


generateMethodTypeSigThingSingle :: String -> MethodType -> String
generateMethodTypeSigThingSingle className (MethodType methodName arguments returnType) =
 "obj_" ++ returnType ++ " (*" ++ methodName ++ ") (" ++ (generateArgumentListFoo ((className):arguments)) ++ ");\n"

generateMethodTypeSigThing :: String -> [MethodType] -> String
generateMethodTypeSigThing className methodTypes = concat $ map (generateMethodTypeSigThingSingle className) methodTypes














generateFinalBlah :: HashMap.Map String (Maybe String, ClassDef) -> HashMap.Map (String, String) MethodType -> (String, ([(String, String)], [Statement])) -> String
generateFinalBlah = undefined




{-I might not be properly forward declaring everything. Some cases with multiple classes will probably crash.-}






marshalMethodToMethodType :: Method -> MethodType
marshalMethodToMethodType method =
 case method of
 TypedMethod methodName arguments returnType statements -> MethodType methodName (map snd arguments) returnType
 InferredMethod methodName arguments statements -> error "cannot marshal type of inferred method"
 FFIMethod methodName arguments returnType -> MethodType methodName (map snd arguments) returnType





generateFieldBlah :: (String, String) -> String
generateFieldBlah (fieldName, fieldType) =
 let actualFieldName = drop 9 fieldName in
 let actualFieldType = "obj_" ++ fieldType in
 actualFieldType ++ " " ++ actualFieldName ++ ";\n"


{-doing this for builtins as well currently.-}
generateConstructor :: HashMap.Map String (Maybe String, ClassDef) -> HashMap.Map (String, String) MethodType -> (String,([(String,String)], [Statement])) -> ([(String,String)],String)
generateConstructor hierarchy classMethodMap (className, (arguments, statements)) =
 
 {-let x = getMethodTypeList hierarchy className in-}
 let z = getInheritedMethods hierarchy classMethodMap className in
 let y = generateMethodTypeSigThing className (map marshalMethodToMethodType $ map fst z) in
 
 let identifierMap = generateSubtypes hierarchy classMethodMap statements (HashMap.insert "this" className HashMap.empty) in
 let (identifierTypeMap', counter', argumentListString) = generateArgumentThing HashMap.empty 1 arguments in
 
 let argumentTypeList = generateArgumentThingJustType arguments in 
 let h0 = "\n\n/// /// /// \n\nstruct class_" ++ className ++ "_struct  the_class_" ++ className ++ "_struct;\n" in
 let h1 = "struct class_" ++ className ++ "_struct;\n" in
 let h2 = "typedef struct class_" ++ className ++ "_struct* class_" ++ className ++ ";\n" in
 let h3 = "typedef struct obj_" ++ className ++ "_struct {\n" in
 let h4 = "class_" ++ className ++ " clazz;\n" in
{-
whatAreTheThis
-}
 let zap = whatAreTheThis $ HashMap.toList $ identifierMap in
 
 let h5 = concat $ map generateFieldBlah zap in {- all fields go here. Not methods and not this. TODOTODO TODO TODO TODO-}
 let h6 = "} * obj_" ++ className ++ ";\n" in

 let h = h1 ++ h2 ++ h3 ++ h4 ++ h5 ++ h6 ++ h0 in

 let k1 = "struct class_" ++ className ++ "_struct {\n" in
 let k2 = "obj_" ++ className ++ " (*constructor) ( " ++ argumentTypeList ++ ");\n" in
 let k3 = y in {-THIS IS WHERE I PUT ALL OF THE METHOD SIGNATURES TODO TODO TODO TODO TODO TODO-}
 let k4 = "};\n" in
 let k5 = "extern class_"++className++" the_class_"++className++";\n" in

 let k = k1 ++ k2 ++ k3 ++ k4 ++ k5 in

 let header = "obj_" ++ className ++ " new_" ++ className ++ "(" ++ argumentListString ++ ") {\n" in
 let secondHeader = "obj_" ++ className ++ " this = (obj_" ++ className ++ ") malloc(sizeof(struct obj_" ++className ++
                          "_struct));\nthis->clazz = the_class_" ++ className ++ ";\n" in
 let body = generateStatements' hierarchy classMethodMap identifierTypeMap' identifierMap counter' statements in
 let footer = "\nreturn this;\n}\n" in
 (whatAreTheThis $ HashMap.toList identifierMap, (h ++ k ++ header ++ secondHeader ++ body ++ footer))


myShowList :: Show a => [a] -> String
myShowList [] = ""
myShowList [a] = "\n\n" ++ (show a) ++ "\n\n"
myShowList (x:xs) = (myShowList [x]) ++ (myShowList xs)

{- do I need this? -}
getClassMethodBelongsTo :: HashMap.Map String (Maybe String, ClassDef) -> String
getClassMethodBelongsTo hierarchy = error $ show hierarchy                        


generateClass :: HashMap.Map String (Maybe String, ClassDef) -> HashMap.Map (String, String) MethodType -> (HashMap.Map String String , ClassDef) -> String
generateClass hierarchy classMethodMap (identifierMap,classDef) =
 let (ClassDef (ClassSignature className classArguments parent) (ClassBody constructorStatements methods)) = classDef in
  {-for now, don't do anything fancy. Just do the bodies of the methods...-}
  concat $ map (generateMethod identifierMap hierarchy classMethodMap className) methods








addThis :: String -> HashMap.Map String String -> HashMap.Map String String
addThis className identifierMap = HashMap.insert "this" className identifierMap



generateProgramC :: (Program, [ClassDef]) -> IO ()
generateProgramC (program,classDefs) =
 let (Program classes statements) = program in
 case allMethodsWorkForProgram' program of {-switched left and right from convention-}
  Left x ->
   let classMethodMap = generateClassMethodMap x in
   let hierarchy = buildHierarchyMap program in
   let classNames = (getAllClassNames classDefs) ++ ["Obj", "Nothing", "String", "Int", "Boolean"] in
   let userClassNames = (getAllClassNames classDefs) in
   let allInheritedMethods = map (getInheritedMethods hierarchy classMethodMap) classNames in
   let theFoo = zip userClassNames {-classNames-} allInheritedMethods in
   let allClassVTablesIsThatWhatThisIs = generateAllCClassStructs theFoo in
   let ha = zip classNames (map (getConstructor hierarchy) userClassNames) in
   let allConstructorDeclarations_ = map (generateConstructor hierarchy classMethodMap) ha in
   let allConstructorDeclarations = concat $ map snd allConstructorDeclarations_ in
   let allIdentifierThings = map fst allConstructorDeclarations_ in

   let allIdentifierMaps = map HashMap.fromList allIdentifierThings in
   let allIdentifierMaps' = zipWith addThis userClassNames allIdentifierMaps in
   let arg = zip allIdentifierMaps' classDefs in
   let classGeneration = concat $ map (generateClass hierarchy classMethodMap) arg in
   let identifierMap = generateSubtypes hierarchy classMethodMap statements HashMap.empty in
   let (Program classDefs statements) = program in
   let s = "\n////////////\n" in
   
  {- error allConstructorDeclarations-}
   {-error allClassVTablesIsThatWhatThisIs-}

   putStrLn $ ( allConstructorDeclarations
                ++ s ++ s ++ s ++ s ++ s ++ s ++ s ++
                classGeneration
                ++ s ++
                allClassVTablesIsThatWhatThisIs
                ++ "\nvoid quackmain() {\n" ++
                 (generateStatements' hierarchy classMethodMap HashMap.empty identifierMap 1 statements))
 
  Right x -> error "type error"




{-
identifier type map in generate subtypes
fix parser to allow this.method and not just this.field
add all of the LExpr dot cases to code gen.
undo that change to LExpr gen with the extra map.
test code gen, etc.

* Can prefix "this_dot_" in identifierMap (name -> type)

* Do not need anything extra in identifier type map, I think.
I think I likely do not need to add extra temporaries for the this. terms, as everything is already stored in the object.
-}
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
