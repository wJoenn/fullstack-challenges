## Background & Objectives

The `Slice` type is one of the three main structures used to store and access data in Go (the others being `Array` and `Map`)

A slice is ordered, so each element can be accessed by its **index**. This exercise will help you understand how to create a slice, how to store data in it, and finally, how to retrieve that data using the index. Remember, slice indexes start at `0`, not `1`.

Programmers are often asked to sort things, that's why you should read about some [sorting algorithms](http://en.wikipedia.org/wiki/Sorting_algorithm).

## Specs

- Implement a `wagonSort` method which takes one argument, an slice of student names (`String`), and returns an slice of those student names sorted alphabetically.
- The sorting method should be case insensitive, e.g. put `bob` before `Felix` (look at the [ASCII table](http://www.asciitable.com/))
- The method should keep the original spelling of the names.

### Interactive Program

Open the `main.go` file and make sure to use the `wagonSort` method. The interface should have a properly stylized output. The names should be separated by commas (`, `) except for the last two that must be separed by the word `and`. The names should also be on a new line.

It should work like this:

```bash
go run main.go

Type a student name:
felix
Type another student name or press enter to finish:
Cedric
Type another student name or press enter to finish:
bob
Type another student name or press enter to finish:

Congratulations! Your Wagon has 3 students:
bob, Cedric and felix # Notice the proper word separation.
```
