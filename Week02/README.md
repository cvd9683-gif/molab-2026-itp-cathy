# Week 02

## ascii art playground

[`NYCSkyline.playground`](./NYCSkyline.playground) draws a New York skyline at night with stars, a crescent moon, and shooting stars.

Based on the techniques in [02-Ascii-Play](https://github.com/molab-itp/02-Ascii-Play):

- each piece of art is a text file in [`Resources`](./NYCSkyline.playground/Resources) (`sky`, `empire`, `chrysler`, `tall`, `short`)
- `load()` reads a file and splits it into lines
- `combine()` glues two pieces side by side, line by line
- a for-loop glues all the buildings into one skyline

Open it in Xcode and press **Cmd-Shift-Y** to see the output in the console.
