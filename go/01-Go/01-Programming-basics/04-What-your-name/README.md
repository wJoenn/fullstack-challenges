## Specs

### Compute name

- Implement the `ComputeName` method defined in the `name/compute_name.go` file. Given the `firstName`, `middleName` and `lastName`, it should return the full name of the person.

### Interactive Program

The `main.go` file contains a program to interact with a user. Try it now with:

```bash
go run main.go
```

Then, assuming you have entered "Boris" then "Alexandre" and finally "Papillard", the program should print a custom message like `Hello, Boris Alexandre Papillard!`.

- **constraint**: of course, your `main.go` program should use the `ComputeName` method defined in the other file.
- **enhancement**: you can improve your `custom_message` by adding other information like the number of characters in your full name (for instance, `Boris Alexandre Papillard has got 25 characters, including spaces`), or other very important details...
