---
title: 'Chapter 1: Analyzing Data in R - a brief vignette'
description:
  "In this chapter we will walk through a brief data analysis from beginning to end in R, highlighting some very key commonalities and differences between the R and Python languages."
prev: null
next: /chapter2
type: chapter
id: 1
---

<exercise id="1" title="Loading a tabular dataset" type="slides">

<slides source="chapter1_01_introduction-to-R">
</slides>

</exercise>

<exercise id="2" title="Using the assignment symbol">

Now, we will practice using the assignment symbol to store a value in a variable in R.

Use the assignment symbol to assign a numeric value of 101 to a variable called `course_number`.

<codeblock id="01_02_01">
</codeblock>

<exercise id="3" title="Valid object assignment in R">

From the list below, identify which is not a valid way to store a data frame object read in from `read_csv` to an object in R. 

1. `data <- read_csv("income_by_county.csv")`

2. `data = read_csv("income_by_county.csv")`

3. `data -> read_csv("income_by_county.csv")`

<codeblock id="01_03_01">
</codeblock>
