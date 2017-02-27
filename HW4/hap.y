{
module Main where    

import Tokens
import qualified Data.Map.Strict as HashMap
}


%name calc
%tokentype {Token}
%error {parseError}
%monad {E} {thenE} {returnE}


%token
 class {Class}
 while {While}
 elif {Elif}
 extends {Extends}
 else {Else}
 if {If}
 identifier {Identifier $$}
 colon {Colon}
 lparen  {Lparen}
 rparen {Rparen}
 lbracket {Lbracket}
 rbracket {Rbracket}
 comma {Comma}
 semicolon {Semicolon}
 dot {Dot}
 equals {Equals}
 def {Def}
 return {Return}
 sum {Sum}
 difference {Difference}
 product {Product}
 quotient {Quotient}
 number {Number $$}
 string {TargetString $$}
 lex_error {Error $$} {- WAIT A MINUTE... I DON'T WANT THIS!!! -}
 eq {Equality}
 leq {LEQ}
 lt {Lt}
 geq {GEQ}
 gt {Gt}
 and {And}
 or {Or}
 not {Not}
 eof {EOFToken} {- NO NO NO I do not want this either!!!!! -}

%nonassoc gt lt eq leq geq

%left equals


%left sum difference
%left product quotient


%right not
%left or
%left and


%left dot



%%

Program : Classes Statements {Program $1 $2}
Classes : {[]}
        | Class Classes {$1 : $2}
Statements : {[]}
           | Statement Statements {$1 : $2}
Class : ClassSignature ClassBody {ClassDef $1 $2}
ClassSignature : class identifier lparen FormalArgs rparen {ClassSignature $2 $4 (Just "Object") {-Michal said that I might want to use an option type here instead of default object, if the type itself is Object. Perhaps though that should wait until a future point. -}}
               | class identifier lparen FormalArgs rparen extends identifier {ClassSignature $2 $4 (Just $7)}
ClassBody : lbracket Statements Methods rbracket {ClassBody $2 $3}
Statement : if RExpr lbracket Statements rbracket Elifs {ParserIfWithoutElse $2 $4 $6}
          | if RExpr lbracket Statements rbracket Elifs else lbracket Statements rbracket {ParserIfWithElse $2 $4 $6 $9}
          | while RExpr lbracket Statements rbracket {ParserWhile $2 $4}
          | return RExpr semicolon {ParserReturn $2}
          | return semicolon {ParserReturnUnit }
          | LExpr equals RExpr semicolon {ParserAssign $1 $3}
          | LExpr colon identifier equals RExpr semicolon {ParserAssign $1 $5}
          | RExpr semicolon {ParserBareExpression $1}

Elifs : {[]}
      | Elif Elifs {$1 : $2}
Elif : elif RExpr lbracket Statements rbracket { ($2,$4)}

RExpr : number {RExprIntLiteral $1}
      | string {RExprStringLiteral $1}
      | LExpr {RExprFromLExpr $1}
      | RExpr sum RExpr {RExprMethodInvocation $1 "PLUS" [$3]}
      | RExpr difference RExpr {RExprMethodInvocation $1 "MINUS" [$3]}
      | RExpr product RExpr {RExprMethodInvocation $1 "PRODUCT" [$3]}
      | RExpr quotient RExpr {RExprMethodInvocation $1 "QUOTIENT" [$3]}
      | lparen RExpr rparen {$2}
      | RExpr eq RExpr {RExprEquality $1 $3}
      | RExpr leq RExpr {RExprLeq $1 $3}
      | RExpr lt RExpr {RExprLt $1 $3}
      | RExpr geq RExpr {RExprGeq $1 $3}
      | RExpr gt RExpr {RExprGt $1 $3}
      | RExpr and RExpr {RExprAnd $1 $3}
      | RExpr or RExpr {RExprOr $1 $3}
      | not RExpr {RExprNot $2}
      | RExpr dot identifier lparen ActualArgs rparen {RExprMethodInvocation $1 $3 $5}
      | identifier lparen ActualArgs rparen {RExprConstructorInvocation $1 $3}
ActualArgs : {[]}
           | RExpr FinishActualArgs {$1 : $2}
FinishActualArgs : {[]} 
                 | comma RExpr FinishActualArgs {$2 : $3}
LExpr : identifier {LExprId $1}
      | RExpr dot identifier {LExprDotted $1 $3}
FormalArgs : {[]}
           | identifier colon identifier FinishFormalArgs {($1,$3):$4}
FinishFormalArgs : {[]}
                 | comma identifier colon identifier FinishFormalArgs {($2,$4):$5}
Methods : {[]}
        | Method Methods {$1:$2}
Method : def identifier lparen FormalArgs rparen lbracket Statements rbracket {InferredMethod $2 $4 $7}
       | def identifier lparen FormalArgs rparen colon identifier lbracket Statements rbracket {TypedMethod $2 $4 $7 $9}


{






data E a = Ok a | Failed String
                deriving Show
thenE :: E a -> (a -> E b) -> E b
m `thenE` k = case m of Ok a -> k a
	                Failed e -> Failed e

returnE :: a -> E a
returnE a = Ok a

failE :: String -> E a
failE err = Failed err

catchE :: E a -> (String -> E a) -> E a
catchE m k = case m of Ok a -> Ok a
	               Failed e -> k e















{-I'm currently throwing away typing information in my AST.-}


{-parseError :: [Token] -> a-}
{-parseError _ = error "Parse error"-}




parseError tokens = failE "Parse error"


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

getProgram :: IO ( E Program)
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


{-ARG!!! I HAVE TO ADD BUILTINS FOR NOTHING, ETC!!!-}

{-I am using "Object", not "Obj" (which is in the manual) The manual is inconsistent about whether Int or Integer is what is defined.-}





{-HAVE TO BUILD ALL OF THE FFI CALLS HERE INTO A CLASS DEF THAT I MAKE.... -}


getHierarchy :: Program -> [(String,(Maybe String, ClassDef))]
getHierarchy (Program classDefs _) = (map getSelfParentDef classDefs) ++ 
 [("Nothing", (Just "Object", ClassDef (ClassSignature "Nothing" [] (Just "Object")) (ClassBody [] [] ))),
 ("Int",(Just "Object", ClassDef (ClassSignature "Int" [] (Just "Object")) (ClassBody [] []))),
 ("String", (Just "Object", ClassDef (ClassSignature "String" [] (Just "Object")) (ClassBody [] []))),
 ("Boolean", (Just "Object", ClassDef (ClassSignature "String" [] (Just "Object")) (ClassBody [] []))),
 ("Object", (Nothing, ClassDef (ClassSignature "Object" [] Nothing) (ClassBody [] [] )))
 ]


buildHierarchyMap :: Program -> HashMap.Map String (Maybe String, ClassDef)
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

dealWith :: E Program -> IO ()
dealWith (Ok x) = do
 _ <- print $ getSubtypeHierarchy $ HashMap.toList $ buildHierarchyMap (addBuiltIns x)
 _ <- fooPrint $ toPrintCheckForCycles $ checkForCycles $ getSubtypeHierarchy $ HashMap.toList $ buildHierarchyMap (addBuiltIns x)
 _ <- fooPrint $ toPrintErroneousConstructorCalls $ subset ( okProgram x)  (map fst $ getSubtypeHierarchy $ HashMap.toList $ buildHierarchyMap (addBuiltIns x) )
 _ <- print $ allMethodsWorkForProgram x
 programPrint (addBuiltIns x)
 {-pure ()-}

dealWith (Failed s) = print s

main = do
       x <- getProgram
       dealWith x
       


isSubtype :: String -> String -> HashMap.Map String (Maybe String, ClassDef) -> Bool
isSubtype subtype supertype map =
 if supertype == "Object" || subtype == supertype
  then True
  else
   if subtype == "Object"
    then False
    else case HashMap.lookup subtype map of Nothing -> undefined {-ERROR CASE-}
                                            Just (Just a,_) -> isSubtype a supertype map
                                            Just _ -> undefined

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
checkClassSingleMethodCompatibleWithParent :: HashMap.Map String (Maybe String, ClassDef) -> MethodType {-child method -} -> MethodType {- parent method -} -> Maybe String {-Nothing means works. Just s means s is the error message-}
checkClassSingleMethodCompatibleWithParent myMap (MethodType methodName argumentType returnType) (MethodType parentMethodName parentArgumentType parentReturnType) =
 if not ((length parentArgumentType) == (length argumentType)) then Just $ "Method " ++ methodName ++ " has different number of arguments to method in parent" else 
 if isSubtype returnType parentReturnType myMap then (let b = zipWith (isSupertype' myMap) argumentType parentArgumentType in if allTrue b then Nothing
 else Just $ "Method " ++ methodName ++ " argument types violate contravariance when compared to parent method")
 else Just $ "Method " ++ methodName ++ " return type of " ++ returnType ++ " violates covariance when compared to return type of parent method return type of " ++ parentReturnType

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

{-
data MethodType = MethodType String [String] String {-name, argument types, return type-}
-}


generateMethodMap :: [MethodType] -> HashMap.Map String MethodType
generateMethodMap [] = HashMap.empty
generateMethodMap ((MethodType name argTypes returnType):xs) = HashMap.insert name (MethodType name argTypes returnType) (generateMethodMap xs)

getMethodName :: MethodType -> String
getMethodName (MethodType name _ _ ) = name


checkClassMethodsCompatibleWithOneAncestor :: HashMap.Map String (Maybe String, ClassDef) -> [MethodType] -> [MethodType] -> [String]
checkClassMethodsCompatibleWithOneAncestor myMap childMethods parentMethods =
 let parentMethodMap = generateMethodMap parentMethods in
 let f = (\x -> case HashMap.lookup (getMethodName x) parentMethodMap of Nothing -> Nothing
                                                                         Just parentMethod -> checkClassSingleMethodCompatibleWithParent myMap x parentMethod) in
 collectMaybe $ map f childMethods


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




{-THIS FUNCTION HAS AN INCOMPLETE PATTERN MATCH-}
getMethodTypeList :: HashMap.Map String (Maybe String, ClassDef) -> String -> [MethodType]
getMethodTypeList myMap name = case HashMap.lookup name myMap of Just (Just _, classDef) -> let (_, methods) = generateRawMethodTypesSingleClass classDef in methods
                                                                 Just (Nothing, classDef) -> [] {-NEED TO CHANGE BECAUSE OBJECT DOES HAVE STUFF-}
                                                                 Nothing -> error ("Error when considering" ++ name)




{- I THINK I DO NOT HAVE AN FFI OR DEFAULT METHOD FOR EQUALITY CURRENTLY-}

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
allMethodsWorkForProgram :: Program -> Either [(String, [MethodType])] [String]
allMethodsWorkForProgram program =
 let myMap = buildHierarchyMap program in
 let k = HashMap.keys myMap in
 let ancestries = map (getAncestry'' myMap) k in
 let methodLists = map (convertS myMap) ancestries in
 let y = map generateCompleteMethodTypesAndName methodLists in
 let x = methodsWorkForAllAncestorsAllClasses myMap k in
 case x of [] -> Left y
           _ -> Right x                  


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


{-

Data structures that I need:


map from string to list of strings, types, to keep track of what methods are available to each class.

Once I have that, I can check the code for each class.


Because of subtyping, I will need to make sure that subclass methods have compatible subtypes. (NOT JUST THE SAME SUBTYPE).


-}


{-Given the methods and their type signatures, and the class hierarchy, generate the full signature of each class. If there is a type error, return the error -}
{-generateFullSignature :: ClassDef ->  -> HashMap.Map String (Maybe String, ClassDef) -> 
-}

{-Given full signatures for each class, and a call to a method, -}
{-checkCompatibleSubtype :: HashMap 
-}





{-


Because we are making all fields public, there should be a datatype which is the actual type (included inherited stuff) of each class.

This would include fields and their types, and methods.


Note that children cannot override the type of fields declared in superclasses. (because it would have to both be a subtype and a supertype)


-}





{-

I am going to assume that there is no shadowing of anything anywhere.


-}



 {-

Potential use of a uninitialized variable on any program execution path
Potential type error.  The type of the test in an 'if', 'elif', or 'while' must be a subtype of Boolean.  Most other type errors will typically show up either as an actual argument type that is not a subtype of the corresponding actual argument, an actual argument list that is too long or short, or a method not found in a class.  The last is particularly likely when the type of the receiver object is not correct, e.g., when the static type of variable x is "above" the class that has the
desired method. 

Potential call of undefined method

Illegal redefinition of a name that is in scope (e.g., creating a variable x where a variable x is already in scope)

Method returns wrong type  (includes ending without returning)

Incompatible overridden method  (should have same number of arguments, each formal argument a supertype of overridden method, return type a subtype of returned type of overridden method)

-}









}





