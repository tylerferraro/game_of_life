# Game of Life Simulator

| Note: This project was a solution to a technical assessment prompt which can be found in the `docs` directory.

A ruby gem to create a game of life simulation.

## Requirements

- Ruby Version 2.7.2
- Bundler Version 2.2.16
- RubyGems Version 3.2.11

## Getting Started

From the project root you may begin installation and use.

### Installation

`bundle install`

### Running the Project

The `bin` directory contains a `game_of_life` script to run the simulation against the given problem statement which can be found in the `docs/technical-prompt.md` file.

```bash
$ bin/game_of_life
```

This will display the starting board and ending board after 20 generations.

## Running Tests

`bin/rspec`

## Solution

Given a starting Board of:

```
0 0 0 0 0 0 0 0 0 0
0 0 1 1 0 0 0 0 0 0
0 0 0 0 2 0 0 0 0 0
0 0 0 1 2 0 0 0 0 0
0 0 0 0 0 0 0 0 0 0
0 0 1 0 0 0 0 0 0 0
0 2 1 0 0 0 0 0 0 0
0 2 0 0 0 0 0 0 0 0
0 0 0 0 0 0 0 0 0 0
0 0 0 0 0 0 0 0 0 0
```

After 20 Generations the Board would look like:

```
0 0 0 0 0 0 0 0 0 0
0 0 0 0 0 0 0 0 0 0
0 1 1 1 1 1 0 0 0 0
0 3 3 1 3 3 0 0 0 0
0 0 0 0 1 1 2 0 2 0
0 0 3 1 0 0 0 0 0 0
0 0 1 3 0 0 2 0 2 0
0 0 0 1 0 0 0 0 0 0
0 0 0 0 3 3 1 0 0 0
0 0 0 0 1 1 0 0 0 0
```

## Notes

More information on the presented solution, trade offs and other considerations can be found in the `REVISIONS.md`
