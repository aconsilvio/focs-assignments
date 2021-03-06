# FOCS Homework for Day 9

You may edit your answers into this file, or add a separate file in the same directory.

If you add a separate file, please include the following at the top:

```
Student Name: Annabel Consilvio
Check one:
[ ] I completed this assignment without assistance or external resources.
[x] I completed this assignment with David and Shruti
```

## 1. For each of the following languages, decide whether it is regular

For each of the following languages, decide whether it is regular.  If it is regular, give a regular expression or finite automaton that recognizes the language.  If it is not regular, demonstrate that using the pumping lemma.

a) Strings containing only the symbol a whose length is a power of 2 (*i.e.* length 2^n)

[The strings `a`, `aa`, `aaaa`, and `aaaaaaaa` are in this language; the string `aaaaa` is not.]
----
This is not regular because if you chose a number of 'a's in 'aaaa', there is a chance you don't repeat them enough times to satisfy the requirement that the string is 2^n.  For example, if I choose 'aa' from 'aaaaaaaa' and only repeat it once to get 'aaaaaaaaaa', this string does not have a length of 2^n, which makes it an irregular language.

b) All strings with an equal number of occurrences of the substrings `01` and `10`.

[010 is in this language; `000110` is in the language; `0101010` is in the language; but `010101` is not.]
----
This is a regular language.  (0[01]*0|1[01]*1)

c) All strings (over {0,1}) consisting of a substring _w_ followed by the reverse of the substring.

[The strings `00100100` and `11110101011010101111` are in this language; the strings `00100` and `010101 `are not.]
----
This is not a regular language.  For example, if you choose the substring '100' from '00100100', you can get a string '00100100100', which has no substring that is followed by the reverse of itself.

## 2. Play the pumping game

Play the **pumping game** (referenced on the [Day 8 page](https://sites.google.com/site/focs16fall/in-class-exercises/day-8) and also found at [http://weitz.de/pump/](http://weitz.de/pump/)).  Solve at least two puzzles from that page (that do NOT appear in question 1, above) and provide the word you chose, the substring the computer chose, and your successfully pumped string.

Notation notes:

- The notation |w| sub a means the number of `a`'s in the word _w_.
- _a_^_n_ means _n_ occurrences of `a` (e.g. _a_^8 is `aaaaaaaa`)

#4 - String given: aaaaaaaaaaaaaaaaaaaabbbbbbbaaaaaaaaaaaaaaaaaaaaaaaaaaa
	 Substring chosen: aaaaa
	 String given back: aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaabbbbbbbaaaaaaaaaaaaaaaaaaaaaaaaaaa (not part of the language)

#6 - String given: aaaaaaaaaaaaaaaaaaaaaaaaaaaaa
	 Substring chosen: aaaaaaaaa
	 String given back: aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa  (not part of the language)

#2 - String given: aaaaaaaaaabbbbbbbbbb
	 String chosen: aaabbbbbbb
	 String given back: aaaaaaaaaabbbbbbbaaabbbbbbbaaabbbbbbbbbb  (not part of the language)

If you have other questions about notation (or anything else), please post them to [Piazza](https://piazza.com) so that we can clarify for everyone.

## 3. Create a PDA

For one of the non-regular languages in problem 1 or 2 above, create a PDA (preferably in JFLAP) and include it with your completed homework.

See jflap file pushed along with this HW.

## 4. Reading

Optionally read Sipser pp. 101–125.

Optionally read Stuart pp. 128–134.

## 5. Install gprolog

Please download and install [gprolog](http://www.gprolog.org) before coming to class:

**Ubuntu**:

	$ sudo apt-get install gprolog

**Mac**, with [Homebrew](http://brew.sh) installed:

	$ brew install gnu-prolog

**Mac** without Homebrew, and **Windows**:

- Follow the instructions at [http://www.gprolog.org/#download](http://www.gprolog.org/#download).
