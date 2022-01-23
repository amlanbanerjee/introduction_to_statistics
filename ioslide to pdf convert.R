library(rmarkdown)

# simple invocation
render("Chapter 1_2.Rmd", pdf_document())
render("Chapter 1_2.Rmd", pdf_document(latex_engine = "lualatex"))
