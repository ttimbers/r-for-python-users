---
title: Creating Visualizations in R
key: a4df96813155925d15404e3a3dd4fb84


---
## Creating Visualizations in R

```yaml
type: TitleSlide
key: 08af5177a6
```

`@lower_third`
name: Tiffany Timbers
title: Instructor

`@script`
Creating data visualizations is an essential piece to any data analysis. For the remainder of Chapter 1, we will learn how we can use some of the `tidyverse` functions to make visualizations to explore the relationship between median household income and median propery value across US states, as well as how this relates to which party each state voted for in the 2016 US election. 


---
## Using `ggplot` to create a scatter plot

```yaml
type: FullSlide
key: b1b6623613
```

`@part1`
```{r}
print(prop_data)
```

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
```


`@script`
First, take another look at the dataset we have been focusing on - the US state-level property, income and population data from 2015. We can see that there is a row/observation for each state. And the two variables we are interested in visualizing, median household income and median property value, are each in separate columns - thus the data are what we call a tidy data format. This is really important for `ggplot()` and many of the other `tidyverse` functions (as you will learn more in later chapters). 



---
## Using `ggplot` to create a scatter plot

```yaml
type: FullSlide
key: 48e3a36983
```

`@part1`

```{r}
ggplot(prop_data, aes(x = med_income, y = med_prop_val)) +
    geom_point()
``` {{1}}

![](https://assets.datacamp.com/production/repositories/1668/datasets/9fc6441cf80caa596ed63563745e18d857596f07/prop_val_vs_income.png) {{2}}

`@script`
To create a scatter plot of these two variables using `ggplot()`, we would do the following: 

1. call the `ggplot()` function
2. provide the name of the data frame as the first argument
3. call the aesthetic function to map a column to the x-axis and a column to the y-axis
4. add a "+" symbol at the end of the `ggplot()` call to add a layer to the plot
5. call the `geom_point()` function to tell R that we want to represent the data points (which we passed to the aesthetic function) as dots/points to create a scatter plot.


---
## Formatting ggplot objects

```yaml
type: FullSlide
key: 1dc3d3de4a
```

`@part1`
```{r}
ggplot(prop_data, aes(x = med_income, y = med_prop_val)) +
    geom_point() +
    xlab("Income (USD)") +
    ylab("Median property value (USD)")    
```

![](https://assets.datacamp.com/production/repositories/1668/datasets/700580630077b423bc4b940d2c8d07953c06359e/prop_val_vs_income_human_labs.png)

`@script`
To format, or change an aspect of your `ggplot()` object, one common and easy way to do this is to add additional layers to your plot object using the + symbol. Here we use the `xlab()` and `ylab()` functions to add layers where we specify the labels for the x and y axis, respectively. There are many more layers we can add to format the plot further, and we will explore these in later chapters.

---
## Coloring points by group

```yaml
type: FullSlide
key: 204d32c9d8
```

`@part1`
```{r}
library(tidyverse)
```{{1}}
```{r}
prop_data <- read_csv("data/state_property_data.csv")
vote_data <- read_csv("data/2016_presidential_election_state_vote.csv")
```{{2}}
```{r}
combined_data <- prop_data %>% 
  filter(state != "PR") %>% 
  left_join(vote_data)
```{{3}}
```{r}
ggplot(combined_data, aes(x = med_income, y = med_prop_val, color = party)) +
  geom_point() +
  xlab("Income (USD)") +
  ylab("Median property value (USD)")
```{{4}}

`@script`
Another common thing to do with scatter plots is to colour points by a group/category in the dataset. For example, if we combine our US state-level property, income and population data with the dataset of which party each state voted for in the 2016 US presidential election, we can colour the points in our previous scatter plot to represent who each stated voted for. In this example, we'll walk through code to accomplish this from loading the dataset to creating a visulazation. We will then take a look at the code required to do the same task in Python.

First, we load the `tidyverse` library.

Second, we read the data into variables. Here we call the US state-level property, income and population data "prop_data" and the state-level 2016 US presidential election data "vote_data".

Third, we create a new object called "combined_data" that we make by piping prop_data into the `filter()` function to remove the territory of PR (because they do not vote in the presidential election), and then we pipe that resultant dataframe to left_join to combine this dataset with the state-level 2016 US presidential election data.

Finally, we use `ggplot()` to visualize this combined dataset as a scatter plot. We colour each point by the party they voted for in the 2016 US presidential election by adding another argument to our `aes()` function in our `ggplot()` call: color = party.


---
## Coloring points by group

```yaml
type: FullSlide
key: 6441981eda
```

`@part1`
![](https://assets.datacamp.com/production/repositories/1668/datasets/d8fe08545f7b9351227c82bc0cccd2e76cf401d9/prop_val_vs_income_by_party.png)

`@script`
This is what the plot looks like.


---
## Coloring points by group

```yaml
type: FullSlide
key: 6441981eda
```

`@part1`
![](https://assets.datacamp.com/production/repositories/1668/datasets/d8fe08545f7b9351227c82bc0cccd2e76cf401d9/prop_val_vs_income_by_party.png)

`@script`
This is what the plot looks like.

---
## Compare R to Python

```yaml
type: FullCodeSlide
key: f237c8c53e
code_zoom: 50
```

`@part1`
```{r}
# R
library(tidyverse)

prop_data <- read_csv("data/state_property_data.csv")
vote_data <- read_csv("data/2016_presidential_election_state_vote.csv")

combined_data <- prop_data %>% 
  filter(state != "PR") %>% 
  left_join(vote_data)
  
ggplot(combined_data, aes(x = med_income, y = med_prop_val, color = party)) +
  geom_point() +
  xlab("Income (USD)") +
  ylab("Median property value (USD)")
```

```{python}
# Python
import pandas as pd
import numpy as np
import matplotlib.pyplot as plt

prop_data = pd.read_csv("data/state_property_data.csv", index_col=None)
vote_data = pd.read_csv("data/2016_presidential_election_state_vote.csv", index_col=None)

combined_data = prop_data.join(vote_data)
combined_data = combined_data[combined_data.state != 'PR']


combined_data = combined_data.groupby('party')

fig, ax = plt.subplots()
for name, group in combined_data:
    ax.plot(group.income, group.median_property_value, marker='o', linestyle='', ms=5, label=name)
ax.legend()
ax.set_xlabel("Income (USD)")
ax.set_ylabel("Median property value (USD)")
plt.show()
```

`@script`

Now you can see here that in relatively few lines of code we are able to create an entire data science workflow.

---
## Let's practice!

```yaml
type: FinalSlide
key: 147a0a9f06
```

`@script`

Time to put this into practice.
