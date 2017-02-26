# TravelBook
Remember where you have been!

Pre-populated account credentials:  
Username: guest.guest@travelbook.com  
Password: 123456  
http://travelbook-me.herokuapp.com/

TravelBook Web Application built using Ruby on Rails.

### Quickstart

Make sure PostgreSQL is installed locally.

Set up Ruby and Rails on your local machine.
- Ruby 2.3.1
- Rails 5.0.1

Clone the TravelBook repository:
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

You will need to obtain the local_env file from me for AWS keys since images are stored on S3.

### To run test suite
To run the whole test suite, run `bundle exec rspec spec`.

### Kanban Board
https://waffle.io/alexsclim/TravelBook
