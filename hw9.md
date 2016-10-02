# FOCS Homework 9, for Day 10

You may edit your answers into this file, or add a separate file in the same directory.

If you add a separate file, please include the following at the top:

```
Student Name: Annabel Consilvio
Check one:
[ ] I completed this assignment without assistance or external resources.
[x] I completed this assignment with Shruti and David
```

## 1. Reading

Read Sipser pp. 101–125. (This was the optional reading for today. It is required for Monday.)

## 2. Constructing Grammars

Construct a Context Free Grammar for each of the following languages.

a) All strings (over {0,1}) consisting of a substring _w_ followed by its reverse. (This is the same problem you were asked to work on in class.)

Give a derivation for `010010`.

S -> ε
S -> 0S0
S -> 1S1

Derivation:

S -> 0S0 -> 01S10 -> 010S010 -> 010010

b) All strings (over {a,b,c}) of the form a^{i}b^{i}c^{j}: an equal number of `a`s and `b`s, followed by any number of `c`s. For example, `aabb`, `aabbcc`, and `aabbcccc`, but not `aaaabbcc`.

S -> AC
A -> aAb
A -> ε
C -> Cc
C -> ε

S -> AC -> aAbC -> aaAbbC -> aabbC -> aabbCc -> aabbCcc -> aabbCccc -> aabbccc

c) All strings (over {a,b,c}) of the form a^{i}b^{j}c^{j}: any number of `a`s, followed by an equal number of `b`s and `c`s. For example, `abbcc`, `aabbcc`, and `aaaabbcc`, but not `aabbccc`.

S -> AB
A -> Aa
A -> ε
B -> bBc
B -> ε

S -> AB -> AaB -> AaaB -> AaaaB -> aaaB -> aaabBc -> aaabbBcc -> aaabbcc

d) Give two distinct grammars that produce the strings described by the regular expression `(ab)*`: empty, `ab`, `abab`, `ababab`, ….


1)
S -> abS
S -> ε

S -> abS -> ababS -> abababS -> ababab

2)
S -> ABS
A -> a
B -> b
S -> ε

S -> ABS -> ABABS -> ABAB -> aBAB -> abAB -> abaB -> abab


## 4. Ambiguous Grammars

Consider the grammar:

    S --> a S | a S b S | epsilon 

This grammar is ambiguous. Show in particular that the string `a a b` has
two:

**Please see attached image file in day9 folder for these answers

a. parse trees

b. leftmost derivations (These are the ones that, starting from the start variable, rewrite the leftmost nonterminal first.)

c. rightmost derivations (These are the ones that, starting from the start variable, rewrite the rightmost nonterminal first.)

Extra Credit/Challenge: Prove that this grammar generates all and only the strings of `a`s and `b`s such that every prefix has at least as many `a`s as `b`s. **Hint: Do the readings!**

## 5. [Optional] Play with Prolog

Read the page and download the sample files from [here](https://sites.google.com/site/focs16fall/prolog).

Warning: your instructor was unable to get these to reliably run today, and some of the instructions are from memory of when it previously worked. Your mileage may vary.