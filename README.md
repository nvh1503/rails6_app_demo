# README - Rails 6: webpack - grape api demo

## Technical Requied:
* Rails 6.0.2
* Ruby 2.7.1
* Database: PostgreSQL

## How to run:
* Clone the source from github: git@github.com:nvh1503/rails6_app_demo.git
* Database configruation: rename file database.yml.example to database.yml
* Run command:
** bundle install
** bundle exec rake db:create
** bundle exec rake db:migrate
** bundle exec rake db:seed
* Start local server: rails s

## How it works
1. Web Admin (only teacher can access)
* Administrators (user management)
** Sign In
** Sign Out
** Create new user (roles: teacher and student)
** Edit user info
** Delete user

* Test management
** Create new test (a test has many questions, a question has many options)
** Edit test
** Delete test

2. API
* Documment http://localhost:3000/swagger
** Users API
** User sign up
** User sign in
** User sign out

* Tests API
** User gets list of tests
** User gets details of test
** User submits the test result

3. Unit Test (Rspec)
* Run RSPEC in local terminal: bundle exec rspec

* Models
** User model: spec/models/user_spec.rb
** Test model: spec/models/test_spec.rb
** Question model: spec/models/question_spec.rb
** Option model: spec/models/option_spec.rb

* APIs
User api: spec/api/users_spec.rb
Test api: spec/api/tests_spec.rb




