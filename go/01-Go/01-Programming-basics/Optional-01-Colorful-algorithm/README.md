## Specs

We want you to write a method `isColourful` which takes a number as argument and return true if the number is **colorful**, false otherwise.

A colorful number is a number where all the products of consecutive subsets of digit are different.

For this exercise, only consider numbers with up to **3** digits (not more).

Example:

- `263` is a colorful number because (2, 6, 3, 2x6, 6x3, 2x6x3) are all different
- `236` is not because (2, 3, **6**, **2x3**, 3x6, 2x3x6) have 6 twice
