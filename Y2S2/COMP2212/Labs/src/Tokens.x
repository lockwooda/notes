{ 
module Tokens where 
}

%wrapper "posn"

$digit = 0-9     
-- digits 
$alpha = [a-zA-Z]    
-- alphabetic characters

tokens :-
$white+       ; 
"--".*        ; 
let           { tok (\p s -> TokenLet p) } 
in            { tok (\p s -> TokenIn p) }
$digit+       { tok (\p s -> TokenInt p (read s)) } 
\=            { tok (\p s -> TokenEq p) }
\+            { tok (\p s -> TokenPlus p) }
\-            { tok (\p s -> TokenMinus p) }
\*            { tok (\p s -> TokenTimes p) }
\/            { tok (\p s -> TokenDiv p) }
\^            { tok (\p s -> TokenExponent p) }
\(            { tok (\p s -> TokenLParen p) }
\)            { tok (\p s -> TokenRParen p) }
$alpha [$alpha $digit \_ \’]*   { tok (\p s -> TokenVar p s) } 

{
tok :: (AlexPosn -> String -> Token) -> AlexPosn -> String -> Token
tok f p s = f p s

-- Each action has type :: AlexPosn -> String -> Token 
-- The token type: 
data Token = 
  TokenLet AlexPosn        | 
  TokenIn AlexPosn         | 
  TokenInt AlexPosn Int    |
  TokenVar AlexPosn String | 
  TokenEq AlexPosn         |
  TokenPlus AlexPosn       |
  TokenMinus AlexPosn      |
  TokenTimes AlexPosn      |
  TokenDiv AlexPosn        |
  TokenExponent AlexPosn   |
  TokenLParen AlexPosn     |
  TokenRParen AlexPosn      
  deriving (Eq,Show) 

token_posn :: Token -> AlexPosn
token_posn (TokenLet p) = p
token_posn (TokenIn p) = p
token_posn (TokenInt p _) = p
token_posn (TokenVar p _) = p 
token_posn (TokenEq p) = p
token_posn (TokenPlus p) = p
token_posn (TokenMinus p) = p
token_posn (TokenTimes p) = p
token_posn (TokenDiv p) = p
token_posn (TokenExponent p) = p
token_posn (TokenLParen p) = p
token_posn (TokenRParen p) = p
}
