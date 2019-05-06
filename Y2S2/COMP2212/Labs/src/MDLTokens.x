{
module MDLTokens where
}

%wrapper "basic"
$digit = [0-9]
$conddigit = [1-9]

tokens :-
    $white+ ;
    "--".* ;
    forward " " $digit+ { \s -> TokenForward ((read $ head $ tail $ words s) :: Int) }
    rotate " " left { \s -> TokenRotateLeft }
    rotate " " right { \s -> TokenRotateRight }
    if { \s -> TokenIf }
    then { \s -> TokenThen }
    else { \s -> TokenElse }
    obstacle " " $conddigit { \s -> TokenObstacle ((read $ head $ tail $ words s) :: Int) }
{
data Token =
    TokenForward Int   |
    TokenRotateLeft    |
    TokenRotateRight   |
    TokenIf            |
    TokenThen          |
    TokenElse          |
    TokenObstacle Int
    deriving (Eq, Show)  
}