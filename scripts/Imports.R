# Script to import datafiles and packages, latter can be loaded with /scripts/Packages.R

# Author: Katja Pecher
# Created: 13.07.2026
  # Last modified: 13.07.2026

# Import files ====
rio::import("data/raw/Limesurvey/")

# Install pacakges ====
install.packages("dplyr")
install.packages("tidyr")
install.packages("rio")
install.packages("ggplot2")
install.packages("lubridate")
