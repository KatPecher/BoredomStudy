

filenames <- list.files("raw/psychopy", pattern="*.csv")

df <- data.frame(filenames)
# initialise empty columns for details

for (fname in filenames){

	fname_list <- str_split(fname, "_")

	df[fname, "Versuchspersonencode"] = fname_list[1]

	if (fname_list[2] == "A" | fname_list[2] == "B"){
		df[df$filename == fname, "A/B"] = fname_list[2]
		df[df$filename == fname, "LB/HB"] = fname_list[3]
		df[df$filename == fname, "Date"] = fname_list[8]
		df[df$filename == fname, "Time"] = fname_list[9]
	}
	else{
		df[df$filename == fname, "A/B"] = fname_list[5]
		df[df$filename == fname, "LB/HB"] = NA
		df[df$filename == fname, "Date"] = fname_list[6]
		df[df$filename == fname, "Time"] = fname_list[7]
	}
}

# Start reading in the actual data from the files and put it in new columns