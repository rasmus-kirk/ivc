---
title: Introduction
date: YYYY-MM-DD
---

- Motivation
- Prerequisites:
  - from0k2bp: https://github.com/AdamISZ/from0k2bp/blob/master/from0k2bp.pdf
  - Commitment Schemes and ZK-Protocols: https://cs.au.dk/~ivan/ComZK06.pdf
  - On Sigma-protocols: https://cs.au.dk/~ivan/Sigma.pdf
- Suggested Reading:
  - PCP1: https://cdn.consensys.io/uploads/2022/10/07104658/a_gentle_introduction_to_the_pcp_theorem_part_1.pdf
  - PCP1': https://consensys.io/blog/a-not-so-gentle-introduction-to-the-pcp-theorem-part-1
  - PCP2: https://cdn.consensys.io/uploads/2022/10/07104709/a_gentle_introduction_to_the_pcp_theorem_part_2.pdf
- Outline
  - PLONK
  - Pasta: Cycles of Curves
  - Halo(2)
  - Verifiable Computation
  - Incrementally Verifiable Computation

This is the first part in a series on Incrementally Verifiable Computation
(IVC). The current most common use for IVC is in blockchains where it tries
to address the issue of the ever-growing size of blockchains leading to
large requirements for node runners.

But before getting into IVC, I will start by introducing PLONK
($\mathcal{P}\mathfrak{lon}\mathcal{K}$).
