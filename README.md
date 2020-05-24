# Mastermind

Created as part of The Odin Project curriculum.

View on [Github](https://github.com/andrewjh271/mastermind)

### Functionality

*Note: The escape sequences I use to move the cursor and hide lines do not work on the Repl.it sandbox console, but do work on the console-only page. I made a few changes in Repl.it to account for italics and bold text not working. The repo on Github contains the files as they should be.*

Mastermind [rules](https://en.wikipedia.org/wiki/Mastermind_(board_game))

For each move, a red dot will represent a hit of both the correct color and position, and a white dot will represent a hit of the correct color but incorrect position. Duplicate colors are allowed in the four-digit code, but blanks are not.

The program has four settings:

1. Human Codemaker; Human Codebreaker
2. Human Codemaker; Computer Codebreaker
3. Computer Codemaker; Human Codebreaker
4. Computer Codemaker; Computer Codebreaker

The computer codebreaker uses Donald Knuth's [algorithm](https://www.cs.uni.edu/~wallingf/teaching/cs3530/resources/knuth-mastermind.pdf), which guarantees that the correct code will be found in no more than five moves. (The computer follows the rules of the game, in that it does not know which colors of the test patterns the red and white keys correspond to.)

### Thoughts

This was a fun project to work on. The main programming challenges were deciding how to display the gameplay, calculating the red and white keys, and implementing Knuth's algorithm. The hardest part was making sense of his paper, which could have been written more clearly. I still don't understand why he refers to 15 possible red/white combinations. I only count 14, which is also the number listed on [this](https://github.com/nattydredd/Mastermind-Five-Guess-Algorithm) helpful summary. (Knuth acknowledged in the paper that [3, 1] was not a valid red/white score.)

I assumed that I could prune from the Set of remaining possibilities the current move after finding it, although Knuth does not say to do this and in fact his numbers describing remaining possibilities reflect that he did not. I don't know why the current move should be kept in the Set, but I found one case (3, 1, 1, 5), where this is the difference between finding the code in six or five moves.

 In working on this project I became familiar with some command line escape codes, and decided to make a module for them.

-Andrew Hayhurst