{
module Main where    

import Tokens
import qualified Data.Map.Strict as HashMap
import Data.List
import System.IO

}


%name calc
%tokentype {Token}
%error {parseError}
%monad {P} {thenP} {returnP}
%lexer {lexer} {(Token EOFToken (_))}


%token
 class {Token Class (_)}
 while {Token While (_) }
 elif {Token Elif (_)}
 extends {Token Extends (_)}
 else {Token Else (_)}
 if {Token If (_)}
 identifier {Token (Identifier _) (_)}
 colon {Token Colon (_)}
 lparen  {Token Lparen (_)}
 rparen {Token Rparen (_)}
 lbracket {Token Lbracket (_)}
 rbracket {Token Rbracket (_)}
 comma {Token Comma (_)}
 semicolon {Token Semicolon (_)}
 dot {Token Dot (_)}
 equals {Token Equals (_)}
 def {Token Def (_)}
 return {Token Return (_)}
 sum {Token Sum (_)}
 difference {Token Difference (_)}
 product {Token Product (_)}
 quotient {Token Quotient (_)}
 number {Token (Number $$) (_)}
 string {Token (TargetString $$) (_)}
 lex_error {Token (Error $$) (_)} {- WAIT A MINUTE... I DON'T WANT THIS!!! -}
 eq {Token Equality (_)}
 leq {Token LEQ (_)}
 lt {Token Lt (_)}
 geq {Token GEQ (_)}
 gt {Token Gt (_)}
 and {Token And (_)}
 or {Token Or (_)}
 not {Token Not (_)}
 eof {Token EOFToken (_)} {- NO NO NO I do not want this either!!!!! -}

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
ClassSignature : class identifier lparen FormalArgs rparen {ClassSignature (stringFromIdentifierToken $2) $4 (Just "Object") {-Michal said that I might want to use an option type here instead of default object, if the type itself is Object. Perhaps though that should wait until a future point. -}}
               | class identifier lparen FormalArgs rparen extends identifier {ClassSignature (stringFromIdentifierToken $2) $4 (Just (stringFromIdentifierToken $7))}
ClassBody : lbracket Statements Methods rbracket {ClassBody $2 $3}
Statement : if RExpr lbracket Statements rbracket Elifs {ParserIfWithoutElse $2 $4 $6 (lineNumberFromToken $1)}
          | if RExpr lbracket Statements rbracket Elifs else lbracket Statements rbracket {ParserIfWithElse $2 $4 $6 $9 (lineNumberFromToken $1)}
          | while RExpr lbracket Statements rbracket {ParserWhile $2 $4 (lineNumberFromToken $1)}
          | return RExpr semicolon {ParserReturn $2 (lineNumberFromToken $1)}
          | return semicolon {ParserReturnUnit (lineNumberFromToken $1)}
          | LExpr equals RExpr semicolon {ParserAssign $1 $3 (lineNumberFromToken $2)}
          | LExpr colon identifier equals RExpr semicolon {ParserAssign $1 $5 (lineNumberFromToken $2)}
          | RExpr semicolon {ParserBareExpression $1 (lineNumberFromToken $2)}

Elifs : {[]}
      | Elif Elifs {$1 : $2}
Elif : elif RExpr lbracket Statements rbracket { ($2,$4)}

RExpr : number {RExprIntLiteral $1 (-1000) {-(lineNumberFromToken undefined)-}}
      | string {RExprStringLiteral $1 (-1000) {-(lineNumberFromToken undefined)-}}
      | LExpr {RExprFromLExpr $1 undefined}
      | RExpr sum RExpr {RExprMethodInvocation $1 "PLUS" [$3] (lineNumberFromToken $2)}
      | RExpr difference RExpr {RExprMethodInvocation $1 "MINUS" [$3] (lineNumberFromToken $2)}
      | RExpr product RExpr {RExprMethodInvocation $1 "PRODUCT" [$3] (lineNumberFromToken $2)}
      | RExpr quotient RExpr {RExprMethodInvocation $1 "QUOTIENT" [$3] (lineNumberFromToken $2)}
      | lparen RExpr rparen {$2}
      | RExpr eq RExpr {RExprMethodInvocation $1 "EQUALS" [$3] (lineNumberFromToken $2)}
      | RExpr leq RExpr {RExprMethodInvocation $1 "ATMOST" [$3] (lineNumberFromToken $2)}
      | RExpr lt RExpr {RExprMethodInvocation $1 "LESS" [$3] (lineNumberFromToken $2)}
      | RExpr geq RExpr {RExprMethodInvocation $1 "ATLEAST" [$3] (lineNumberFromToken $2)}
      | RExpr gt RExpr {RExprMethodInvocation $1 "MORE" [$3] (lineNumberFromToken $2)}
      | RExpr and RExpr {RExprAnd $1 $3 (lineNumberFromToken $2)}
      | RExpr or RExpr {RExprOr $1 $3 (lineNumberFromToken $2)}
      | not RExpr {RExprNot $2 (lineNumberFromToken $1)}
      | RExpr dot identifier lparen ActualArgs rparen {RExprMethodInvocation $1 (stringFromIdentifierToken $3) $5 (lineNumberFromToken $4)}
      | identifier lparen ActualArgs rparen {RExprConstructorInvocation (stringFromIdentifierToken $1) $3 (lineNumberFromToken $1)}
ActualArgs : {[]}
           | RExpr FinishActualArgs {$1 : $2}
FinishActualArgs : {[]} 
                 | comma RExpr FinishActualArgs {$2 : $3}
LExpr : identifier {LExprId (stringFromIdentifierToken $1) (lineNumberFromToken $1)}
      | RExpr dot identifier {LExprDotted $1 (stringFromIdentifierToken $3) (lineNumberFromToken undefined)}
FormalArgs : {[]}
           | identifier colon identifier FinishFormalArgs {((stringFromIdentifierToken $1),(stringFromIdentifierToken $3)):$4}
FinishFormalArgs : {[]}
                 | comma identifier colon identifier FinishFormalArgs {((stringFromIdentifierToken $2),(stringFromIdentifierToken $4)):$5}
Methods : {[]}
        | Method Methods {$1:$2}
Method : def identifier lparen FormalArgs rparen lbracket Statements rbracket {InferredMethod (stringFromIdentifierToken $2) $4 $7}
       | def identifier lparen FormalArgs rparen colon identifier lbracket Statements rbracket {TypedMethod (stringFromIdentifierToken $2) $4 (stringFromIdentifierToken $7) $9}



{


stringFromIdentifierToken :: Token -> String
stringFromIdentifierToken (Token (Identifier s) _) = s


lineNumberFromToken :: Token -> Int
lineNumberFromToken (Token _ n) = n                





{-Program : Classes Statements {Program $1 $2}-}





{-

data ParseResult a = Ok a | Failed String
type P a = String -> ParseResult a

thenP :: P a -> (a -> P b) -> P b
m `thenP` k = \s -> case m s of Ok a -> k a s
                                Failed e -> Failed e

returnP :: a -> P a
returnP a = \s -> Ok a

failP :: String -> P a
failP err = \s -> Failed err

catchP :: P a -> (String -> P a) -> P a
catchP m k = \s -> case m s of Ok a -> Ok a
                               Failed e -> k e s


-}






type P a = Alex a



thenP = (>>=)

returnP = return
{-
failP = fail
-}
catchP m c = fail "catch not implemented"











{-
fooBar :: ((Token,Int) -> P a) -> P a
fooBar  = (alexMonadScan >>=)
-}



lexer :: (Token -> P a) -> P a
lexer = (alexMonadScan >>=)


{-lexer cont = undefined `thenP` \token -> cont token
-}

{-

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

-}













{-I'm currently throwing away typing information in my AST.-}


{-parseError :: [Token] -> a-}
{-parseError _ = error "Parse error"-}



{-
parseError tokens = failP "Parse error"
-}


parseError tokens = do
 i <- getLineNumber
 alexError $ show i



{-(alexError $ "Parse error: " ++ show tokens)-}

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
data RExpr = RExprStringLiteral String Int
           | RExprIntLiteral String Int
           | RExprFromLExpr LExpr Int
           | RExprAnd RExpr RExpr Int
           | RExprOr RExpr RExpr Int
           | RExprNot RExpr Int
           | RExprMethodInvocation RExpr String [RExpr] Int
           | RExprConstructorInvocation String [RExpr] Int
           deriving Show
{-
getTokens :: String -> [Token] {-For now, no error handling-}
getTokens s = undefined {- case runAlex s gather of
                   Left _ -> []
                   Right x -> x {-(map fst x)-}
-}
-}



getTokens :: String -> [Token] {-For now, no error handling-}
getTokens s = case runAlex s gather of Left _ -> []
                                       Right x -> x {-(map fst x)-}

programPrint :: Program -> IO ()
programPrint p = print p

getProgram :: IO (P Program)
getProgram = undefined


 {-do
             s <- getContents
             pure (calc $ getTokens s)
-}








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




{-For now, I'm only going to add in Object and its methods to the built in stuff. Eventually I may need to add more-}




{-RIGHT NOW, NONE OF THE BUILTINS OVERRIDE ANYTHING FROM OBJECT, INCLUDING PRINTING OUT. THEY WILL ONCE I KNOW WHAT THAT MEANS-}
generateObject :: ClassDef
generateObject = ClassDef (ClassSignature "Object" [] Nothing) (ClassBody [] [FFIMethod "PRINT" [] "Nothing", FFIMethod "toStr" [] "String", FFIMethod "EQUALS" [("argumentName", "Object")] "Boolean"])



{-I AM NOT ENFORCING THAT THE USER CANNOT CREATE A NOTHING CURRENTLY-}

generateNothing :: ClassDef
generateNothing = ClassDef (ClassSignature "Nothing" [] (Just "Object")) (ClassBody [] []) 


generateString :: ClassDef
generateString = ClassDef (ClassSignature "String" [] (Just "Object")) (ClassBody [] [])


generateInt :: ClassDef
generateInt = ClassDef (ClassSignature "Int" [] (Just "Object")) (ClassBody []
 [FFIMethod "PLUS" [("argumentName", "Int")] "Int",
  FFIMethod "MINUS" [("argumentName", "Int")] "Int",
  FFIMethod "PRODUCT" [("argumentName", "Int")] "Int",
  FFIMethod "QUOTIENT" [("argumentName", "Int")] "Int",
  FFIMethod "ATMOST" [("argumentName", "Int")] "Int",
  FFIMethod "LESS" [("argumentName", "Int")] "Int",
  FFIMethod "ATLEAST" [("argumentName", "Int")] "Int",
  FFIMethod "MORE" [("argumentName", "Int")] "Int"
  
  ])


generateBoolean :: ClassDef
generateBoolean = ClassDef (ClassSignature "Nothing" [] (Just "Object")) (ClassBody [] [])




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


{-ARG!!! I HAVE TO ADD BUILTINS FOR NOTHING, ETC!!!-}

{-I am using "Object", not "Obj" (which is in the manual) The manual is inconsistent about whether Int or Integer is what is defined.-}





{-HAVE TO BUILD ALL OF THE FFI CALLS HERE INTO A CLASS DEF THAT I MAKE.... -}


getHierarchy :: Program -> [(String,(Maybe String, ClassDef))]
getHierarchy (Program classDefs _) = (map getSelfParentDef classDefs) ++
   [("Nothing", (Just "Object", generateNothing )),
     ("Int",(Just "Object", generateInt)),
       ("String", (Just "Object", generateString )),
         ("Boolean", (Just "Object", generateBoolean )),
           ("Object", (Nothing, generateObject))
             ]
              


{-
 [("Nothing", (Just "Object", ClassDef (ClassSignature "Nothing" [] (Just "Object")) (ClassBody [] [] ))),
 ("Int",(Just "Object", ClassDef (ClassSignature "Int" [] (Just "Object")) (ClassBody [] []))),
 ("String", (Just "Object", ClassDef (ClassSignature "String" [] (Just "Object")) (ClassBody [] []))),
 ("Boolean", (Just "Object", ClassDef (ClassSignature "String" [] (Just "Object")) (ClassBody [] []))),
 ("Object", (Nothing, ClassDef (ClassSignature "Object" [] Nothing) (ClassBody [] [] )))
 ]
-}

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
 _ <- print $ getSubtypeHierarchy $ HashMap.toList $ buildHierarchyMap (addBuiltIns x)
 _ <- fooPrint $ toPrintCheckForCycles $ checkForCycles $ getSubtypeHierarchy $ HashMap.toList $ buildHierarchyMap (addBuiltIns x)
 _ <- fooPrint $ toPrintErroneousConstructorCalls $ subset ( okProgram x)  (map fst $ getSubtypeHierarchy $ HashMap.toList $ buildHierarchyMap (addBuiltIns x) )
 _ <- allMethodsWorkForProgram x
 _ <- printOutInitFails $ checkInitializationBeforeUse $ getStatements x
 {-_ <- programPrint (addBuiltIns x)-}
 generateProgramC (addBuiltIns x) {-doing this even if typechecking fails.-}
 {-pure ()-}



main = do
 x <- getContents
 case runAlex x calc of Right x -> dealWith x
                        Left x -> error x
 
 {- do
 s <- getContents
 {-print $ getTokens s-}
 
 case runAlex s calc of Right x -> print x
                        Left y -> print y

-}





{-do
       x <- getProgram
       dealWith (x "")
{-added "" to make typecheck-}
-}
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
                                                                 Just (Nothing, classDef) -> [] {-NEED TO CHANGE BECAUSE OBJECT DOES HAVE STUFF-}
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


{-This is not a statement in a constructor or method... well maybe it could be used for that eventually...-}
typecheckStatements :: HashMap.Map String [MethodType] -> HashMap.Map String (Maybe String, ClassDef) -> HashMap.Map String String -> [Statement] -> [String]
typecheckStatements classMethodTypeMap classHierarchy derivedTypes statements = undefined





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
getTypeLExpr hierarchy classMethodMap currentIdentifierMap (LExprDotted rExpr s lineNumber) = Nothing




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
   RExprConstructorInvocation constructorName arguments lineNumber -> undefined

checkTypesOkayLExpr :: HashMap.Map String (Maybe String, ClassDef) -> HashMap.Map (String, String) MethodType -> HashMap.Map String String -> LExpr -> [(String, Int)]
checkTypesOkayLExpr hierarchy classMethodMap identifierMap lExpr =
 case lExpr of
  LExprId s lineNumber -> []
  LExprDotted rExpr s lineNumber -> (checkTypesOkayRExpr hierarchy classMethodMap identifierMap rExpr) ++ [("Cannot access fields of external object", lineNumber)]





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
  (RExprFromLExpr lExpr lineNumber) -> undefined
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
    Just s -> (HashMap.insert identifier s undefined, True)
    Nothing -> (currentIdentifierMap,False)
   Just currentType' -> case getTypeRExpr hierarchy classMethodMap currentIdentifierMap rExpr of
    Just s -> let unifiedTypes = getCommonAncestorFromMap hierarchy s currentType' in (HashMap.insert identifier unifiedTypes currentIdentifierMap, if unifiedTypes == s then False else True)
    Nothing -> (currentIdentifierMap,False)
updateSubtypesSingleStatement hierarchy classMethodMap (ParserAssign (LExprDotted rExpr string lineNumber2) rExpr2 lineNumber3) currentIdentifierMap = (currentIdentifierMap, False)
updateSubtypesSingleStatement hierarchy classMethodMap (ParserBareExpression rexpr lineNumber) currentIdentifierMap = (currentIdentifierMap, False)

generateSubtypes' :: HashMap.Map String (Maybe String, ClassDef) -> HashMap.Map (String, String) MethodType -> [Statement] -> HashMap.Map String String -> (HashMap.Map String String, Bool)
generateSubtypes' hierarchy classMethodMap [] currentIdentifierMap = (currentIdentifierMap,False)
generateSubtypes' hierarchy classMethodMap (x:xs) currentIdentifierMap =
 let (newMap, wasUpdated) = updateSubtypesSingleStatement hierarchy classMethodMap x currentIdentifierMap in
 let (newMap', wasUpdated') = generateSubtypes' hierarchy classMethodMap xs newMap in (newMap', wasUpdated && wasUpdated')

generateSubtypes :: HashMap.Map String (Maybe String, ClassDef) -> HashMap.Map (String,String) MethodType -> [Statement] -> HashMap.Map String String -> HashMap.Map String String
generateSubtypes hierarchy classMethodMap statements currentIdentifierMap =
 let (newMap,wasUpdated) = generateSubtypes' hierarchy classMethodMap statements currentIdentifierMap in
  case wasUpdated of
   True -> generateSubtypes hierarchy classMethodMap statements newMap
   False -> newMap


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
getNextIdentifier x = show $ x + 1                  

{-

 checkTypesOkaySingleStatement :: HashMap.Map String (Maybe String, ClassDef) -> HashMap.Map (String, String) MethodType -> HashMap.Map String String -> Statement -> [(String,Int)]
  checkTypesOkaySingleStatement hierarchy classMethodMap identifierMap statement =

-}

{-


switched to using separate argument for this. identifierTypeMap . Oh identifier type map has name and type, as opposed to just type. UGH

Wait, I should have the C type as well.... let's just say that's what it has.


 hierarchy, classMethodMap, identifierMap. Here identifierMap maps to (name,type), where name is the name of the term in the generated C file
-}








generateLExpr :: HashMap.Map String (Maybe String, ClassDef) -> HashMap.Map (String, String) MethodType -> HashMap.Map String (String, String) -> HashMap.Map String String -> Integer -> LExpr -> (HashMap.Map String (String, String), HashMap.Map String String, Integer, String)
generateLExpr hierarchy classMethodMap identifierTypeMap identifierMap argCounter lExpr =
 case lExpr of
  LExprId quackVarName _ ->
   case HashMap.lookup quackVarName identifierTypeMap of
    Just (a,b) -> (identifierTypeMap, identifierMap, argCounter, a)
    Nothing ->
     case HashMap.lookup quackVarName identifierMap of
      Nothing -> error "static type not found"
      Just t -> (HashMap.insert quackVarName (getNextIdentifier $ argCounter + 1,"obj_"++t) identifierTypeMap,identifierMap, argCounter + 1, getNextIdentifier $ argCounter + 1)
  LExprDotted _ _ _ -> undefined

generateStatement :: HashMap.Map String (Maybe String, ClassDef) -> HashMap.Map (String, String) MethodType -> HashMap.Map String (String, String) -> HashMap.Map String String -> Integer -> Statement -> (HashMap.Map String (String,String), HashMap.Map String String, Integer, String)
generateStatement hierarchy classMethodMap identifierTypeMap identifierMap argCounter statement =
 case statement of {- not sure this should be here for bare expression... but at least I can test some stuff? -}
  ParserBareExpression rExpr lineNumber ->
   case rExpr of
    RExprIntLiteral value lineNumber -> (HashMap.empty {-WRONG-} , HashMap.empty {-WRONG-},argCounter + 1,"obj_Int varName" ++ (getNextIdentifier argCounter) ++ ";\n" ++ "varName" ++ (getNextIdentifier argCounter) ++ " = (obj_Int) int_literal(" ++ (value) ++ ");")
    _ -> undefined
  
  ParserAssign lExpr rExpr lineNumber -> undefined
  _ -> undefined




generateStatements :: HashMap.Map String (Maybe String, ClassDef) -> HashMap.Map (String, String) MethodType -> HashMap.Map String (String, String) -> HashMap.Map String String -> Integer -> [Statement] -> (HashMap.Map String (String, String), HashMap.Map String String, Integer, String)
generateStatements hierarchy classMethodMap identifierTypeMap identifierMap argCounter statements =
 case statements of
  [] -> undefined
  (x:xs) -> generateStatement hierarchy classMethodMap identifierTypeMap identifierMap argCounter x



ggg :: (a,b,c) -> c
ggg (a,b,c) = c



generateStatements' :: HashMap.Map String (Maybe String, ClassDef) -> HashMap.Map (String, String) MethodType -> HashMap.Map String (String, String) -> HashMap.Map String String -> Integer -> [Statement] -> String
generateStatements' hierarchy classMethodMap identifierTypeMap identifierMap argCounter statements = let (w,x,y,z) = generateStatements hierarchy classMethodMap identifierTypeMap identifierMap argCounter statements in z

generateProgramC :: Program -> IO ()
generateProgramC program = {-putStrLn $ generateStatements' HashMap.empty HashMap.empty HashMap.empty HashMap.empty 1 []-}
 case allMethodsWorkForProgram' program of {-switched left and right from convention-}
 Left x ->
  let classMethodMap = generateClassMethodMap x in
  let hierarchy = buildHierarchyMap program in
  let identifierMap = generateSubtypes hierarchy classMethodMap [] HashMap.empty in
  let (Program classDefs statements) = program in
   putStrLn $ {-(show hierarchy) ++ (show classMethodMap) ++ (show identifierMap) ++ (show statements)-} generateStatements' hierarchy classMethodMap HashMap.empty identifierMap 1 statements
 Right x -> error "type error"

{-





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












RExprStringLiteral String Int
           | RExprIntLiteral String Int
                      | RExprFromLExpr LExpr Int
                                 | RExprAnd RExpr RExpr Int
                                            | RExprOr RExpr RExpr Int
                                                       | RExprNot RExpr Int
                                                                  | RExprMethodInvocation RExpr String [RExpr] Int
                                                                             | RExprConstructorInvocation String [RExpr] Int







ParserIfWithElse RExpr [Statement] [(RExpr, [Statement])] [Statement] Int
               | ParserIfWithoutElse RExpr [Statement] [(RExpr, [Statement])] Int
                              | ParserWhile RExpr [Statement] Int
                                             | ParserReturn RExpr Int
                                                            | ParserReturnUnit Int
                                                                           | ParserAssign LExpr {- type : String-} RExpr Int
                                                                                          | ParserBareExpression RExpr Int


-}














}








