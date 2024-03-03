## Specs

### Compute the age

- Complete the method `AgeInDays` defined in the `age/age_in_days.go` file. This method takes 3 arguments (`day`, `month` and `year`) and should return a `date.PeriodOfDays` which is your age in days (the number of days you've lived on planet Earth).

### Interactive Program

- Once your method `AgeInDays` is correct, we want to use it in `main.go` which runs a command line tool. To launch this program, just run this in your terminal:

```bash
go run main.go
```

You'll see that your program says you are `0 years old`. You must change the code so that the program uses your `AgeInDays` method. Note: it is available in the `main.go` file because we wrote the `import ageInDays/day` command at the beginning of the file.

- **Enhancement**: Are there some repetitive lines of code in `main.go`? Could you refactor those lines and make your code DRY?
