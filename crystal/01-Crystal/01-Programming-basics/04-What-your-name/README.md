## Specs

### Compute name

- Implement the `compute_name` method defined in the `src/compute_name.cr` file. Given the `first_name`, `middle_name` and `last_name`, it should return the full name of the person.

### Interactive Program

The `src/interface.cr` file contains a program to interact with a user. Try it now with:

```bash
crystal src/interface.cr
```

Then, assuming you have entered "Boris" then "Alexandre" and finally "Papillard", the program should print a custom message like `Hello, Boris Alexandre Papillard!`.

- **constraint**: of course, your `src/interface.cr` program should use the `compute_name` method defined in the other file.
- **enhancement**: you can improve your `custom_message` by adding other information like the number of characters in your full name (for instance, `Boris Alexandre Papillard has got 25 characters, including spaces`), or other very important details...
