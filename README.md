# Connect 4


this was a considerable a journey and unexpectedly harder that what you would expect at first glance. 

The diagonal algorithm was developed externally and therefore its testing isnt tied to the official TDD expected in this project. everything else can be overviewed in the 
documentation and its related tests.



## DOCUMENTATION

## MODULES

### Game

    Description: Manages the game flow, including player turns, user input, and win conditions.
    Related Modules: Depends on Player, Grid, and Logic.

### Player

    Description: Represents a player in the game, storing their name and symbol (e.g., 'X' or 'O').
    Related Modules: Used by Game.

### Grid

    Description: Handles the game grid, including construction of the UI and position logic.
    Related Modules: Utilizes Player for symbols.

### Logic

    Description: Contains the game logic, such as checking for win conditions.
    Related Modules: Used by Game.

### MathFun

    Description: Provides mathematical functions used for game logic, such as modular arithmetic and coordinate transformations.
    Related Modules: Used by Logic for calculations related to win conditions.

