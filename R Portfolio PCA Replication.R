# ============================================================
# PORTFOLIO ANALYSIS USING PCA
# R REPLICATION
# ============================================================


# ------------------------------------------------------------
# 1. INSTALL AND LOAD PACKAGES
# ------------------------------------------------------------

install.packages(c("quantmod", "PerformanceAnalytics"))

library(quantmod)
library(PerformanceAnalytics)


# ------------------------------------------------------------
# 2. DEFINE STOCK TICKERS
# ------------------------------------------------------------

tickers <- c(
  "HDFCBANK.NS",
  "ICICIBANK.NS",
  "RELIANCE.NS",
  "TCS.NS",
  "INFY.NS",
  "ITC.NS",
  "LT.NS",
  "BHARTIARTL.NS",
  "SUNPHARMA.NS",
  "MARUTI.NS",
  "HINDUNILVR.NS",
  "ADANIPORTS.NS"
)


# ------------------------------------------------------------
# 3. DOWNLOAD STOCK PRICE DATA
# ------------------------------------------------------------

getSymbols(
  tickers,
  src = "yahoo",
  from = "2021-01-01",
  auto.assign = TRUE
)


# ------------------------------------------------------------
# 4. EXTRACT ADJUSTED CLOSING PRICES
# ------------------------------------------------------------

prices <- do.call(
  merge,
  lapply(
    tickers,
    function(x) Ad(get(x))
  )
)


# ------------------------------------------------------------
# 5. CALCULATE DAILY RETURNS
# ------------------------------------------------------------

returns <- na.omit(
  Return.calculate(prices)
)


# Rename columns
colnames(returns) <- c(
  "HDFC_Bank",
  "ICICI_Bank",
  "Reliance",
  "TCS",
  "Infosys",
  "ITC",
  "L&T",
  "Bharti_Airtel",
  "Sun_Pharma",
  "Maruti",
  "HUL",
  "Adani_Ports"
)


# ------------------------------------------------------------
# 6. PRINCIPAL COMPONENT ANALYSIS (PCA)
# ------------------------------------------------------------

pca_model <- prcomp(
  returns,
  scale. = TRUE
)


# PCA summary
summary(pca_model)


# ------------------------------------------------------------
# 7. VARIANCE EXPLAINED
# ------------------------------------------------------------

variance_explained <- (
  pca_model$sdev^2 /
    sum(pca_model$sdev^2)
)

print(variance_explained)


# ------------------------------------------------------------
# 8. PCA LOADINGS
# ------------------------------------------------------------

loadings <- pca_model$rotation

print(loadings)


# ------------------------------------------------------------
# 9. PLOT VARIANCE EXPLAINED
# ------------------------------------------------------------

plot(
  variance_explained,
  type = "b",
  main = "PCA Variance Explained",
  xlab = "Principal Component",
  ylab = "Proportion of Variance"
)


# ------------------------------------------------------------
# 10. EQUALLY WEIGHTED PORTFOLIO RETURNS
# ------------------------------------------------------------

portfolio_returns <- xts(
  rowMeans(returns),
  order.by = index(returns)
)


# ------------------------------------------------------------
# 11. PORTFOLIO PERFORMANCE STATISTICS
# ------------------------------------------------------------

print(
  table.AnnualizedReturns(
    portfolio_returns
  )
)


# ------------------------------------------------------------
# 12. SHARPE RATIO
# ------------------------------------------------------------

risk_free_rate <- 0.065

daily_rf <- (1 + risk_free_rate)^(1/252) - 1

sharpe_ratio <- SharpeRatio.annualized(
  portfolio_returns,
  Rf = daily_rf
)

print(sharpe_ratio)
)

# ------------------------------------------------------------
# 13. SAVE RESULTS
# ------------------------------------------------------------

dir.create("R_results", showWarnings = FALSE)


write.csv(
  variance_explained,
  "R_results/variance_explained_R.csv"
)


write.csv(
  loadings,
  "R_results/PCA_loadings_R.csv"
)


write.csv(
  as.data.frame(portfolio_returns),
  "R_results/portfolio_returns_R.csv"
)