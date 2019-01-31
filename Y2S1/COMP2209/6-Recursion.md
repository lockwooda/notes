# Recursion

We can use the same basic pattern for recursion over lists to define many functions.

``` haskell
length :: [a] -> Int
length [] = 0
length (x:xs) = 1 + length xs
```

Consider how this is evaluated.

```haske
length [1,2,3]
= 1 + length [2,3]
= 1 + (1 + length [3])
= 1 + (1 + (1 + length [0]))
= 1 + (1 + (1 + 0))
= 1 + (1 + 1)
= 1 + 2
= 3
```

## Mutual Recursion

Haskell supports definition of functions with mutual recursion in which two or more functions are defined in terms of each other.

For example, define a function that gets odd and even characters from a string.

``` haskell
evens :: [a] -> [a]
odds :: [a] -> [a]

evens [] = []
evens (x:xs) = x : odds xs

odss [] = []
odss (x:xs) = evens xs
```

## Five Steps to Better Recursion

1. Define the type
2. Enumerate the cases
3. Define the sample (base) cases
4. Define the other (inductive) cases
5. Generalise and simplify

### Product

#### Step 1 - Define the type

```haskell
product :: [Int] -> Int
```

#### Step 2 - Enumerate cases

```haskell
product [] = ???
product (n:ns) = ???
```

#### Step 3 - Simple Cases

``` haskell
product [] = 1
product (n:ns) = ???
```

#### Step 4 - Inductive Cases

``` haskell
product [] = 1
product (n:ns) = n * product ns
```

#### Step 5 - Generalise and simplify

``` haskell
product :: Num a => [a] -> a
product [] = 1
product (n:ns) = n * product ns
```

## Tail Recursion

A recursive function is tail recursive if there is no suspended computation built up in the execution stack aas the recursion unfolds.

### Reverse Function

``` haskell
reverse :: [a] -> [a] -> [a]
reverse [] acc = acc
reverse (x:xs) acc = reverse xs (x:acc)
```

Tail recursion can be more efficient, but not always.