# Lexing and Parsing in Haskell (and some coursework)

## Coursework

Get started soon.

Can be as expressive as you like (for example, Turing complete), or can be as specific as you like (for example, a programming language with five keywords. Not good!)

Your language should be somewhere in between expressive and specific. Should be a domain specific language around the ideas of finite streams of Integers.

### Qualitative Parts of Coursework

* Expressive
* Concise
* Readable
* Good tutorial manual
* Additional features
  * Anything that makes it nice for the programmer to use
    * Comments
    * Informative error messages
    * Possible types?
    * Syntax highlighting plugins
  * 10% of your mark!

## Lexing and Parsing in Haskell

The options available:

* Alex
  * Generating lexical analysers
* Parsec
  * Popular, with many useful features
  * Has recursive descent problems
* Happy
  * Parser generator for Haskell

### Alex

Similar to classic C lexing tool. Provides Haskell code that contains the lexer for use.
The wrappers give a bit more power in what your lexer can carry around.

Alex expects you to provide certain definitions. Alex provides alexScan function to be used for lexing. A basic wrapper does the job for this. It gets a function String -> [Token] quickly.

There are different wrappers, such as 'posn', 'monad' and 'monadUserState'.

### Parsec

Combine small parsing functions to build more sophisticated parsers. Parsing is top-down recursive descent style.
Important functions:

* makeTokenParser
* buildExpressionParser