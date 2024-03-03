## Specs

### Compute the age

- Complete the method `age_in_days` defined in the `src/age_in_days.cr` file. This method takes 3 arguments (`day`, `month` and `year`) and should return a `Int` which is your age in days (the number of days you've lived on planet Earth).

### Interactive Program

- Once your method `age_in_days` is correct, we want to use it in `src/interface.cr` which runs a command line tool. To launch this program, just run this in your terminal:

```bash
crystal src/interface.cr
```

You'll see that your program says you are `0 years old`. You must change the code so that the program uses your `age_in_days.cr` method. Note: it is available in the `src/interface.cr` file because we wrote the `require "age_in_days"` command at the beginning of the file.

- **Enhancement**: Are there some repetitive lines of code in `src/interface.cr`? Could you refactor those lines and make your code DRY?
