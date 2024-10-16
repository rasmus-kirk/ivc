---
title: PLONK Part 1
date: YYYY-MM-DD
---

PLONK is a so called general-purpose zero-knowledge
proof scheme. This means that, given any solution to an
[NP-problem](https://en.wikipedia.org/wiki/NP_(complexity)), it will produce
a ZK-proof that you know the solution to said NP-problem. More concretely,
imagine that Alice has a sudoko problem $x$:

![The sudoku problem in question](sudoku.svg){ width=50% }

She claims to have a solution to this problem ($w$), and want to convince
Bob without showing him. She could then use PLONK to create a ZK-proof to
convince Bob. To do this she must first encode the sudoku verifier as a
circuit $f_x$, and then give PLONK $f_x(w, w')$ where $w'$ is a public input. Since
there is no public input for this specific circuit, we can let it be
empty. Finally she can send this proof to Bob along with the public sudoku
verifying circuit, and he can check the proof and be convinced.

The important thing is that this will work over any NP-comlete problem. PLONK
also has the following other properties that make it ideal for implementation:

1. It allows for customly built optimized gates
2. It's composable allowing stricter cryptographic assumptions at the cost of performance

PLONK has the following key components:

1. Arithmetization

## Arithmetization


