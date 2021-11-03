---
title: "Deaf-of-Deaf: Data Methods & Results"
author: "Adam C Sales"
date: '2021-11-03'
output: "word_document"
---








|        | Observed N| Imputed N| Observed %| Imputed %|
|:-------|----------:|---------:|----------:|---------:|
|Hearing |   13439101|   1131500|   92.23436|  7.765637|
|Deaf    |     584817|     40017|   93.59558|  6.404421|


## Data

For this study we used the 2015-2019 five-year public use microdata sample from the American Community Survey (ACS), which was pre-processed by [IPUMS USA](http://usa.ipums.org) (Ruggles, et al. 2020)^[Steven Ruggles, Sarah Flood, Ronald Goeken, Josiah Grover, Erin Meyer, Jose Pacas and Matthew Sobek. IPUMS USA: Version 10.0 [dataset]. Minneapolis, MN: IPUMS, 2020. https://doi.org/10.18128/D010.V10.0 Retrieved 11/03/2021]. 
The ACS is a yearly survey of US households conducted by the US Census Bureau, that aims to include approximately one percent of the US population.
Five-year ACS data is a combination of five one-year datasets; the larger sample size of the five-year datasets allows for more precise statistical estimates.
While the ACS dataset includes individual-level information, data are collected and organized at the household level; hence, the ACS may be used to study population household characteristics. A detailed overview of ACS uses, including the material discussed below, can be found in U.S. Census Bureau (2020a)^[ U.S. Census Bureau (2020), _Understanding and Using American Community Survey Data: What All Data Users Need to Know_, U.S. Government Publishing Office, Washington, DC. [https://www.census.gov/content/dam/Census/library/publications/2020/acs/acs_general_handbook_2020.pdf] accessed 11/01/2021.].



The ACS includes two sets of survey weights for estimating population parameters--one for the population of US households, and one for the population of US individuals. In this study, we use the individual-level weights. These survey weights are designed to account for the complex survey design of the ACS, which entails that different households are randomly sampled with different probabilities, and to account for survey non-response. 
The ACS also includes a set of replication weights to be used in standard error estimation.

Although the ACS sample is intended as a representative sample of the US population, there are a number of sources of error in estimates of population quantities. 
The random sampling design results in "sampling error," which is due to the fact that the data are a random sample of the population, rather than the entire population. The extent of the sampling error can be estimated based on the design of the random sample, and is reflected in the estimated standard errors we provide. 
Like nearly all other surveys, the ACS is subject to non-sampling error as well. This, in turn, has five components. First, coverage error ocurrs if individuals in the population are excluded from the random sample by design--i.e. when subjects have a zero probability of being sampled, or when a person or household has a chance of being selected two or more times in the same sample. The ACS controls coverage error by attempting to ensure a comprehensive samping frame, as well as by comparing ACS-estimated population totals with independent estimates from other sources, and using that comparison to adjust ACS-based population estimates. The coverage rate for the total US population in 2019 (the ratio of the ACS-estimated population to an indepdent estimate) was 92.1%^[[https://data.census.gov/cedsci/table?q=B98012&tid=ACSDT5Y2019.B98012] accessed 11/3/2021]. Second, unit nonresponse occurs when a housing unit does not reply to the survey. The ACS attempts to minimize unit-non-response by allowing three modes of response (internet, mail, and computer-assisted personal interview), repeated mailing, and personal visits from interviewers. The 2015-2019 ACS had a 92.4% response rate for housing units^[[https://data.census.gov/cedsci/table?q=B98021&tid=ACSDT5Y2019.B98021] accessed 11/03/2021.]. Adustments for remaining non-response, based on comparisons with independent estimates, are incorporated into the survey weights (U.S. Census Bureau 2020b)^[U.S. Census Bureau (2020), _American Community Survey
Accuracy of the Data (2019)_, U.S. Government Publishing Office, Washington, DC. [https://www2.census.gov/programs-surveys/acs/tech_docs/accuracy/ACS_Accuracy_of_Data_2019.pdf] accessed 11/01/2021.]. Third, item nonresponse occurs when a response is received from a particular household, but one of the items in the survey is not answered. In this case, the ACS includes imputed responses, estimated based on the observed responses. Finally, measurement and processing error occur when questions are answered incorrectly by the survey respondent or processed incorrectly by Census Bureau staff. A number of procedures are in place to minimize these errors, but some may remain, nevertheless. 

### Data Description

The 2015-2019 ACS sample contains data pertaining to $n=$15,947,624 individuals, including 688,071 deaf individuals and 17,396 deaf children.
For the current study, we exclude people living in group quarters such as prisons, dormatories, or group homes. 
There were 752,189 sampled subjects in group quarters, including a total of 63,237 deaf individuals and  474 deaf children (representing an estimated 8,090,999 people, 602,447 whom are deaf and 3,391 are deaf children in the group quarters population.)
Excluding group quarters leaves a total sample size of 15,195,435 people, including 624,834 deaf people and 16,922 deaf children. 
This sample represents a population total of 316,606,796 people, including 11,325,699 deaf people and 416,471 deaf children.

Approximately 6% of people labeled as "deaf" and 8% of people labeled as "hearing" did not respond to the ACS question about hearing difficulty (i.e. item nonresponse). 
Their deaf status was instead imputed by the ACS.

    
    




The dataset includes 586,104 households with at least one deaf member. 
These represent an estimated 10,222,370$\pm$27,132 such households in the US population.
    
## Methodology

### Definitions:

For the purpose of this study, deafness is defined as a response of "Yes" to the ACS question "Is this person deaf or does he/she have serious difficulty hearing?" We define anyone under the age of 18 as a child, and anyone 18 or older as an adult. 
  
### Inferring relationships



ACS collects one form from each household, filled out by a member of the household, called "Person 1," who responds to questions about each member of the household, including themselves.
One such question is "How is this person related to Person 1?"--that is, Person 1 is asked to list their [nb: how do we do gender? this is the "singular their"] relationship to each other household member.
IPUMS infers family interrelationships within a household using responses to this question, in addition to supplementary information such as subjects' surnames (which IPUMS has access to, but which are not public) and the order in which they are listed in the response form. 
A full description of this process can be found in the [IPUMS User Guide (Chapter 5)](https://usa.ipums.org/usa/chapter5/chapter5.shtml).
Most relationships (approximately 
91%
of inferred father-child and 
88%
of inferred mother-child relationships) were inferred unambiguously, including cases in which Person 1 identifies themselves as the parent or child of someone else in the household. 
The remainder of relationships were inferred following a set of rules, that are themselves based on assumptions regarding typical household structures, surnames, and other factors.


| Person # |   Name*   | Rel. to Person 1 | Age |  Sex   | Mother # | Father # |
|:--------:|:---------:|:----------------:|:---:|:------:|:--------:|:--------:|
|    1     |    Ava    |       Self       | 77  | Female |    -     |    -     |
|    2     | Benjamin  |      Child       | 45  |  Male  |    1     |    -     |
|    3     | Charlotte |    Grandchild    | 10  | Female |    4     |    2     |
|    4     |  Delilah  |   Child-in-law   | 43  | Female |    -     |    -     |

For instance, consider the household in Table ??. Person 1 ("Ava") identified Person 2 ("Benjamin") as her son, Person 3 ("Charlotte") as her grandchild, and Person 4 ("Delilah") as her child-in-law^[These names are made-up for clarity of exposition; they were taken from the [list of most common names](https://www.ssa.gov/cgi-bin/popularnames.cgi) (visited 11/01/2021) for babies born in 2020, provided by the US Office of Social Security.]. Since Benjamin was the only one of Ava's children present, Charlotte was between 15 and 64 years younger than Benjamin, and Benjamin's sex was male, IPUMS listed Benjamin as Charlotte's father. 
This assumption need not always hold--if Ava had other children (who are not members of the same household, and hence not listed), one of them may be Charlotte's father or mother, in which case Benjamin would be Charlotte's uncle, rather than her father. 
Since Delilah was Ava's only child-in-law in the household, and both Delilah and Benjamin were married (not shown here), IPUMS lists Delilah as Benjamin's spouse; since, in addition, Delilah's sex is female, IPUMS lists her as Charlotte's mother.
If other children of Ava's had been in the household, there would have been further ambiguity as to Charlotte's parents; in that case, IPUMS would use surnames, ages, and the order in which Ava listed household members to guess at Charlotte's parentage. 
  
  
### Estimating Population Quantitites

We estimate population quantities--i.e., population totals and percentages--using the person-level weights provided with the ACS data.
These weights are intended to generalize estimates to the 2015-2019 population of individuals across the fifty states and Washington, DC, and that is how we interpret our estimates. 
This interpretation relies on a number of statistical assumptions, including the validity of the procedures that the Census Bureau uses to adjust the sampling weights for survey non-response and impute missing item-level responses, as well as the procedures IPUM uses to identify parentage and other family relationships within a household. 
Violations of these assumptions are impossible to check with available data, and may lead to bias.
However, assumptions of this nature are unavoidable in survey research, and the ACS sample is arguably the highest-quality data available for our purposes. 

We estimate standard errors for population quantities using the 80 replication weights provided in the ACS sample.

### Computation and Replication
The analyses were peformed in R (R Core Team 2021^[R Core Team (2021). R: A language and environment for statistical computing. R Foundation for Statistical Computing, Vienna, Austria. URL [https://www.R-project.org/].]) and replication data and code (in Rmarkdown; Xie 2021^[Yihui Xie (2021). knitr: A General-Purpose Package for Dynamic Report Generation in R. R package version 1.36.], Allaire et al. 2021^[JJ Allaire and Yihui Xie and Jonathan McPherson and Javier Luraschi and Kevin Ushey and Aron Atkins and Hadley Wickham and Joe Cheng and  Winston Chang and Richard Iannone (2021). rmarkdown: Dynamic Documents for R. R package version 2.11. URL [https://rmarkdown.rstudio.com.]]) are available at [https://github.com/nationalDeafCenter/deaf-of-deaf].


## Results



<!-- ############################################################################################################ -->
<!-- #### Questions -->
<!-- ### from https://docs.google.com/document/d/1LbjhZl6ZdEJJMl7wfSLOhn7OYDXLNXvaV7RXCK5_oMo/edit -->

<!-- ## Among deaf children (17 or younger) living in non-institutionalized/group quarters, -->

<!-- ### living with deaf adults: -->
<!-- ## how many of them live with deaf adults 18+? -->
<!-- ## How many live with more than one deaf adult? -->
<!-- ## How many live with at least one deaf parent? -->
<!-- ## How many live with two deaf parents? -->

<!-- ### living with (other) deaf children: -->
<!-- ## how many of them live with other deaf children? -->
<!-- ## How many with more than one other deaf child? -->
<!-- ############################################################################################################ -->



The results of our analysis may be seen in Table ??? and Figure ???.
We estimate that, at any given point in 2015-2019, there were a total of 
416,500 $\pm$ 8,600 deaf children in the US, excluding those living in group quarters.
Of those, 40,000 $\pm$ 2,500 or 9.62 $\pm$ 0.54% lived with at least one deaf parent, 
and 6,860 $\pm$ 1,420 or 1.65 $\pm$ 0.34% lived with two deaf parents.

Considering all adults in the household, including both parents and non-parents, we found that 
54,900 $\pm$ 2,900 or 13.18 $\pm$ 0.59% of deaf children lived in a household with at least one deaf adult, and 
12,150 $\pm$ 1,660 or 2.92 $\pm$ 0.39% lived with at least two. 

Finally, we found that 
39,000 $\pm$ 3,700 or 9.36 $\pm$ 0.81% of deaf children lived in a household with at least one other deaf child, and 
8,150 $\pm$ 1,830 or 1.96 $\pm$ 0.43% lived with at least two other deaf children. 



Table: The numbers (N) and percentages of deaf children outside of group quarters who live with at least 1, exactly 1, or at least 2 deaf parents, deaf adults, or other deaf children, along with standard errors (SE) and sample sizes (n)

|Living with...                            |N/% |Estimate             |SE                 |n      |
|:-----------------------------------------|:---|:--------------------|:------------------|:------|
|TOTAL (non-GQ deaf children)              |N   |416,500              |4,300              |16,922 |
|TOTAL (non-GQ deaf children)              |%   |100.0000000000000000 |0.0000000000000025 |16,922 |
|at least 1 deaf parent                    |N   |40,000               |1,300              |1,566  |
|at least 1 deaf parent                    |%   |9.62                 |0.27               |16,922 |
|exactly 1 deaf parent                     |N   |33,200               |1,100              |1,317  |
|exactly 1 deaf parent                     |%   |7.97                 |0.23               |16,922 |
|exactly 2 deaf parents                    |N   |6,860                |710                |249    |
|exactly 2 deaf parents                    |%   |1.65                 |0.17               |16,922 |
|at least 1 deaf adult                     |N   |54,900               |1,400              |2,209  |
|at least 1 deaf adult                     |%   |13.18                |0.29               |16,922 |
|at least 2 deaf adults                    |N   |12,150               |830                |454    |
|at least 2 deaf adults                    |%   |2.92                 |0.20               |16,922 |
|at least 1 other deaf kid                 |N   |39,000               |1,800              |1,452  |
|at least 1 other deaf kid                 |%   |9.36                 |0.40               |16,922 |
|at least 2 other deaf kids                |N   |8,150                |910                |278    |
|at least 2 other deaf kids                |%   |1.96                 |0.22               |16,922 |
|NOTES:                                    |    |                     |                   |       |
|Year= 2019                                |    |                     |                   |       |
|Excluding deaf children in group quarters |    |                     |                   |       |
|Child: <18; Adult: 18+                    |    |                     |                   |       |
|Denominator for % is all deaf children    |    |                     |                   |       |


![Estimated percentages of deaf children outside of group quarters who live with varying numbers of deaf parents, deaf adults, or other deaf children](figure/plots-1.png)

```
## Saving 7 x 7 in image
```

```
## Error in grid.newpage(): could not open file 'figure/plots-1.png'
```










