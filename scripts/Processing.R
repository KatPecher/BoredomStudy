# Script to process the data from raw into usable format in processed folder

# Author: Katja Pecher
# Created: 19.07.2026
  # Last modified: 19.07.2026

# Create reference for subject IDs ----
trialorder <- import("data/raw/Boredom Balance TrialOrder.xlsx")
#delete stray value at end of table and shrink to actual values
trialorder[dim(trialorder)[1],dim(trialorder)[2]] <- NA
trialorder <- trialorder [rowSums(!is.na(trialorder)) > 0,
  colSums(!is.na(trialorder)) > 0] 

# Limesurvey ====
ls_raw <- import("data/raw/20260713_results-survey665152.csv")
ls_proc <- ls_raw

# Fix missing and missspelled subject IDs
ls_proc[ls_proc$Versuchspersonencode == "AN", "Versuchspersonencode"] <- "AN07IE11"
trialorder[trialorder$`Subject ID` == "DI16UB31", "Subject ID"] <- "DI16ÜB31"
trialorder[trialorder$`Subject ID` == "D011ÜB30", "Subject ID"] <- "DO11ÜB30"

# Filter limesurvey data for the subject IDs in trialorder to reduce to only the subjects included
IDs <- c(trialorder$`Subject ID`)
ls_proc <- ls_proc[ls_proc$Versuchspersonencode %in% IDs,]

# Save processed limesurvey data to processed folder
export(ls_proc, "data/processed/Limesurvey.xlsx")


