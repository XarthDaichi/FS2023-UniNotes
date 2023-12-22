comment_line --> "//", words, "\n".

words --> [C], spaces, {code_type(C, csym)}, spaces, words.
words --> [].

% word --> spaces, letters, spaces.

space --> " " ; "\t" ; "\n" ; "\r".

spaces --> space, spaces.
spaces --> [].

decimal --> "0" ; "1" ; "2" ; "3" ; "4" ; "5" ; "6" ; "7" ; "8" ; "9".

lower_letter --> "a" ; "b" ; "c" ; "d" ; "e" ; "f" ; "g" ; "h" ; "i" ; "j" ; "k" ; "l" ; "m" ; "n" ; "o" ; "p" ; "k" ; "r" ; "s" ; "t" ; "u" ; "v" ; "w" ; "x" ; "y" ; "z".
upper_letter --> "A" ; "B" ; "C" ; "D" ; "E" ; "F" ; "G" ; "H" ; "I" ; "J" ; "K" ; "L" ; "M" ; "N" ; "O" ; "P" ; "K" ; "R" ; "S" ; "T" ; "U" ; "V" ; "W" ; "X" ; "Y" ; "Z".

letter --> lower_letter ; upper_letter.
alpha_numeric_char --> letter ; decimal.

letters --> alpha_numeric_char, letters.
letters --> [].