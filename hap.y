{
module Main where    

import Tokens

}


%name calc
%tokentype {Token}
%error {parseError}



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
ClassSignature : class identifier lparen FormalArgs rparen {ClassSignature $2 $4 "Object"}
               | class identifier lparen FormalArgs rparen extends identifier {ClassSignature $2 $4 $7}
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
      | RExpr sum RExpr {RExprPlus $1 $3}
      | RExpr difference RExpr {RExprMinus $1 $3}
      | RExpr product RExpr {RExprTimes $1 $3}
      | RExpr quotient RExpr {RExprDivide $1 $3}
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

{-I'm currently throwing away typing information in my AST.-}


parseError :: [Token] -> a
parseError _ = error "Parse error"

data Program = Program [ClassDef] [Statement]
             deriving Show
data Method = TypedMethod String [(String,String)] String [Statement]
            | InferredMethod String [(String,String)] [Statement]
            deriving Show
{- Formal arguments have to supply a type? -}


{-
data FormalArgs = FormalArgs [(String, String)]
                deriving Show
-}

data ClassBody = ClassBody [Statement] [Method]
               deriving Show 
data ClassSignature = ClassSignature String [(String,String)] String
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

main = do
       x <- getProgram
       programPrint x
       
}






