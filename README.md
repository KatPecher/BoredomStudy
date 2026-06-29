# BoredomStudy
we set up a positron system for the boredom study to follow along and work in later in the project

This is some new information after setting up the online repo.

---
Github as version control for all the stuff that we change on a regular basis
dvc is a second level of version control for data that we barely touch, like raw data
    given all the data to dvc, the changes thus don't show up at git but still get tracked by dvc (not sure how exactly though)


Folder structure
    Data
        raw - obvious
        processed - modified by scripts
        meta - explanations, codebooks etc

    Figures
        for all the figures you want to save

    Scripts
        Collecting all the scripts in one folder
        Smart to split scripts for different things into several smaller scripts
        