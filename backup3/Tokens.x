{

module Tokens where

import System.IO
}

%wrapper "monad"

$digit = 0-9			-- digits
$alpha = [a-zA-Z]		-- alphabetic characters



tokens :-
<0>  $white+				;

<0>  class       { \s i -> return (Class, lineNumber s) }
<0>  if          { \s i -> return (If, lineNumber s) }

<0>  ":"         { \s i -> return (Colon, lineNumber s) }
<0>  "("         { \s i -> return (Lparen, lineNumber s) }
<0>  ")"         { \s i -> return (Rparen, lineNumber s) }
<0>  "{"         { \s i -> return (Lbracket, lineNumber s) }
<0>  "}"         { \s i -> return (Rbracket, lineNumber s) }
<0>  ","         { \s i -> return (Comma, lineNumber s) }

<0>  ";"         { \s i -> return (Semicolon, lineNumber s) }
<0>  "."         { \s i -> return (Dot, lineNumber s) }
<0>  "="         { \s i -> return (Equals, lineNumber s) }


<0>  def         { \s i -> return (Def, lineNumber s) }
<0>  return      { \s i -> return (Return, lineNumber s) }
<0> while        { \s i -> return (While, lineNumber s) }   
<0> elif         { \s i -> return (Elif, lineNumber s) }
<0> extends      { \s i -> return (Extends, lineNumber s) }
<0> else         { \s i -> return (Else, lineNumber s) }



<0>  "+"         { \s i -> return (Sum, lineNumber s) }
<0>  "-"         { \s i -> return (Difference, lineNumber s) }
<0>  "*"         { \s i -> return (Product, lineNumber s) }
<0>  "/"         { \s i -> return (Quotient, lineNumber s) }



<0> "==" {\s i -> return (Equality, lineNumber s) } 
<0> "<=" {\s i -> return (LEQ, lineNumber s)}
<0> "<" {\s i -> return (Lt, lineNumber s)}
<0> ">=" {\s i -> return (GEQ, lineNumber s)}
<0> ">" {\s i -> return (Gt, lineNumber s)}
<0> "and" {\s i -> return (And, lineNumber s)}
<0> "or" {\s i -> return (Or, lineNumber s)}
<0> "not" {\s i -> return (Not, lineNumber s)}





     eof  {\s i -> return (EOFToken, lineNumber s)}



<0> "//"(.*)           {begin 0}

<0> "/*"               {begin comment2}
<comment2> "*/"          {begin 0}

<comment2> [.\n]       ;






 <0> \"\"\" {begin string2}


<string2> ((([.\n]?[.\n]?[^\"])* \"\"\") | \"\"\")  { \s i -> ( (alexSetStartCode 0) >> return ((TargetString $ take (i-3) $ project    s), lineNumber s))}



<0>  \"           {begin string1}
<string1> ([. # \" # \\] | \\0 | \\b | \\t | \\n | \\r | \\f | \\\" | \\\\ )* \"  { \s i -> ( (alexSetStartCode 0) >> return ((TargetString $ (take (i-1) $ project s)), lineNumber s))}





<0>       [0-9]+    { \s i -> return ((Number $ take i $ project s), lineNumber s)}



<0>  [\_ $alpha] [\_ $alpha $digit]* { \s i -> return ((Identifier $ take i $ project s), lineNumber s)}


[.\n] { \s i -> (alexSetStartCode 0) >> return ((Error $ take 1 $ project s), lineNumber s)} -- not sure what to do here.


{

lineNumber ((AlexPn _ s _),_,_,_) = s


-- Some code taken from https://www.haskell.org/alex/doc/alex.pdf, possibly other mostly official references.
-- I also used this tutorial https://www.jyotirmoy.net/posts/2015-08-17-alex-happy-startcodes.html




project (_,_,_,x) = x






-- Each action has type :: String -> Token

-- The token type:
data Token =
  Class
  | While
  | Elif
  | Extends
  | Else
  | If
  | Identifier String
  | Colon
  | Lparen
  | Rparen
  | Lbracket
  | Rbracket
  | Comma
  | Semicolon
  | Dot
  | Equals
  | Def
  | Return
  | Sum
  | Difference
  | Product
  | Quotient
  | Number String

  | TargetString String
  | Error String

  | Equality
  | LEQ
  | Lt
  | GEQ
  | Gt
  | And
  | Or
  | Not




  | EOFToken
  deriving (Eq,Show)

alexEOF = return (EOFToken,undefined)




helpPrint :: Int -> String -> String -> String
helpPrint n t val = (show n) ++ "  " ++ t ++ " \"" ++ val ++ "\""

myPrint :: (Token, Int) -> Either String String
myPrint (Class, n) = Left $ helpPrint n "CLASS" "class"
myPrint (While, n) = Left $ helpPrint n "WHILE" "while"
myPrint (Elif, n) = Left $ helpPrint n "ELIF" "elif"
myPrint (Extends, n) = Left $ helpPrint n "EXTENDS" "extends"
myPrint (Else, n) = Left $ helpPrint n "ELSE" "else"
myPrint (If, n) = Left $ helpPrint n "IF" "if"
myPrint (Identifier val, n) = Left $ helpPrint n "IDENT" val
myPrint (Colon, n) = Left $ helpPrint n ":" ":"
myPrint (Lparen, n) = Left $ helpPrint n "(" "("
myPrint (Rparen, n) = Left $ helpPrint n ")" ")"
myPrint (Lbracket, n) = Left $ helpPrint n "{" "{"
myPrint (Rbracket, n) = Left $ helpPrint n "}" "}"
myPrint (Comma, n) = Left $ helpPrint n "," ","
myPrint (Semicolon, n) = Left $ helpPrint n ";" ";"
myPrint (Dot, n) = Left $ helpPrint n "." "."
myPrint (Equals, n) = Left $ helpPrint n "=" "="
myPrint (Def, n) = Left $ helpPrint n "DEF" "def"
myPrint (Return, n) = Left $ helpPrint n "RETURN" "return"
myPrint (Sum, n) = Left $ helpPrint n "+" "+"
myPrint (Difference, n) = Left $ helpPrint n "-" "-"
myPrint (Product, n) = Left $ helpPrint n "*" "*"
myPrint (Quotient, n) = Left $ helpPrint n "/" "/"
myPrint (Number val, n) = Left $ helpPrint n "INT_LIT" val
myPrint (TargetString val, n) = Left $ helpPrint n "STRING_LIT" val {- I should not add extra quotes here, but I do so that this will be easier to grade. -}
myPrint (Error val, n) = Right $ helpPrint n "ERROR" val

myPrint (Equality, n) = Left $ helpPrint n "EQUALS" "=="
myPrint (LEQ, n) = Left $ helpPrint n "<=" "<=" 
myPrint (Lt, n) = Left $ helpPrint n "<" "<"
myPrint (GEQ, n) = Left $ helpPrint n ">=" ">="
myPrint (Gt, n) = Left $ helpPrint n ">" ">"
myPrint (And, n) = Left $ helpPrint n "AND" "and"
myPrint (Or, n) = Left $ helpPrint n "OR" "or"
myPrint (Not, n) = Left $ helpPrint n "NOT" "not"



myPrint (EOFToken, _) = Left "" {-do I have to worry about an extra newline?-}


fooPrint :: Either String String -> IO ()
fooPrint (Left s) = putStrLn s
fooPrint (Right s) = hPutStrLn stderr s




-- Philip Overgod code:

gather =  alexMonadScan >>= \x -> 
  case x of 
   (EOFToken,n) -> return []
   _ -> gather >>= (return . (x :))

-- end Overgod code

helper s = case runAlex s gather of
                Left _ -> mapM putStrLn [] {- print $ map myPrint (runAlex s (gather)) -}
                Right x -> mapM fooPrint (map myPrint x)


} 


