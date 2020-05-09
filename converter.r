#!/usr/bin/env Rscript
##
## Convert xml to csv and json
## 2020 - An Chu

args = commandArgs(trailingOnly = TRUE)

stopifnot(
    "R-4.0.0 required." = R.Version()$major == "4",
    "No arguments provided." = length(args) > 0L,
    "No such file." = file.exists(args[1L]),
    "Permitted ouput format: csv or json." = any(args[2L] == c("csv", "json"))
)

suppressPackageStartupMessages(require(xml2))
suppressPackageStartupMessages(require(jsonlite))

input = args[1L]
ext = args[2L]
output = sub(pattern = "xml", replacement = ext, input)

xml2csv = function(from) {
    doc = read_xml(from)
    ten = xml_text(xml_find_all(doc, "//d1:DVHC//d1:Ten"))
    madvhc= xml_text(xml_find_all(doc, "//d1:DVHC//d1:MaDVHC"))
    cap = xml_text(xml_find_all(doc, "//d1:DVHC//d1:Cap"))
    captren = c(rep_len("", 63), xml_text(xml_find_all(doc, "//d1:DVHC//d1:CapTren")))
    out = data.frame(madvhc, ten, cap, captren)
    out
}

res = xml2csv(from = input)

if (ext == "csv") {
    write.csv(res, file = output, row.names = FALSE, quote = FALSE)
} else {
    json = jsonlite::toJSON(res, pretty = TRUE)
    write(json, file = output)
}
