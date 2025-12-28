# AI-Assisted Weight Initialization in Neural Networks

## Overview
This project evaluates whether AI-generated advice on neural network weight initialization aligns with theoretical and empirical behavior.

## Experimental Setup
- 3-layer linear neural network: y = W3 W2 W1 x
- Dimensions tested: d = 50, 100, 200
- Initialization strategies:
  - Orthogonal (QR decomposition)
  - Gaussian (σ = 1/√d and σ = 1/d)
  - Uniform initialization

## Results
- Orthogonal initialization perfectly preserves variance and gradient norms
- Gaussian initialization with σ = 1/√d performs well
- Gaussian initialization with σ = 1/d fails due to vanishing gradients
- Uniform initialization closely matches the behavior of scaled Gaussian

## Key Insight
While the AI’s recommendations were mostly correct, one theoretically invalid suggestion was identified through numerical experimentation.

## Technologies
MATLAB

## Reproducibility
All experiments are deterministic with fixed random seeds. See the included scripts to reproduce results.
