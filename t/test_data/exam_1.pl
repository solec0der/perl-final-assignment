my $actual_exam = {
    "HEADER",
    "Student ID:  [____________]\nFamily Name: [____________]\nFirst Name:  [____________]\n\nINSTRUCTIONS:\n\nComplete and return this multiple-choice exam\nno later than 23:59 CET Monday 23 August 2021.\n\nYou may consult any written material you wish\n(e.g. the class notes or the recommended textbook),\nbut you must not consult or collaborate with\nany other person.\n\nComplete this exam by placing an 'X' in the box\nbeside the single correct answer of each question,\nlike so:\n\n    [ ] This is not the correct answer\n    [ ] This is not the correct answer either\n    [ ] This is an incorrect answer\n    [X] This is the correct answer\n    [ ] This is an irrelevant answer\n\nWARNING: Each question has only one correct answer.\n         If two or more boxes are marked with an 'X',\n         the answer will be scored as zero.\n\n",
    "QUESTIONS",
    [
        {
            ANSWERS       => [
                "[X] Nothing: Perl variables don't have a static type\n",
                "[ ] The name of the variable\n",
                "[ ] The type of the first value placed in the variable\n",
                "[ ] The compile-time type declarator of the variable\n",
                "[ ] Random chance\n",
            ],
            QUESTION_TEXT => "The static type of a Perl variable is determined by:\n",
        },
        {
            ANSWERS       => [
                "[X] List, scalar, and void\n",
                "[ ] List, linear, and void\n",
                "[ ] List, scalar, and null\n",
                "[ ] Null, scalar, and void\n",
                "[ ] Blood, sweat, and tears\n",
            ],
            QUESTION_TEXT => "Perl's three main types of call context (or \"amount context\") are:\n",
        },
        {
            ANSWERS       => [
                "[X] \$_\n",
                "[ ] \@_\n",
                "[ ] \$\$\n",
                "[ ] \$=\n",
                "[ ] The last variable that was successfully assigned to\n",
            ],
            QUESTION_TEXT => "The \"default variable\" (or \"topic variable\") is:\n",
        },
        {
            ANSWERS       => [
                "[X] \@ARGV\n",
                "[ ] \$ARGV\n",
                "[ ] \@ARGS\n",
                "[ ] \@ARG\n",
                "[ ] \@_\n",
            ],
            QUESTION_TEXT => "You can access the command-line arguments of a Perl program via:\n",
        },
        {
            ANSWERS       => [
                "[X] CPAN\n",
                "[ ] CSPAN\n",
                "[ ] Github\n",
                "[ ] Perlhub\n",
                "[ ] www.perl.org\n",
            ],
            QUESTION_TEXT => "The main repository for Open Source Perl modules is:\n",
        },
        {
            ANSWERS       => [
                "[X] '\$' for scalars, '\@' for arrays, '%' for hashes\n",
                "[ ] '\$' for scalars, '\@' for hashes, '%' for arrays\n",
                "[ ] '\$' for scalars, '\@' for consts, '%' for literals\n",
                "[ ] '\$' for numeric, '\@' for emails, '%' for percentages\n",
                "[ ] '\$' for lookups, '\@' for reuses, '%' for declarations\n",
            ],
            QUESTION_TEXT => "The three standard sigils for variable declarations are:\n",
        },
        {
            ANSWERS       => [
                "[X] 'my' variables are lexically scoped;  'our' variables are package scoped\n",
                "[ ] 'my' variables are subroutine scoped; 'our' variables are block scoped\n",
                "[ ] 'my' variables are compile-time;      'our' variables are run-time\n",
                "[ ] 'my' variables must be scalars;       'our' variables must be arrays or hashes\n",
                "[ ] 'my' variables are assignable;        'our' variables are constants\n",
            ],
            QUESTION_TEXT => "The difference between a 'my' variable and an 'our' variable is:\n",
        },
        {
            ANSWERS       => [
                "[X] ...does not interpolate variables or backslashed escape sequences\n",
                "[ ] ...only interpolates variables, but not backslashed escape sequences\n",
                "[ ] ...only interpolates backslashed escape sequences, but not variables\n",
                "[ ] ...interpolates both variables and backslashed escape sequences\n",
                "[ ] ...converts its contents to ASCII, even if they are Unicode characters\n",
            ],
            QUESTION_TEXT => "A single-quoted string (such as: 'I will achieve 100% on this exam')...\n",
        },
        {
            ANSWERS       => [
                "[X] ...another way of writing the double-quoted string: \"XXXXX\"\n",
                "[ ] ...another way of writing the single-quoted string: 'XXXXX'\n",
                "[ ] ...another way of writing the list of strings:  ('X', 'X', 'X', 'X', 'X')\n",
                "[ ] ...another way of writing the array of strings: ['X', 'X', 'X', 'X', 'X']\n",
                "[ ] ...a call to the 'qq' function, passing it a block of code\n",
            ],
            QUESTION_TEXT => "The term qq{XXXXX} is...\n",
        },
        {
            ANSWERS       => [
                "[X] 1'042\n",
                "[ ] 1042\n",
                "[ ] 1_042\n",
                "[ ] 1.042e3\n",
                "[ ] 0b10000010010\n",
            ],
            QUESTION_TEXT => "Which of the following is NOT a single valid Perl number?\n",
        },
        {
            ANSWERS       => [
                "[X] A container for a list\n",
                "[ ] Exactly the same thing as a list\n",
                "[ ] Something that is always contained inside a list\n",
                "[ ] A list with a predeclared fixed number of elements\n",
                "[ ] A multidimensional list\n",
            ],
            QUESTION_TEXT => "An array is...\n",
        },
        {
            ANSWERS       => [
                "[X] ...in all circumstances\n",
                "[ ] ...only if it controls exactly one statement\n",
                "[ ] ...only if it controls two or more statements\n",
                "[ ] ...only if the statements it controls include a variable declaration\n",
                "[ ] ...never; the curly brackets are always optional in an 'if' statement\n",
            ],
            QUESTION_TEXT => "An 'if' statement requires curly brackets around the statements it controls...\n",
        },
        {
            ANSWERS       => [
                "[X] elsif\n",
                "[ ] elseif  (with no whitespace between the two words)\n",
                "[ ] else if (with whitespace between the two words)\n",
                "[ ] elif\n",
                "[ ] ormaybe (with no whitespace between the two words)\n",
            ],
            QUESTION_TEXT => "To specify a second alternative test after an 'if', the correct keyword is:\n",
        },
        {
            ANSWERS       => [
                "[X] ...Perl evaluates as little as required to get a definite answer\n",
                "[ ] ...Perl only evaluates each boolean expression once during the program\n",
                "[ ] ...Perl defers evaluating the expression until the result is tested\n",
                "[ ] ...Perl will never execute an 'else' block\n",
                "[ ] ...Perl programs can cause CPUs to emit sparks if an expression is too complex\n",
            ],
            QUESTION_TEXT => "\"Short-circuiting\" of a boolean expression means...\n",
        },
        {
            ANSWERS       => [
                "[X] ...once per element in the list, unless a 'last' is executed in the block\n",
                "[ ] ...once per element in the list in all circumstances\n",
                "[ ] ...endlessly, until a 'last' is executed in the loop\n",
                "[ ] ...an unknown number of times, until the list being iterated is empty\n",
                "[ ] ...never, because an array is not a list and cannot be iterated\n",
            ],
            QUESTION_TEXT => "A \"foreach-style\" loop (such as: for (\@list) {...}) will be iterated...\n",
        },
        {
            ANSWERS       => [
                "[X] ...iterates until its condition is false at the start of an iteration\n",
                "[ ] ...iterates until its condition is true at the start of an iteration\n",
                "[ ] ...iterates until its condition becomes false anywhere within its block\n",
                "[ ] ...iterates until its condition becomes true anywhere within its block\n",
                "[ ] ...doesn't exist; Perl does not have a 'while' loop\n",
            ],
            QUESTION_TEXT => "The 'while' loop in Perl...\n",
        },
        {
            ANSWERS       => [
                "[X] 'given'  and 'when'    and 'default'\n",
                "[ ] 'switch' and 'case'    and 'else'\n",
                "[ ] 'gather' and 'take'    and 'otherwise'\n",
                "[ ] 'case'   and 'of'      and 'or'\n",
                "[ ] 'whence' and 'whither' and 'thither'\n",
            ],
            QUESTION_TEXT => "The keywords for the Perl switch statement are:\n",
        },
        {
            ANSWERS       => [
                "[X] 0, '0', '', (), undef\n",
                "[ ] 0, '0', '', (), []\n",
                "[ ] 0, '0', 'false', 'False', 'FALSE'\n",
                "[ ] 0, +0, -0, 0.0, -0.0\n",
                "[ ] False, Nil, Null, None, Empty\n",
            ],
            QUESTION_TEXT => "Which five Perl values are the only values that ever evaluate false?\n",
        },
        {
            ANSWERS       => [
                "[X] Six:   because the four array elements will be flattened into the list\n",
                "[ ] Eight: because 1 * 4 * 2 = 8\n",
                "[ ] Three: because the array will become a single element within the list\n",
                "[ ] Two:   because Perl ignores non-scalar variables in a list constructor\n",
                "[ ] None:  because it won't compile; arrays can't be used in list constructors\n",
            ],
            QUESTION_TEXT => "If the array \@x contains four elements,\n    how many elements will be in the list (1, \@x, 2)?\n",
        },
        {
            ANSWERS       => [
                "[X] Values of any scalar type, indexed by keys that are always strings\n",
                "[ ] Values of any scalar or list type, indexed by keys that are always strings\n",
                "[ ] Values that are always strings, indexed by keys of any type\n",
                "[ ] Values that are unique, indexed by keys that may be repeated\n",
                "[ ] Random values, indexed by sequential keys of any type\n",
            ],
            QUESTION_TEXT => "A hash variable stores...\n",
        },
        {
            ANSWERS       => [
                "[X] 0 (because that's the correct mathematical outcome)\n",
                "[ ] 1 (as a convenience, to avoid subsequent division by zero)\n",
                "[ ] A non-fatal warning (because 'Inf' is a string, not a number)\n",
                "[ ] A fatal exception (because 'Inf' is a string, not a number)\n",
                "[ ] An infinite evaluation loop; the program will run forever\n",
            ],
            QUESTION_TEXT => "The expression 1 / 'Inf' produces the result:\n",
        },
        {
            ANSWERS       => [
                "[X] A type-safe immutable pointer to an existing value or variable\n",
                "[ ] A mutable pointer to a value or variable, without type-checking\n",
                "[ ] An alias (i.e. another name) for an existing variable\n",
                "[ ] A deep copy of an existing variable or value\n",
                "[ ] A link to the documentation for an existing value or variable\n",
            ],
            QUESTION_TEXT => "A \"reference\" in Perl is best described as:\n",
        },
        {
            ANSWERS       => [
                "[X] ...scalars, arrays, hashes, and subroutines\n",
                "[ ] ...scalars, arrays, and hashes, but NOT subroutines\n",
                "[ ] ...scalars and arrays, but NOT hashes or subroutines\n",
                "[ ] ...arrays and hashes (i.e. containers), but NOT scalars or subroutines\n",
                "[ ] ...only scalars (NOT to arrays, hashes, or subroutines)\n",
            ],
            QUESTION_TEXT => "In Perl, you can take references to...\n",
        },
        {
            ANSWERS       => [
                "[X] 'sub'\n",
                "[ ] 'subroutine'\n",
                "[ ] 'fun'\n",
                "[ ] 'do'\n",
                "[ ] Nothing: subroutines are not explicitly declared in Perl\n",
            ],
            QUESTION_TEXT => "User-defined subroutines are declared with the keyword:\n",
        },
        {
            ANSWERS       => [
                "[X] \@_\n",
                "[ ] \$_\n",
                "[ ] \@ARGV\n",
                "[ ] \@ARGS\n",
                "[ ] \$ARGV\n",
            ],
            QUESTION_TEXT => "Which variable contains the argument with which a subroutine was called?\n",
        },
        {
            ANSWERS       => [
                "[X] sub two_or_more (\$flag, \@data)           {...}\n",
                "[ ] sub two_or_more (\$data, \$flag)           {...}\n",
                "[ ] sub two_or_more (\$flag, \$data = \@extras) {...}\n",
                "[ ] sub two_or_more (\$flag, ...)             {...}\n",
                "[ ] sub two_or_more (\@flags, \@data_set)      {...}\n",
            ],
            QUESTION_TEXT => "Which one of the following subroutine declarations correctly declares\n    a subroutine that can must be called with at least two arguments\n    but which may also be called with more than two arguments?\n",
        },
        {
            ANSWERS       => [
                "[X] ...it will return the value the last expression it actually evaluates\n",
                "[ ] ...it will return the value the final statement in its code block\n",
                "[ ] ...it will return 'undef'\n",
                "[ ] ...it will throw an exception after executing its final statement\n",
                "[ ] ...it will never return and will continue to execute forever\n",
            ],
            QUESTION_TEXT => "If a user-defined subroutine does not contain a 'return' statement...\n",
        },
        {
            ANSWERS       => [
                "[X] 'die'\n",
                "[ ] 'throw'\n",
                "[ ] 'raise'\n",
                "[ ] 'except'\n",
                "[ ] 'exit'\n",
            ],
            QUESTION_TEXT => "The keyword to throw an exception in Perl is:\n",
        },
        {
            ANSWERS       => [
                "[X] Caught in an 'eval' block;  accessed via the special \$\@ variable\n",
                "[ ] Caught in an 'eval' block'; accessed via the special \$! variable\n",
                "[ ] Caught in a 'catch' block;  accessed via an 'access' block\n",
                "[ ] Caught in a 'try' block;    accessed via the builtin 'eval' function\n",
                "[ ] Exceptions in Perl can't be caught or accessed after they're thrown\n",
            ],
            QUESTION_TEXT => "How can exceptions be caught and subsequently accessed in Perl?\n",
        },
        {
            ANSWERS       => [
                "[X] It disallows undeclared variables, barewords, and symbolic references\n",
                "[ ] It converts all warnings to fatal errors\n",
                "[ ] It disallows package variables (all variables must be declared with 'my')\n",
                "[ ] It reports all errors using verbose (and harshly worded) error messages\n",
                "[ ] It prevents any construct that might also be valid C code\n",
            ],
            QUESTION_TEXT => "What is the purpose of the 'use strict' pragma?\n",
        },
    ],
};