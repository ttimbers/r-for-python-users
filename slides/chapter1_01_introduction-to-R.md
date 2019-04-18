---
title: Loading a tabular dataset
key: 0e8d5b325399aeb0404ead244983e932


---
## Loading a tabular dataset

```yaml
type: TitleSlide
key: c379881859
```

`@lower_third`
name: Tiffany Timbers
title: Instructor

`@script`
The first thing we are going to do is load a dataset into R. Once we get our data into R, we would like to work with it as a data frame object. Data frames exist in Python within the `pandas` package, but if you are not familar with them, you can think of a data frame as a spreadsheet-like object.

The first data set we will work with is in a comma-separated file, or csv, format. There are many functions available in R we could use to load a csv file, but we are going to use `read_csv()` from the `tidyverse` package because it is fast it creates a "special" variant of the base R data frame object with several nice properties we'll discuss in further detail later in the course.

Let's explore how to do this!

---
## Loading a tabular dataset with `read_csv`

```yaml
type: FullSlide
key: e6a95f9ba1
```

`@part1`
- useful for reading comma separated values
- assumptions of `read_csv` {{1}}
    - column names are present 
    - `,` is the delimiter 
    - there are no row/index values in the dataset 



`@script`
`read_csv()` is a function from the `tidyverse` package that is useful for reading the most common type of flat data files, csv's. R's `read_csv()` is almost identical in regards to it's default arguments as Python's `pandas` `read_csv`. 

In it's most basic use case, `read_csv()` expects that column names are present as the first row in the file, that commas are used the delimiter and that there are no row or index values in the dataset.


---
## Loading a tabular dataset with `read_csv`

```yaml
type: FullSlide
key: 0e47bbaef7
```

`@part1`
```{r}
library(tidyverse)
```{{1}}
```{r}
read_csv("state_property_data.csv")
```{{2}}


```
# A tibble: 52 x 5
   state med_income med_prop_val population mean_commute_minutes
   <chr>      <dbl>        <dbl>      <int>                <dbl>
 1 AK         64222       197300     733375                 10.5
 2 AL         36924        94800    4830620                 25.3
 3 AR         35833        83300    2958208                 22.4
 4 AZ         44748       128700    6641928                 20.6
 5 CA         53075       252100   38421464                 23.4
 6 CO         48098       198900    5278906                 19.5
 7 CT         69228       246450    3593222                 24.3
 8 DC         70848       475800     647484                 28.3
 9 DE         54976       228500     926454                 24.5
10 FL         43355       125600   19645772                 24.8
# ... with 42 more rows
```{{3}}

`@script`
Let's now use R's `read_csv()` function to load a csv file that has US state-level property, income and population data from 2015. 

To do this, we first need to load the tidyverse library. We do this using the library function. 

Next we call the `read_csv()` and pass it a single argument, the path to the file - "state_property_data.csv" - as a string. This is the only argument we need to provide for this file because it satisfies the default arguments of the `read_csv` function that we just discussed. Later in the course, we'll learn more about how to deal with files where the default arguments are not appropriate, for example tab separated files or files with no headers.

---
## Assigning value to an object

```yaml
type: TwoColumns
key: 143f09ff45
```

`@part1`
- R Code
    - `x <- 5` is valid and preferred
    - `x = 5` is also valid

`@part2`
- Python Code
    - `x = 5` is valid

`@script`

When we loaded the US state-level property, income and population data in the last slide using `read_csv()`, we did not assign the output of this function to an object, so it was merely printed to the console and not stored anywhere. This is not that useful - what we would like to do is assign the output of the `read_csv()` function, a data frame, to an object so that we can use it later for analysis and visualization. 

To assign value to an object in R, there are two possible ways - using either the assignment symbol or the equals symbol (as is done in Python). From a style perspective, the assignment symbol is prefered and is what we will use in this course. 

Do note however, that the assignment symbol has a very different meaning with function argument definitions and is only used in special cases. In general, we use the equals symbol during function argument definitions.

---
## Assigning value to an object cont'd

```yaml
type: FullSlide
key: f4217bce08
```

`@part1`
```{r}
prop_data <- read_csv("state_property_data.csv")
```{{1}}
```{r}
print(prop_data)
```{{2}}

```
# A tibble: 52 x 5
   state med_income med_prop_val population mean_commute_minutes
   <chr>      <dbl>        <dbl>      <int>                <dbl>
 1 AK         64222       197300     733375                 10.5
 2 AL         36924        94800    4830620                 25.3
 3 AR         35833        83300    2958208                 22.4
 4 AZ         44748       128700    6641928                 20.6
 5 CA         53075       252100   38421464                 23.4
 6 CO         48098       198900    5278906                 19.5
 7 CT         69228       246450    3593222                 24.3
 8 DC         70848       475800     647484                 28.3
 9 DE         54976       228500     926454                 24.5
10 FL         43355       125600   19645772                 24.8
# ... with 42 more rows
``` {{3}}

`@script`

Let's now use the assignment symbol to store the US state-level property, income and population data in a data frame object that we call prop_data.

To preview the prop_data object, we can use the `print()` function.
---
## Let's practice!

```yaml
type: FinalSlide
key: 9f310f0ef2
```

`@script`

Now let's practice creating and assigning objects in R!
