testthat::test_that("Incorrect - this is a valid way to store a data frame object read in from read_csv to an object in R.", {
    expect_equal(answer_02, 3)
})
print("Correct! This is not a valid way to store a data frame object read in from `read_csv`, the assignment symbol is pointing in the wrong direction.")
