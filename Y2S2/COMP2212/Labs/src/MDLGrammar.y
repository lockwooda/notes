{
module MDLGrammar where
import MDLTokens
}

%name parseMDL
%tokentype { Token }
%error { parseError }
%token
    if { TokenIf }
	then { TokenThen }
	else { TokenElse }
	forward { TokenForward $$ }
	rotateleft { TokenRotateLeft }
    rotateright { TokenRotateRight }
	obstacle { TokenObstacle $$ }

%%
Expr : if Conditional then ExprList else ExprList { IfThenElse $2 $4 $6 }
     | forward { Forward $1 }
     | rotateleft { Rotate DirLeft }
     | rotateright { Rotate DirRight }

ExprList : Expr { ExprSingle $1 }
         | ExprList Expr { ExprList $1 $2 }

Conditional : obstacle { Obstacle $1 }

{
parseError :: [Token] -> a
parseError _ = error "Parse error"

data Expr = IfThenElse Conditional ExprList ExprList
          | Forward Int
		  | Rotate Direction
          deriving Show

data ExprList = ExprSingle Expr
              | ExprList ExprList Expr
              deriving Show

data Direction = DirLeft | DirRight deriving Show
data Conditional = Obstacle Int deriving Show
}