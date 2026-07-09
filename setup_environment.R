# KeyStat Solutions Blog - R Environment Setup Script
# This script demonstrates how to set up the environment for working with ksTFL examples
# Run this in RStudio or from R console

# Install required packages
packages_to_install <- c(
  "rmarkdown",      # For R Markdown support
  "knitr",          # For code knitting
  "tidyverse",      # Data manipulation (dplyr, ggplot2, etc.)
  "tibble",         # Modern data frames
  "gt",             # Great tables (alternative table rendering)
  "flextable"       # Flexible tables (alternative table rendering)
)

# Install missing packages
missing_packages <- setdiff(packages_to_install, rownames(installed.packages()))
if (length(missing_packages) > 0) {
  message("Installing missing packages: ", paste(missing_packages, collapse = ", "))
  install.packages(missing_packages)
}

# When ksTFL is published, install with:
# remotes::install_github("keystat-solutions/ksTFL")

# Load core packages
library(tidyverse)
library(tibble)

message("\n✓ R environment setup complete!")
message("\nNext steps:")
message("1. Install ksTFL when available:")
message("   remotes::install_github('keystat-solutions/ksTFL')")
message("2. Run 'quarto preview' in terminal to see blog locally")
message("3. Create new posts in posts/YYYY-MM-DD-title/ folders")
message("\n📖 Read README.md for complete workflow instructions")
