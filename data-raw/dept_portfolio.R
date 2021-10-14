## code to prepare `dept_portfolio` dataset goes here
library(readr)
library(dplyr)

# read in csv
pfr <- read_csv("./pfr_clean_db.csv")
str(pfr)

dept_portfolio_data <- pfr %>% 
    select(last_name, first_name, project_id, proj_status, award_number,
            proj_title, proj_end_date, proj_balance)
write_csv(dept_portfolio_data, "./dept_portfolio_data.csv")


usethis::use_data(dept_portfolio_data, overwrite = TRUE, internal = TRUE)
