my $actual_exam = {
    'source_file_name' => 'source_file.txt',
    'questions'        => [
        {
            'answers'  => [
                {
                    'text'     => 'Nothing: Perl variables don\'t have a static type
',
                    'checkbox' => '[X]'
                },
                {
                    'text'     => 'The name of the variable
',
                    'checkbox' => '[ ]'
                },
                {
                    'text'     => 'The type of the first value placed in the variable
',
                    'checkbox' => '[ ]'
                },
                {
                    'text'     => 'The compile-time type declarator of the variable
',
                    'checkbox' => '[ ]'
                },
                {
                    'checkbox' => '[ ]',
                    'text'     => 'Random chance
'
                }
            ],
            'question' => {
                'text'   => 'The static type of a Perl variable is determined by:
',
                'number' => '1'
            }
        },
        {
            'question' => {
                'text'   => 'Perl\'s three main types of call context (or "amount context") are:
',
                'number' => '2'
            },
            'answers'  => [
                {
                    'checkbox' => '[X]',
                    'text'     => 'List, scalar, and void
'
                },
                {
                    'text'     => 'List, linear, and void
',
                    'checkbox' => '[ ]'
                },
                {
                    'checkbox' => '[ ]',
                    'text'     => 'List, scalar, and null
'
                },
                {
                    'text'     => 'Null, scalar, and void
',
                    'checkbox' => '[ ]'
                },
                {
                    'checkbox' => '[ ]',
                    'text'     => 'Blood, sweat, and tears
'
                }
            ]
        },
        {
            'answers'  => [
                {
                    'checkbox' => '[X]',
                    'text'     => '$_
'
                },
                {
                    'text'     => '@_
',
                    'checkbox' => '[ ]'
                },
                {
                    'text'     => '$$
',
                    'checkbox' => '[ ]'
                },
                {
                    'text'     => '$=
',
                    'checkbox' => '[ ]'
                },
                {
                    'text'     => 'The last variable that was successfully assigned to
',
                    'checkbox' => '[ ]'
                }
            ],
            'question' => {
                'text'   => 'The "default variable" (or "topic variable") is:
',
                'number' => '3'
            }
        },
        {
            'question' => {
                'text'   => 'You can access the command-line arguments of a Perl program via:
',
                'number' => '4'
            },
            'answers'  => [
                {
                    'text'     => '@ARGV
',
                    'checkbox' => '[X]'
                },
                {
                    'checkbox' => '[ ]',
                    'text'     => '$ARGV
'
                },
                {
                    'checkbox' => '[ ]',
                    'text'     => '@ARGS
'
                },
                {
                    'text'     => '@ARG
',
                    'checkbox' => '[ ]'
                },
                {
                    'checkbox' => '[ ]',
                    'text'     => '@_
'
                }
            ]
        },
        {
            'question' => {
                'text'   => 'The main repository for Open Source Perl modules is:
',
                'number' => '5'
            },
            'answers'  => [
                {
                    'checkbox' => '[X]',
                    'text'     => 'CPAN
'
                },
                {
                    'checkbox' => '[ ]',
                    'text'     => 'CSPAN
'
                },
                {
                    'text'     => 'Github
',
                    'checkbox' => '[ ]'
                },
                {
                    'checkbox' => '[ ]',
                    'text'     => 'Perlhub
'
                },
                {
                    'text'     => 'www.perl.org
',
                    'checkbox' => '[ ]'
                }
            ]
        },
        {
            'question' => {
                'text'   => 'The three standard sigils for variable declarations are:
',
                'number' => '6'
            },
            'answers'  => [
                {
                    'text'     => '\'$\' for scalars, \'@\' for arrays, \'%\' for hashes
',
                    'checkbox' => '[X]'
                },
                {
                    'checkbox' => '[ ]',
                    'text'     => '\'$\' for scalars, \'@\' for hashes, \'%\' for arrays
'
                },
                {
                    'checkbox' => '[ ]',
                    'text'     => '\'$\' for scalars, \'@\' for consts, \'%\' for literals
'
                },
                {
                    'text'     => '\'$\' for numeric, \'@\' for emails, \'%\' for percentages
',
                    'checkbox' => '[ ]'
                },
                {
                    'text'     => '\'$\' for lookups, \'@\' for reuses, \'%\' for declarations
',
                    'checkbox' => '[ ]'
                }
            ]
        },
        {
            'answers'  => [
                {
                    'text'     => '\'my\' variables are lexically scoped;  \'our\' variables are package scoped
',
                    'checkbox' => '[X]'
                },
                {
                    'text'     => '\'my\' variables are subroutine scoped; \'our\' variables are block scoped
',
                    'checkbox' => '[ ]'
                },
                {
                    'text'     => '\'my\' variables are compile-time;      \'our\' variables are run-time
',
                    'checkbox' => '[ ]'
                },
                {
                    'text'     => '\'my\' variables must be scalars;       \'our\' variables must be arrays or hashes
',
                    'checkbox' => '[ ]'
                },
                {
                    'text'     => '\'my\' variables are assignable;        \'our\' variables are constants
',
                    'checkbox' => '[ ]'
                }
            ],
            'question' => {
                'text'   => 'The difference between a \'my\' variable and an \'our\' variable is:
',
                'number' => '7'
            }
        },
        {
            'answers'  => [
                {
                    'checkbox' => '[X]',
                    'text'     => '...does not interpolate variables or backslashed escape sequences
'
                },
                {
                    'checkbox' => '[ ]',
                    'text'     => '...only interpolates variables, but not backslashed escape sequences
'
                },
                {
                    'text'     => '...only interpolates backslashed escape sequences, but not variables
',
                    'checkbox' => '[ ]'
                },
                {
                    'checkbox' => '[ ]',
                    'text'     => '...interpolates both variables and backslashed escape sequences
'
                },
                {
                    'text'     => '...converts its contents to ASCII, even if they are Unicode characters
',
                    'checkbox' => '[ ]'
                }
            ],
            'question' => {
                'text'   => 'A single-quoted string (such as: \'I will achieve 100% on this exam\')...
',
                'number' => '8'
            }
        },
        {
            'question' => {
                'number' => '9',
                'text'   => 'The term qq{XXXXX} is...
'
            },
            'answers'  => [
                {
                    'text'     => '...another way of writing the double-quoted string: "XXXXX"
',
                    'checkbox' => '[X]'
                },
                {
                    'checkbox' => '[ ]',
                    'text'     => '...another way of writing the single-quoted string: \'XXXXX\'
'
                },
                {
                    'checkbox' => '[ ]',
                    'text'     => '...another way of writing the list of strings:  (\'X\', \'X\', \'X\', \'X\', \'X\')
'
                },
                {
                    'checkbox' => '[ ]',
                    'text'     => '...another way of writing the array of strings: [\'X\', \'X\', \'X\', \'X\', \'X\']
'
                },
                {
                    'text'     => '...a call to the \'qq\' function, passing it a block of code
',
                    'checkbox' => '[ ]'
                }
            ]
        },
        {
            'question' => {
                'text'   => 'Which of the following is NOT a single valid Perl number?
',
                'number' => '10'
            },
            'answers'  => [
                {
                    'text'     => '1\'042
',
                    'checkbox' => '[X]'
                },
                {
                    'checkbox' => '[ ]',
                    'text'     => '1042
'
                },
                {
                    'checkbox' => '[ ]',
                    'text'     => '1_042
'
                },
                {
                    'text'     => '1.042e3
',
                    'checkbox' => '[ ]'
                },
                {
                    'checkbox' => '[ ]',
                    'text'     => '0b10000010010
'
                }
            ]
        },
        {
            'answers'  => [
                {
                    'text'     => 'A container for a list
',
                    'checkbox' => '[X]'
                },
                {
                    'text'     => 'Exactly the same thing as a list
',
                    'checkbox' => '[ ]'
                },
                {
                    'checkbox' => '[ ]',
                    'text'     => 'Something that is always contained inside a list
'
                },
                {
                    'checkbox' => '[ ]',
                    'text'     => 'A list with a predeclared fixed number of elements
'
                },
                {
                    'text'     => 'A multidimensional list
',
                    'checkbox' => '[ ]'
                }
            ],
            'question' => {
                'number' => '11',
                'text'   => 'An array is...
'
            }
        },
        {
            'answers'  => [
                {
                    'checkbox' => '[X]',
                    'text'     => '...in all circumstances
'
                },
                {
                    'checkbox' => '[ ]',
                    'text'     => '...only if it controls exactly one statement
'
                },
                {
                    'text'     => '...only if it controls two or more statements
',
                    'checkbox' => '[ ]'
                },
                {
                    'text'     => '...only if the statements it controls include a variable declaration
',
                    'checkbox' => '[ ]'
                },
                {
                    'text'     => '...never; the curly brackets are always optional in an \'if\' statement
',
                    'checkbox' => '[ ]'
                }
            ],
            'question' => {
                'number' => '12',
                'text'   => 'An \'if\' statement requires curly brackets around the statements it controls...
'
            }
        },
        {
            'answers'  => [
                {
                    'checkbox' => '[X]',
                    'text'     => 'elsif
'
                },
                {
                    'checkbox' => '[ ]',
                    'text'     => 'elseif  (with no whitespace between the two words)
'
                },
                {
                    'checkbox' => '[ ]',
                    'text'     => 'else if (with whitespace between the two words)
'
                },
                {
                    'text'     => 'elif
',
                    'checkbox' => '[ ]'
                },
                {
                    'checkbox' => '[ ]',
                    'text'     => 'ormaybe (with no whitespace between the two words)
'
                }
            ],
            'question' => {
                'text'   => 'To specify a second alternative test after an \'if\', the correct keyword is:
',
                'number' => '13'
            }
        },
        {
            'answers'  => [
                {
                    'text'     => '...Perl evaluates as little as required to get a definite answer
',
                    'checkbox' => '[X]'
                },
                {
                    'text'     => '...Perl only evaluates each boolean expression once during the program
',
                    'checkbox' => '[ ]'
                },
                {
                    'checkbox' => '[ ]',
                    'text'     => '...Perl defers evaluating the expression until the result is tested
'
                },
                {
                    'text'     => '...Perl will never execute an \'else\' block
',
                    'checkbox' => '[ ]'
                },
                {
                    'text'     => '...Perl programs can cause CPUs to emit sparks if an expression is too complex
',
                    'checkbox' => '[ ]'
                }
            ],
            'question' => {
                'text'   => '"Short-circuiting" of a boolean expression means...
',
                'number' => '14'
            }
        },
        {
            'answers'  => [
                {
                    'text'     => '...once per element in the list, unless a \'last\' is executed in the block
',
                    'checkbox' => '[X]'
                },
                {
                    'text'     => '...once per element in the list in all circumstances
',
                    'checkbox' => '[ ]'
                },
                {
                    'checkbox' => '[ ]',
                    'text'     => '...endlessly, until a \'last\' is executed in the loop
'
                },
                {
                    'checkbox' => '[ ]',
                    'text'     => '...an unknown number of times, until the list being iterated is empty
'
                },
                {
                    'text'     => '...never, because an array is not a list and cannot be iterated
',
                    'checkbox' => '[ ]'
                }
            ],
            'question' => {
                'number' => '15',
                'text'   => 'A "foreach-style" loop (such as: for (@list) {...}) will be iterated...
'
            }
        },
        {
            'answers'  => [
                {
                    'checkbox' => '[X]',
                    'text'     => '...iterates until its condition is false at the start of an iteration
'
                },
                {
                    'text'     => '...iterates until its condition is true at the start of an iteration
',
                    'checkbox' => '[ ]'
                },
                {
                    'text'     => '...iterates until its condition becomes false anywhere within its block
',
                    'checkbox' => '[ ]'
                },
                {
                    'text'     => '...iterates until its condition becomes true anywhere within its block
',
                    'checkbox' => '[ ]'
                },
                {
                    'checkbox' => '[ ]',
                    'text'     => '...doesn\'t exist; Perl does not have a \'while\' loop
'
                }
            ],
            'question' => {
                'number' => '16',
                'text'   => 'The \'while\' loop in Perl...
'
            }
        },
        {
            'question' => {
                'text'   => 'The keywords for the Perl switch statement are:
',
                'number' => '17'
            },
            'answers'  => [
                {
                    'text'     => '\'given\'  and \'when\'    and \'default\'
',
                    'checkbox' => '[X]'
                },
                {
                    'checkbox' => '[ ]',
                    'text'     => '\'switch\' and \'case\'    and \'else\'
'
                },
                {
                    'checkbox' => '[ ]',
                    'text'     => '\'gather\' and \'take\'    and \'otherwise\'
'
                },
                {
                    'text'     => '\'case\'   and \'of\'      and \'or\'
',
                    'checkbox' => '[ ]'
                },
                {
                    'text'     => '\'whence\' and \'whither\' and \'thither\'
',
                    'checkbox' => '[ ]'
                }
            ]
        },
        {
            'question' => {
                'number' => '18',
                'text'   => 'Which five Perl values are the only values that ever evaluate false?
'
            },
            'answers'  => [
                {
                    'text'     => '0, \'0\', \'\', (), undef
',
                    'checkbox' => '[X]'
                },
                {
                    'text'     => '0, \'0\', \'\', (), []
',
                    'checkbox' => '[ ]'
                },
                {
                    'text'     => '0, \'0\', \'false\', \'False\', \'FALSE\'
',
                    'checkbox' => '[ ]'
                },
                {
                    'checkbox' => '[ ]',
                    'text'     => '0, +0, -0, 0.0, -0.0
'
                },
                {
                    'text'     => 'False, Nil, Null, None, Empty
',
                    'checkbox' => '[ ]'
                }
            ]
        },
        {
            'question' => {
                'text'   => 'If the array @x contains four elements,
    how many elements will be in the list (1, @x, 2)?
',
                'number' => '19'
            },
            'answers'  => [
                {
                    'checkbox' => '[X]',
                    'text'     => 'Six:   because the four array elements will be flattened into the list
'
                },
                {
                    'checkbox' => '[ ]',
                    'text'     => 'Eight: because 1 * 4 * 2 = 8
'
                },
                {
                    'text'     => 'Three: because the array will become a single element within the list
',
                    'checkbox' => '[ ]'
                },
                {
                    'text'     => 'Two:   because Perl ignores non-scalar variables in a list constructor
',
                    'checkbox' => '[ ]'
                },
                {
                    'text'     => 'None:  because it won\'t compile; arrays can\'t be used in list constructors
',
                    'checkbox' => '[ ]'
                }
            ]
        },
        {
            'answers'  => [
                {
                    'checkbox' => '[X]',
                    'text'     => 'Values of any scalar type, indexed by keys that are always strings
'
                },
                {
                    'checkbox' => '[ ]',
                    'text'     => 'Values of any scalar or list type, indexed by keys that are always strings
'
                },
                {
                    'text'     => 'Values that are always strings, indexed by keys of any type
',
                    'checkbox' => '[ ]'
                },
                {
                    'text'     => 'Values that are unique, indexed by keys that may be repeated
',
                    'checkbox' => '[ ]'
                },
                {
                    'text'     => 'Random values, indexed by sequential keys of any type
',
                    'checkbox' => '[ ]'
                }
            ],
            'question' => {
                'text'   => 'A hash variable stores...
',
                'number' => '20'
            }
        },
        {
            'question' => {
                'number' => '21',
                'text'   => 'The expression 1 / \'Inf\' produces the result:
'
            },
            'answers'  => [
                {
                    'text'     => '0 (because that\'s the correct mathematical outcome)
',
                    'checkbox' => '[X]'
                },
                {
                    'checkbox' => '[ ]',
                    'text'     => '1 (as a convenience, to avoid subsequent division by zero)
'
                },
                {
                    'checkbox' => '[ ]',
                    'text'     => 'A non-fatal warning (because \'Inf\' is a string, not a number)
'
                },
                {
                    'text'     => 'A fatal exception (because \'Inf\' is a string, not a number)
',
                    'checkbox' => '[ ]'
                },
                {
                    'checkbox' => '[ ]',
                    'text'     => 'An infinite evaluation loop; the program will run forever
'
                }
            ]
        },
        {
            'answers'  => [
                {
                    'checkbox' => '[X]',
                    'text'     => 'A type-safe immutable pointer to an existing value or variable
'
                },
                {
                    'text'     => 'A mutable pointer to a value or variable, without type-checking
',
                    'checkbox' => '[ ]'
                },
                {
                    'checkbox' => '[ ]',
                    'text'     => 'An alias (i.e. another name) for an existing variable
'
                },
                {
                    'checkbox' => '[ ]',
                    'text'     => 'A deep copy of an existing variable or value
'
                },
                {
                    'text'     => 'A link to the documentation for an existing value or variable
',
                    'checkbox' => '[ ]'
                }
            ],
            'question' => {
                'number' => '22',
                'text'   => 'A "reference" in Perl is best described as:
'
            }
        },
        {
            'question' => {
                'text'   => 'In Perl, you can take references to...
',
                'number' => '23'
            },
            'answers'  => [
                {
                    'text'     => '...scalars, arrays, hashes, and subroutines
',
                    'checkbox' => '[X]'
                },
                {
                    'text'     => '...scalars, arrays, and hashes, but NOT subroutines
',
                    'checkbox' => '[ ]'
                },
                {
                    'checkbox' => '[ ]',
                    'text'     => '...scalars and arrays, but NOT hashes or subroutines
'
                },
                {
                    'text'     => '...arrays and hashes (i.e. containers), but NOT scalars or subroutines
',
                    'checkbox' => '[ ]'
                },
                {
                    'checkbox' => '[ ]',
                    'text'     => '...only scalars (NOT to arrays, hashes, or subroutines)
'
                }
            ]
        },
        {
            'answers'  => [
                {
                    'text'     => '\'sub\'
',
                    'checkbox' => '[X]'
                },
                {
                    'text'     => '\'subroutine\'
',
                    'checkbox' => '[ ]'
                },
                {
                    'text'     => '\'fun\'
',
                    'checkbox' => '[ ]'
                },
                {
                    'text'     => '\'do\'
',
                    'checkbox' => '[ ]'
                },
                {
                    'checkbox' => '[ ]',
                    'text'     => 'Nothing: subroutines are not explicitly declared in Perl
'
                }
            ],
            'question' => {
                'text'   => 'User-defined subroutines are declared with the keyword:
',
                'number' => '24'
            }
        },
        {
            'question' => {
                'text'   => 'Which variable contains the argument with which a subroutine was called?
',
                'number' => '25'
            },
            'answers'  => [
                {
                    'text'     => '@_
',
                    'checkbox' => '[X]'
                },
                {
                    'checkbox' => '[ ]',
                    'text'     => '$_
'
                },
                {
                    'text'     => '@ARGV
',
                    'checkbox' => '[ ]'
                },
                {
                    'text'     => '@ARGS
',
                    'checkbox' => '[ ]'
                },
                {
                    'checkbox' => '[ ]',
                    'text'     => '$ARGV
'
                }
            ]
        },
        {
            'question' => {
                'number' => '26',
                'text'   => 'Which one of the following subroutine declarations correctly declares
    a subroutine that can must be called with at least two arguments
    but which may also be called with more than two arguments?
'
            },
            'answers'  => [
                {
                    'checkbox' => '[X]',
                    'text'     => 'sub two_or_more ($flag, @data)           {...}
'
                },
                {
                    'checkbox' => '[ ]',
                    'text'     => 'sub two_or_more ($data, $flag)           {...}
'
                },
                {
                    'text'     => 'sub two_or_more ($flag, $data = @extras) {...}
',
                    'checkbox' => '[ ]'
                },
                {
                    'checkbox' => '[ ]',
                    'text'     => 'sub two_or_more ($flag, ...)             {...}
'
                },
                {
                    'checkbox' => '[ ]',
                    'text'     => 'sub two_or_more (@flags, @data_set)      {...}
'
                }
            ]
        },
        {
            'question' => {
                'text'   => 'If a user-defined subroutine does not contain a \'return\' statement...
',
                'number' => '27'
            },
            'answers'  => [
                {
                    'text'     => '...it will return the value the last expression it actually evaluates
',
                    'checkbox' => '[X]'
                },
                {
                    'checkbox' => '[ ]',
                    'text'     => '...it will return the value the final statement in its code block
'
                },
                {
                    'text'     => '...it will return \'undef\'
',
                    'checkbox' => '[ ]'
                },
                {
                    'text'     => '...it will throw an exception after executing its final statement
',
                    'checkbox' => '[ ]'
                },
                {
                    'checkbox' => '[ ]',
                    'text'     => '...it will never return and will continue to execute forever
'
                }
            ]
        },
        {
            'question' => {
                'text'   => 'The keyword to throw an exception in Perl is:
',
                'number' => '28'
            },
            'answers'  => [
                {
                    'text'     => '\'die\'
',
                    'checkbox' => '[X]'
                },
                {
                    'text'     => '\'throw\'
',
                    'checkbox' => '[ ]'
                },
                {
                    'text'     => '\'raise\'
',
                    'checkbox' => '[ ]'
                },
                {
                    'text'     => '\'except\'
',
                    'checkbox' => '[ ]'
                },
                {
                    'text'     => '\'exit\'
',
                    'checkbox' => '[ ]'
                }
            ]
        },
        {
            'question' => {
                'number' => '29',
                'text'   => 'How can exceptions be caught and subsequently accessed in Perl?
'
            },
            'answers'  => [
                {
                    'checkbox' => '[X]',
                    'text'     => 'Caught in an \'eval\' block;  accessed via the special $@ variable
'
                },
                {
                    'checkbox' => '[ ]',
                    'text'     => 'Caught in an \'eval\' block\'; accessed via the special $! variable
'
                },
                {
                    'text'     => 'Caught in a \'catch\' block;  accessed via an \'access\' block
',
                    'checkbox' => '[ ]'
                },
                {
                    'checkbox' => '[ ]',
                    'text'     => 'Caught in a \'try\' block;    accessed via the builtin \'eval\' function
'
                },
                {
                    'text'     => 'Exceptions in Perl can\'t be caught or accessed after they\'re thrown
',
                    'checkbox' => '[ ]'
                }
            ]
        },
        {
            'question' => {
                'text'   => 'What is the purpose of the \'use strict\' pragma?
',
                'number' => '30'
            },
            'answers'  => [
                {
                    'checkbox' => '[X]',
                    'text'     => 'It disallows undeclared variables, barewords, and symbolic references
'
                },
                {
                    'text'     => 'It converts all warnings to fatal errors
',
                    'checkbox' => '[ ]'
                },
                {
                    'text'     => 'It disallows package variables (all variables must be declared with \'my\')
',
                    'checkbox' => '[ ]'
                },
                {
                    'text'     => 'It reports all errors using verbose (and harshly worded) error messages
',
                    'checkbox' => '[ ]'
                },
                {
                    'text'     => 'It prevents any construct that might also be valid C code
',
                    'checkbox' => '[ ]'
                }
            ]
        }
    ],
    'header'           => 'Student ID:  [____________]
Family Name: [____________]
First Name:  [____________]

INSTRUCTIONS:

Complete and return this multiple-choice exam
no later than 23:59 CET Monday 23 August 2021.

You may consult any written material you wish
(e.g. the class notes or the recommended textbook),
but you must not consult or collaborate with
any other person.

Complete this exam by placing an \'X\' in the box
beside the single correct answer of each question,
like so:

    [ ] This is not the correct answer
    [ ] This is not the correct answer either
    [ ] This is an incorrect answer
    [X] This is the correct answer
    [ ] This is an irrelevant answer

WARNING: Each question has only one correct answer.
         If two or more boxes are marked with an \'X\',
         the answer will be scored as zero.

________________________________________________________________________________
'
};
