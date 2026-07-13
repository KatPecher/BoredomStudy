## BoredomStudy
Welcome, this is a positron environment for the boredom study to work with for the analysis.

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
        