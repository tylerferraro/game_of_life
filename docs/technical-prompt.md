# Technical Assessment Prompt

The goal of this project is to create a 2-D cellular automata: a grid of **cells** that exhibits behavior over the course of iterative generations.

Each generation is computed based on the cells in the previous generation. If you are familiar with **Conway’s Game of Life**, this is a very similar concept but with a **different ruleset**.

## Specifications

Cells may be either empty or alive. You may represent empty cells with a `zero` or `null` value.

If cells are alive, they have an integer **age**:

* Newborn: 1
* Adult: 2
* Senior: 3

The **neighbors** of a cell are the eight cells immediately surrounding it.

**Note:** Edge cells only have 5 neighbors, and corners only have 3.

## Game Rules

Each generation, new values are computed for the board based on the following rules:

| Old Cell   | **Rule**                      | **New Cell** | **Comment**  |
| ---------- | ----------------------------- | ------------ | ------------ |
| `:dead`    | Exactly 2 **adult** neighbors | `:newborn`   | Reproduction |
| `:dead`    | All other conditions          | `:dead`      | No change    |
| `:newborn` | >= 5 neighbors                | `:dead`      | Overcrowding |
| `:newborn` | <= 1 neighbor                 | `:dead`      | Isolation    |
| `:newborn` | All other conditions          | `:adult`     | Aging        |
| `:adult`   | >= 3 neighbors                | `:dead`      | Overcrowding |
| `:adult`   | 0 neighbors                   | `:dead`      | Isolation    |
| `:adult`   | All other conditions          | `:adult`     | Aging        |
| `:senior`  | All conditions                | `:dead`      | Aging        |

### Example

Given the following 5x5 board:

| | | | | |
| --- | --- | --- | --- | --- |
| 0 | 0 | 1 | 0 | 0 |
| 0 | 0 | 1 | 1 | 0 |
| 0 | 2 | 2 | 1 | 0 |
| 0 | 0 | 0 | 1 | 0 |
| 0 | 0 | 0 | 0 | 0 |

After 1 generation becomes:

| | | | | |
| --- | --- | --- | --- | --- |
| 0 | 0 | 1 | 0 | 0 |
| 0 | 0 | 1 | 1 | 0 |
| 0 | 2 | 2 | 1 | 0 |
| 0 | 0 | 0 | 1 | 0 |
| 0 | 0 | 0 | 0 | 0 |

**Reasons:**

- Three newborns are born near the pair of adults at (1, 2) and (2, 2).
- One of the adults has 2 neighbors and ages. The other has 5 neighbors and dies of overcrowding.
- The newborn at (2, 1) dies of overcrowding.
- All other newborns grow up to become adults.

## Test Cases

Example test cases are provided in:

`docs/test-case-examples.md`

### Final Question

In the following 10x10 board is Generation 1.

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

What is Generation 10?


