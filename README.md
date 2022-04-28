# README

### Build & Deployment Status
**Circle CI, main branch status:** 
[![CircleCI](https://circleci.com/gh/penvarict/CS3300/tree/main.svg?style=svg)](https://circleci.com/gh/penvarict/CS3300/tree/main) 

### Application Configurations
Ruby Version 2.7.0. 


* Database Management
This app takes advantage of the rails Object Relational Mapping (ORM) feature to act as a interface layer between SQLite and the software. To update schema, run `rake db:migrate`. 

* How to run the test suite
This project utilizes Rspec with Capybara built in. To manually run the Rspec test, run `bundle exec rspec `. 

* Services (job queues, cache servers, search engines, etc.)
There are virtually no services (or microservices) for this app. There are various DevOps tools integrated here. CircleCI integrates with Heroku to create a complete CI/CD pipeline. Note that CircleCi is configured to only deploy on the main (production) branch. This is for the reason that we don't want the folks at CircleCI to get angry when we are pushing a small dev branch every hour. 

* Deployment instructions


* ...
