# Choices Book Reader

A Ruby program that transforms your terminal into an interactive book reader.
It allows the user/reader to take different paths that might lead to different outcomes.

## The Project
The app uses Ruby to read from an YAML file that holds the "pages" for the book.
Each page has different options that leads to different pages in the book.

## Installation
First things first, you need Ruby installed. The link below provides the step-by-step:

[Ruby - Installation](https://www.ruby-lang.org/en/documentation/installation/)


The easiest way to install the app is to clone the repository to your machine using the command:

```
$ git clone https://github.com/fchagasjr/choices_book_reader.git
```

## Instructions

Even though the book reader can read any YAML file that fits its structure, at this initial point it only includes "The Frog" book.
This book is used for either functionality or test purposes.

To run type `start` at the terminal from inside the app folder:
```
$ start
```

That will open the book from its "cover page":
```
___      _
 |  |_| |_
 |  | | |_
________   _______    _______    ______
|          |      |  |       |  |
|          |      |  |       |  |
|_____     |______|  |       |  |     ___
|          |    \    |       |  |       |
|          |     \   |_______|  |_______|


[o] OPEN THE BOOK

[x] EXIT
```

Simply type the key to execute the move to the chosen page.
In this case, if you type `o` to open the book, the next page would be presented:

```
Welcome to your story! Bad news: You're a frog!
Long story short, a beautiful woman approaches the pond, somehow grabs you and tries to kiss you.

Do you allow her to kiss?

[y] YES
[n] NO

[x] EXIT
```

The `x` option would exit the program and return to the terminal

