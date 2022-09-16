my $actual_exam = {
    'header' => 'Student ID:  [____________]
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
',
    'questions' => [
        {
            'question' => {
                'text' => 'If the array @x contains four elements,
    how many elements will be in the list (1, @x, 2)?
',
                'number' => '1'
            },
            'answers' => [
                {
                    'text' => 'Six:   because the four array elements will be flattened into the list
',
                    'checkbox' => '[X]'
                },
                {
                    'text' => 'Eight: because 1 * 4 * 2 = 8
',
                    'checkbox' => '[ ]'
                },
                {
                    'text' => 'Three: because the array will become a single element within the list
',
                    'checkbox' => '[ ]'
                },
                {
                    'text' => 'Two:   because Perl ignores non-scalar variables in a list constructor
',
                    'checkbox' => '[ ]'
                },
                {
                    'text' => 'None:  because it won\'t compile; arrays can\'t be used in list constructors
',
                    'checkbox' => '[ ]'
                }
            ]
        },
        {
            'answers' => [
                {
                    'checkbox' => '[X]',
                    'text' => 'sub two_or_more ($flag, @data)           {...}
'
                },
                {
                    'text' => 'sub two_or_more ($data, $flag)           {...}
',
                    'checkbox' => '[ ]'
                },
                {
                    'text' => 'sub two_or_more ($flag, $data = @extras) {...}
',
                    'checkbox' => '[ ]'
                },
                {
                    'text' => 'sub two_or_more ($flag, ...)             {...}
',
                    'checkbox' => '[ ]'
                },
                {
                    'checkbox' => '[ ]',
                    'text' => 'sub two_or_more (@flags, @data_set)      {...}
'
                }
            ],
            'question' => {
                'text' => 'Which one of the following subroutine declarations correctly declares
    a subroutine that can must be called with at least two arguments
    but which may also be called with more than two arguments?
',
                'number' => '2'
            }
        }
    ],
    'source_file_name' => 'source_file.txt'
};
