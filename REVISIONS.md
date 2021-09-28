# Revisions

This document provides a roadmap of features and changes this project could undergo given more time

## Game Model

The Game model could use a `#simulate` or `#run` method that would allow the game to run until a certain generation or stop when the board is barren. The user would be able process results with queries such as `game.total_generations`

Allow a game to be created via a `Config` model. This could allow more flexibility in creating a game from previous data or generating a random world of a specific size.

Add the ability to generate random games based on sizing constraints.

## Cell Model

Utilizing enums to allow more flexibility in creating Cells via symbols. ie. `Cell.new(:adult)`. Although there are helper methods such as `dead?`, or `newborn?` the `Cell#age` method's current Integer value is not human friendly to read. It might be nice to add a method such as `#age_sym` to return the Symbol equivalent of the current age.

Swap the concept of a `:dead` cell for an `:empty` cell which is more accurate to the Cell's state.

## CLI Parser

A proper CLI Parser would allow a user to query the program passing in configuration constraints. This would make running multiple simulations from the command line and potentially piping the results to other programs possible.

## Tests and Linter

The test suite has good coverage however there are gaps in the testing that could use more robust tests, especially around cell mutations.

Add Rubcop with some style preferences to ensure consistency in the code.
