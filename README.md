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

## Author

Yannick Huggler

## License

Apache 2.0
