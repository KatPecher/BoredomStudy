

filenames <- list.files("data/raw/psychopy", pattern = "\\.csv$")

df <- data.frame(filenames)
rename(df, "Filename"="filenames")

for (fname in filenames){

	fname_list <- strsplit(fname, "_")

	df[df$filename == fname, "Subject ID"] <- fname_list[[1]][1]

	if (fname_list[[1]][2] == "A" | fname_list[[1]][2] == "B"){
		df[df$filename == fname, "A/B"] <- fname_list[[1]][2]
		df[df$filename == fname, "LB/HB"] <- fname_list[[1]][3]
		df[df$filename == fname, "Date"] <- fname_list[[1]][8]
		df[df$filename == fname, "Time"] <- fname_list[[1]][9]
	}
	else if (fname_list[[1]][2] == "LB" | fname_list[[1]][2] == "HB"){
		df[df$filename == fname, "A/B"] <- fname_list[[1]][3]
		df[df$filename == fname, "LB/HB"] <- fname_list[[1]][2]
		df[df$filename == fname, "Date"] <- fname_list[[1]][8]
		df[df$filename == fname, "Time"] <- fname_list[[1]][9]
	}
	else{
		df[df$filename == fname, "A/B"] <- fname_list[[1]][5]
		df[df$filename == fname, "LB/HB"] <- NA
		df[df$filename == fname, "Date"] <- fname_list[[1]][6]
		df[df$filename == fname, "Time"] <- fname_list[[1]][7]
	}
}

# Check if needs some renaming, don't think so

# Join dataframe with condition from randomization_order
df <- df %>% 
  left_join(randomization_order %>% select("Participant ID", "order/condition"),
  by = c("Subject ID" = "Participant ID"))

# Reduce to the subjects actually measured
df <- df[df$`Subject ID` %in% IDs,]

# Manually exclude rows that should not be included based on documentation in randomization_order
id_x <- which(df$`Subject ID` == "AN06AN18")[1]
id_y <- which(df$`Subject ID` == "CA04TU11")[2]
df <- df[-c(id_x,id_y),]
remove (id_x, id_y)

# Fill in LB/HB from that other file for all entries where the filename doesn't contain LB/HB
df$`LB/HB`[is.na(df$`LB/HB`)] <- 
	ifelse(
		df$`A/B`[is.na(df$`LB/HB`)] == "A",
		sub("_.*","", df$`order/condition`[is.na(df$`LB/HB`)]),
		sub(".*_","", df$`order/condition`[is.na(df$`LB/HB`)])
	)

# Start reading in the actual data from the files and put it in new columns












# Now sort this into processing.R
