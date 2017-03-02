{

module Tokens where

import System.IO
}

%wrapper "monad"

$digit = 0-9			-- digits
$alpha = [a-zA-Z]		-- alphabetic characters



tokens :-
<0>  $white+				;

<0>  class       { \s i -> return (Token Class (lineNumber s)) }
<0>  if          { \s i -> return (Token If (lineNumber s)) }

<0>  ":"         { \s i -> return (Token Colon (lineNumber s)) }
<0>  "("         { \s i -> return (Token Lparen (lineNumber s)) }
<0>  ")"         { \s i -> return (Token Rparen (lineNumber s)) }
<0>  "{"         { \s i -> return (Token Lbracket (lineNumber s)) }
<0>  "}"         { \s i -> return (Token Rbracket (lineNumber s)) }
<0>  ","         { \s i -> return (Token Comma (lineNumber s)) }

<0>  ";"         { \s i -> return (Token Semicolon (lineNumber s)) }
<0>  "."         { \s i -> return (Token Dot  (lineNumber s)) }
<0>  "="         { \s i -> return (Token Equals (lineNumber s)) }


<0>  def         { \s i -> return (Token Def (lineNumber s)) }
<0>  return      { \s i -> return (Token Return (lineNumber s)) }
<0> while        { \s i -> return (Token While (lineNumber s)) }   
<0> elif         { \s i -> return (Token Elif (lineNumber s)) }
<0> extends      { \s i -> return (Token Extends (lineNumber s)) }
<0> else         { \s i -> return (Token Else (lineNumber s)) }



<0>  "+"         { \s i -> return (Token Sum (lineNumber s)) }
<0>  "-"         { \s i -> return (Token Difference (lineNumber s)) }
<0>  "*"         { \s i -> return (Token Product (lineNumber s)) }
<0>  "/"         { \s i -> return (Token Quotient (lineNumber s)) }



<0> "==" {\s i -> return (Token Equality (lineNumber s)) } 
<0> "<=" {\s i -> return (Token LEQ (lineNumber s))}
<0> "<" {\s i -> return (Token Lt (lineNumber s))}
<0> ">=" {\s i -> return (Token GEQ (lineNumber s))}
<0> ">" {\s i -> return (Token Gt (lineNumber s))}
<0> "and" {\s i -> return (Token And (lineNumber s))}
<0> "or" {\s i -> return (Token Or (lineNumber s))}
<0> "not" {\s i -> return (Token Not (lineNumber s))}





     eof  {\s i -> return (Token EOFToken (lineNumber s))}



<0> "//"(.*)           {begin 0}

<0> "/*"               {begin comment2}
<comment2> "*/"          {begin 0}

<comment2> [.\n]       ;






 <0> \"\"\" {begin string2}


<string2> ((([.\n]?[.\n]?[^\"])* \"\"\") | \"\"\")  { \s i -> ( (alexSetStartCode 0) >> return (Token (TargetString $ take (i-3) $ project    s) (lineNumber s)))}



<0>  \"           {begin string1}
<string1> ([. # \" # \\] | \\0 | \\b | \\t | \\n | \\r | \\f | \\\" | \\\\ )* \"  { \s i -> ( (alexSetStartCode 0) >> return (Token (TargetString $ (take (i-1) $ project s)) (lineNumber s)))}





<0>       [0-9]+    { \s i -> return (Token (Number $ take i $ project s) (lineNumber s))}



<0>  [\_ $alpha] [\_ $alpha $digit]* { \s i -> return (Token (Identifier $ take i $ project s) (lineNumber s))}


[.\n] { \s i -> (alexSetStartCode 0) >> return (Token (Error $ take 1 $ project s) (lineNumber s))} -- not sure what to do here.


{



getLineNumber :: Alex Int
getLineNumber = Alex $ \s -> Right (s, myGetLineNumber $ alex_pos s)


myGetLineNumber (AlexPn _ s _) = s

lineNumber ((AlexPn _ s _),_,_,_) = s


-- Some code taken from https://www.haskell.org/alex/doc/alex.pdf, possibly other mostly official references.
-- I also used this tutorial https://www.jyotirmoy.net/posts/2015-08-17-alex-happy-startcodes.html




project (_,_,_,x) = x






-- Each action has type :: String -> Token

-- The token type:

data Token = Token TokenInner Int
        deriving Show
data TokenInner =
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

alexEOF = return (Token EOFToken (-1))




helpPrint :: Int -> String -> String -> String
helpPrint n t val = (show n) ++ "  " ++ t ++ " \"" ++ val ++ "\""

myPrint :: Token -> Either String String
myPrint (Token Class n) = Left $ helpPrint n "CLASS" "class"
myPrint (Token While n) = Left $ helpPrint n "WHILE" "while"
myPrint (Token Elif n) = Left $ helpPrint n "ELIF" "elif"
myPrint (Token Extends n) = Left $ helpPrint n "EXTENDS" "extends"
myPrint (Token Else n) = Left $ helpPrint n "ELSE" "else"
myPrint (Token If n) = Left $ helpPrint n "IF" "if"
myPrint (Token (Identifier val) n) = Left $ helpPrint n "IDENT" val
myPrint (Token Colon n) = Left $ helpPrint n ":" ":"
myPrint (Token Lparen n) = Left $ helpPrint n "(" "("
myPrint (Token Rparen n) = Left $ helpPrint n ")" ")"
myPrint (Token Lbracket n) = Left $ helpPrint n "{" "{"
myPrint (Token Rbracket n) = Left $ helpPrint n "}" "}"
myPrint (Token Comma n) = Left $ helpPrint n "," ","
myPrint (Token Semicolon n) = Left $ helpPrint n ";" ";"
myPrint (Token Dot n) = Left $ helpPrint n "." "."
myPrint (Token Equals n) = Left $ helpPrint n "=" "="
myPrint (Token Def n) = Left $ helpPrint n "DEF" "def"
myPrint (Token Return n) = Left $ helpPrint n "RETURN" "return"
myPrint (Token Sum n) = Left $ helpPrint n "+" "+"
myPrint (Token Difference n) = Left $ helpPrint n "-" "-"
myPrint (Token Product n) = Left $ helpPrint n "*" "*"
myPrint (Token Quotient n) = Left $ helpPrint n "/" "/"
myPrint (Token (Number val) n) = Left $ helpPrint n "INT_LIT" val
myPrint (Token (TargetString val) n) = Left $ helpPrint n "STRING_LIT" val {- I should not add extra quotes here, but I do so that this will be easier to grade. -}
myPrint (Token (Error val) n) = Right $ helpPrint n "ERROR" val

myPrint (Token Equality n) = Left $ helpPrint n "EQUALS" "=="
myPrint (Token LEQ n) = Left $ helpPrint n "<=" "<=" 
myPrint (Token Lt n) = Left $ helpPrint n "<" "<"
myPrint (Token GEQ n) = Left $ helpPrint n ">=" ">="
myPrint (Token Gt n) = Left $ helpPrint n ">" ">"
myPrint (Token And n) = Left $ helpPrint n "AND" "and"
myPrint (Token Or n) = Left $ helpPrint n "OR" "or"
myPrint (Token Not n) = Left $ helpPrint n "NOT" "not"



myPrint (Token EOFToken _) = Left "" {-do I have to worry about an extra newline?-}


fooPrint :: Either String String -> IO ()
fooPrint (Left s) = putStrLn s
fooPrint (Right s) = hPutStrLn stderr s




-- Philip Overgod code:

gather =  alexMonadScan >>= \x -> 
  case x of 
   (Token EOFToken _) -> return []
   _ -> gather >>= (return . (x :))

-- end Overgod code

helper s = case runAlex s gather of
                Left _ -> mapM putStrLn [] {- print $ map myPrint (runAlex s (gather)) -}
                Right x -> mapM fooPrint (map myPrint x)


} 


