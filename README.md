# TravelBook
Log where you have been

TravelBook Web Application built using Ruby on Rails.

### Quickstart

Make sure PostgreSQL is installed locally.

Set up Ruby and Rails on your local machine.
- Ruby 2.3.1
- Rails 5.0.1

Clone the TrekitAPI repository:
`git clone git@github.com:alexsclim/TravelBook.git`

Fetch all project dependencies with
`bundle install`

Create your database with
`rake db:create`

Migrate your database with
`rake db:migrate`

If you want to populate your database with seed data run
`rake db:seed`

Start your rails server with
`rails s`

Go to `localhost:3000` to use the application.

### To run test suite
To run the whole test suite, run `bundle exec rspec spec`.
