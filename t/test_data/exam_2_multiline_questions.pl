my $actual_exam = {
    "HEADER",
    "Student ID:  [____________]\nFamily Name: [____________]\nFirst Name:  [____________]\n\nINSTRUCTIONS:\n\nComplete and return this multiple-choice exam\nno later than 23:59 CET Monday 23 August 2021.\n\nYou may consult any written material you wish\n(e.g. the class notes or the recommended textbook),\nbut you must not consult or collaborate with\nany other person.\n\nComplete this exam by placing an 'X' in the box\nbeside the single correct answer of each question,\nlike so:\n\n    [ ] This is not the correct answer\n    [ ] This is not the correct answer either\n    [ ] This is an incorrect answer\n    [X] This is the correct answer\n    [ ] This is an irrelevant answer\n\nWARNING: Each question has only one correct answer.\n         If two or more boxes are marked with an 'X',\n         the answer will be scored as zero.\n\n",
    "QUESTIONS",
    [
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
                "[X] sub two_or_more (\$flag, \@data)           {...}\n",
                "[ ] sub two_or_more (\$data, \$flag)           {...}\n",
                "[ ] sub two_or_more (\$flag, \$data = \@extras) {...}\n",
                "[ ] sub two_or_more (\$flag, ...)             {...}\n",
                "[ ] sub two_or_more (\@flags, \@data_set)      {...}\n",
            ],
            QUESTION_TEXT => "Which one of the following subroutine declarations correctly declares\n    a subroutine that can must be called with at least two arguments\n    but which may also be called with more than two arguments?\n",
        },
    ],
};