# Lexing and Parsing

Given a string, does there exist a derivation in the grammar of the language?

## Lexing

Lexing is essentially pattern matching on some text. We will be identifying the tokens in a string and then interface this with a parser.

![](LexingParsing1.png)

The tokens are identified using regular expressions. A lexr constructs an automaton, which is executed as the individual characters are read into the lexer.

## Parsing

There are two main types of parsers. Top-down and bottom-up.

### Top-Down

The parse tree is built from the root down. They are recursive descent parsers, under which falls LL grammars (with leftmost derivations).

### Bottom-Up

The parse tree is built from the leaves up. They are similar to pushdown automata, under which falls LR grammars (with rightmost derivations).

### Recursive-descent Parsing

Recursive descent parsers typically have one procedure for each production rule of the grammar.
For example:
![](LexingParsing2.png)

### Top-down LL Parsing

It is possible to convert a left recursive grammar to one where there is no left recursion. An example of this is Greibach Normal Form.

We need to be able to determine the right-hand side in a production based on the next token. We can do left factoring, where we convert a grammar into one that passes this requirement.

We denote these kind of grammars as LL(k), where k refers to the lookahead. For example, LL(1) can determine the right-hand side with one token lookahead.

### Bottom-up LR Parsing

Bottom-up LR parsing uses a stack and works similarly to a deterministic pushdown automaton. The state-space and transition functions are pre-computed (this is known as the LR parsing table). This parsing stategy is in linear time of the size of the input string.

Howwever, this requires preprocessing which is typically done by a tool.

### Coursework Choices

You can either roll your own recursive descent parser, use a parsing library like Parsec for recursive descent or use a parser generator like Happy.

In all cases, you can use Alex for lexing.