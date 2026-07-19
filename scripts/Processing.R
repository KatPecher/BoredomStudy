# Script to process the data from raw into usable format in processed folder

# Author: Katja Pecher
# Created: 19.07.2026
  # Last modified: 19.07.2026

# Create reference for subject IDs ====
# Import subject documentation used during project
randomization_order <- import("data/raw/Randomization Order.csv")

# Manually remove the subject, where two out of three measures failed based on documentation
randomization_order <- randomization_order[randomization_order$`Participant ID` != "DO13UE03",]

# Fix missing or misspelled subject IDs and remove Umlaute based on IDs used in PsychoPy
randomization_order[randomization_order$`Participant ID` == "D011ÜB30", "Participant ID"] <- "DO11UB30"


# Limesurvey ====
# Import the raw file and create a copy to process
ls_raw <- import("data/raw/20260713_results-survey665152.csv")
ls_proc <- ls_raw

# Fix missing and missspelled subject IDs
ls_proc[ls_proc$Versuchspersonencode == "AN", "Versuchspersonencode"] <- "AN07IE11"

# Filter limesurvey data for the subject IDs in trialorder to reduce to only the subjects included
IDs <- c(randomization_order$`Participant ID`)
ls_proc <- ls_proc[ls_proc$Versuchspersonencode %in% IDs,]

# Save processed limesurvey data to processed folder
export(ls_proc, "data/processed/Limesurvey.xlsx")


