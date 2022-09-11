# Introduction to Perl for Programmers - Final Assignment

## About the project

This application was built as part of the final assignment in the FHNW course "Introduction to Perl for Programmers"
taught by Damian Conway.

It contains two main parts:

1. Given a multiple choice exam template (masterfile) containing the correct answers, the `create_exam` script creates
   an exam file, where the correct answers are unchecked and the answers are shuffled.
2. After students have completed the exam using the file created in part 1, the second script `score_exams` should take
   the master file and a list of completed exam files and score each exam. Further improvements include:
    1. Statistics
    2. Fuzzy Matching (Levenstein-Distance)
    3. Identification of possible misconduct

## Usage

### Create Exam Files

```shell
$ ./create_exam.pl help
A command line utitlity for randomizing answers in a set of questions.

Usage
  $ ./create_exam.pl <PATH_TO_MASTER_EXAM_FILE>
Examples
  ./create_exam.pl _short_exam_master_file.txt
```

## Implemented parts

- [x] Part 1a: Randomizing of questions
  - [x] Remove correct answers
  - [x] Randomize order of answers
  - [x] Print each answer with empty checkbox in front of it
  - [x] Write post processed contents in file with format `YYYYMMDD-HHMMSS-<FILENAME>`
- [ ] Part 1b: Scoring of student responses
  - [x] Read file of master and student files
  - [x] Globbing
  - [x] Only one check mark must be checked. Otherwise 0 points will be awarded.
  - [x] If only one check mark is checked and the checked answer is the correct one according to the master exam file, one point will be awarded.
  - [ ] Print out the students file name and the number of correct answers / the number of questions an answer was provided
  - [ ] Report if a question is missing in student's file.
  - [ ] Report if an answer is missing in student's file.
- [ ] Part 2: Inexact matching of questions and answers
  - [ ] Normalization
    - [ ] To Lower Case
    - [ ] Remove stop-words from the text
    - [ ] Remove any sequence of whitespace characters at the start and/or the end of the text
    - [ ] Replace any remaining sequence of whitespace characters within the text with a single space character.
  - [ ] Use levenstein distance
  - [ ] Report any case where a similar but not same string is matched
- [ ] Part 3: Statistics


## Author

Yannick Huggler

## License

Apache 2.0
