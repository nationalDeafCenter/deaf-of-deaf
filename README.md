## Replicating findings in "Deaf of Deaf"

### Data

The analysis data (a large file) are available on Google Drive from [this link](https://drive.google.com/file/d/1Mf6wMN5EVozh5Ek3wfbcdZgq8QGlWiCB/view?usp=sharing). 

They were originally downloaded from [IPUMS USA](https://usa.ipums.org/usa/). The sample is the 2015-2019 5-year ACS data and the included variables and other details can be found [here](documentation/codebook.txt).

Save them in a subfolder called "data."

### Running the code

In `R` you will first need to install the packages `tidyverse`, `knitr`, and, optionally, `rmarkdown`.

To generate the `dataMethodResults.md` run:

```
knitr::knit("dataMethodResults.Rmd")
```

To generate the .docx version, run:

```
rmarkdown::render("dataMethodResults.md")
```
or just use pandoc.

We are always interested in feeback or criticism--please feel free to contact me (Adam) or the other authors.
