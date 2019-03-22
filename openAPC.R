# small R script to calculate means of APC over time from the openAPC initiative

URL <- "https://raw.githubusercontent.com/OpenAPC/openapc-de/v3.54.0/data/apc_de.csv"
apc <- read.csv(URL, header = TRUE , encoding = "UTF-8")
apc_OA <- apc[apc$is_hybrid == FALSE & apc$institution != "Marburg U", ] 	#remove hybrid OA & APCs from Marburg
apc_DFG <- apc_OA[apc_OA$euro > 0 & apc_OA$euro <= 2000, ] #remove APC <= 0 and > 2000 Euro
meanPerYear.t <- tapply(apc_DFG$euro, apc_DFG$period, mean)
print(round(meanPerYear.t))
boxplot(euro ~ period, data = apc_DFG)
