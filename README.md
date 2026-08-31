# FSRM-PCA-Statistical-Risk-Model
PCA-based statistical factor risk model for portfolio risk decomposition, VaR, Expected Shortfall and risk model validation using Python and R.
# PCA-Based Statistical Factor Risk Model for Portfolio Risk Decomposition

## Overview

This project develops a PCA-based statistical factor risk model for a diversified portfolio of Indian equities.

The objective is to identify common statistical drivers of equity returns, estimate factor exposures, decompose portfolio risk into systematic and idiosyncratic components, and evaluate market risk using multiple risk measurement methodologies.

The project was developed as an independent quantitative financial risk modelling project with a focus on Financial Services Risk Management (FSRM).

## Key Objectives

- Develop a PCA-based statistical factor model
- Identify common statistical drivers of portfolio returns
- Estimate security-level factor loadings
- Decompose portfolio risk into systematic and idiosyncratic components
- Calculate Historical VaR
- Calculate Parametric VaR
- Calculate Expected Shortfall
- Calculate Sharpe Ratio
- Calculate Diversification Ratio
- Perform rolling VaR backtesting
- Analyse rolling statistical factor exposures
- Replicate the PCA methodology in R

## Methodology

### 1. Data Collection
Daily equity price data is collected for a diversified portfolio of Indian equities.

### 2. Return Analysis
Daily stock returns are calculated from the price series and used for portfolio and risk analysis.

### 3. PCA-Based Statistical Factor Model
Principal Component Analysis (PCA) is applied to identify orthogonal statistical factors explaining common variation in asset returns.

### 4. Factor Loadings
Security-level factor loadings are estimated to understand the sensitivity of individual assets to the extracted statistical factors.

### 5. Portfolio Risk Decomposition
Portfolio risk is decomposed into systematic risk associated with common factors and idiosyncratic risk associated with individual securities.

### 6. Market Risk Measurement
Historical VaR, Parametric VaR and Expected Shortfall are calculated to evaluate potential portfolio losses.

### 7. Risk Model Validation
Rolling VaR backtesting is performed to evaluate the performance of the market-risk model.

### 8. Portfolio Risk Metrics
The analysis includes Sharpe Ratio, Diversification Ratio and Maximum Drawdown.

## Tools

### Python
- Python
- Pandas
- NumPy
- Scikit-learn
- SciPy
- Matplotlib
- Seaborn
- yfinance

### R
- R
- PCA
- Statistical analysis and risk-model replication

## Key Outputs

- PCA Scree Plot
- Cumulative Variance Explained
- PCA Factor Loadings
- Stock Return Correlation Matrix
- Portfolio Return Distribution
- Historical VaR Backtesting
- Rolling Statistical Factor Exposure
- Portfolio Drawdown
- Portfolio Risk Decomposition
- VaR and Expected Shortfall Comparison
- Final Portfolio Risk Dashboard

## Project Structure

The repository contains the main Python Jupyter Notebook, R replication code, analytical outputs and visualisations.

## Disclaimer

This is an independent academic/quantitative risk modelling project intended for educational and portfolio purposes. It is not a production or regulatory risk model.
