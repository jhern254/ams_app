# Building a Prod-Ready, Robust Shiny Application.
# 
# README: each step of the dev files is optional, and you don't have to 
# fill every dev scripts before getting started. 
# 01_start.R should be filled at start. 
# 02_dev.R should be used to keep track of your development during the project.
# 03_deploy.R should be used once you need to deploy your app.
# 
# 
###################################
#### CURRENT FILE: DEV SCRIPT #####
###################################

# Engineering

## Dependencies ----
## Add one line by package you want to add as dependency
#usethis::use_package( "thinkr" )
usethis::use_dev_package( "bs4Dash" )
usethis::use_dev_package( "DTedit" , remote = "DavidPatShuiFong/DTedit")
usethis::use_package( "readr" )
usethis::use_package( "stringr" )
usethis::use_package( "vroom" )
usethis::use_package( "tools" )



## Add modules ----
## Create a module infrastructure in R/
golem::add_module( name = "name_of_module1" ) # Name of the module
golem::add_module( name = "sidebarMenu" ) # Keep for now, just in case I can abstract later
#golem::add_module(name = "tabItems_menu") # Get rid of. Focus on module screens
golem::add_module( name = "pfr_screen") # naming convention
golem::add_module( name = "pfr_summary_screen") 
golem::add_module( name = "dept_port_screen") 


## Add helper functions ----
## Creates fct_* and utils_*
golem::add_fct( "helpers" ) 
golem::add_utils( "helpers" )
golem::add_fct("data_validation")

## External resources
## Creates .js and .css files at inst/app/www
golem::add_js_file( "script" )
golem::add_js_handler( "handlers" )
golem::add_css_file( "custom" )

## Add internal datasets ----
## If you have data in your package
usethis::use_data_raw( name = "dept_portfolio", open = FALSE ) 

## Tests ----
## Add one line by test you want to create
usethis::use_test( "app" )
usethis::use_test("data_validation")

# Documentation

## Vignette ----
usethis::use_vignette("ams")
devtools::build_vignettes()

## Code Coverage----
## Set the code coverage service ("codecov" or "coveralls")
usethis::use_coverage()

# Create a summary readme for the testthat subdirectory
covrpage::covrpage()

## CI ----
## Use this part of the script if you need to set up a CI
## service for your application
## 
## (You'll need GitHub there)
usethis::use_github()

# GitHub Actions
usethis::use_github_action() 
# Chose one of the three
# See https://usethis.r-lib.org/reference/use_github_action.html
usethis::use_github_action_check_release() 
usethis::use_github_action_check_standard() 
usethis::use_github_action_check_full() 
# Add action for PR
usethis::use_github_action_pr_commands()

# Travis CI
usethis::use_travis() 
usethis::use_travis_badge() 

# AppVeyor 
usethis::use_appveyor() 
usethis::use_appveyor_badge()

# Circle CI
usethis::use_circleci()
usethis::use_circleci_badge()

# Jenkins
usethis::use_jenkins()

# GitLab CI
usethis::use_gitlab_ci()

# You're now set! ----
# go to dev/03_deploy.R
rstudioapi::navigateToFile("dev/03_deploy.R")

