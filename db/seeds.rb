# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

################
#  User seeds  #
################
User.create(
            first_name: 'Alex',
            last_name: 'Lim',
            email: 'alex.lim@travelbook.com',
            password: '123456',
            password_confirmation: '123456'
           )


User.create(
            first_name: 'Chuck',
            last_name: 'Norris',
            email: 'chuck.norris@travelbook.com',
            password: '123456',
            password_confirmation: '123456'
           )

User.create(
            first_name: 'Phil',
            last_name: 'Kessel',
            email: 'phil.kessel@travelbook.com',
            password: '123456',
            password_confirmation: '123456'
           )

User.create(
            first_name: 'Roger',
            last_name: 'Federer',
            email: 'roger.federer@travelbook.com',
            password: '123456',
            password_confirmation: '123456'
           )

User.create(
            first_name: 'Justin',
            last_name: 'Bieber',
            email: 'justin.bieber@travelbook.com',
            password: '123456',
            password_confirmation: '123456'
           )

####################
#  Location Seeds  #
####################

Location.create(
                address: 'Tokyo Tower, 4 Chome-2-8 Shibakōen, Minato-ku, Tōkyō-to 105-0011, Japan',
                latitude: 35.6585696,
                longitude: 139.74548400000003,
                start_date: Date.new(2016, 8, 10),
                end_date: Date.new(2016, 10, 10),
                description: "Fun place!",
                user_id: 1
               )

Location.create(
                address: 'Kinkakujicho, Kita Ward, Kyoto, Kyoto Prefecture 603-8361, Japan',
                latitude: 35.0393553,
                longitude: 135.72932650000007,
                start_date: Date.new(2016, 8, 12),
                end_date: Date.new(2016, 10, 15),
                description: "Fun place!",
                user_id: 1
               )

Location.create(
                address: 'Kuala Lumpur, Federal Territory of Kuala Lumpur, Malaysia',
                latitude: 3.139003,
                longitude: 101.68685499999992,
                start_date: Date.new(2016, 10, 15),
                end_date: Date.new(2016, 10, 30),
                description: "Fun place!",
                user_id: 1
               )

Location.create(
                address: 'Westminster Bridge Rd, South Bank, London SE1 7PB, UK',
                latitude: 51.5033808,
                longitude: -0.1203766999999516,
                start_date: Date.new(2016, 10, 15),
                end_date: Date.new(2016, 10, 30),
                description: "Fun place!",
                user_id: 1
               )

Location.create(
                address: 'London Eye Pier, Westminster Bridge Road, London, United Kingdom',
                latitude: 51.5033808,
                longitude: 48.8584,
                start_date: Date.new(2016, 10, 15),
                end_date: Date.new(2016, 10, 30),
                description: "Fun place!",
                user_id: 1
               )

Location.create(
                address: 'Stanley Park Dr, Vancouver, BC, Canada',
                latitude: 49.3035521,
                longitude: -123.13147709999998,
                start_date: Date.new(2016, 10, 15),
                end_date: Date.new(2016, 10, 30),
                description: "Fun place!",
                user_id: 1
               )

Location.create(
                address: 'Edmonton, AB T5T, Canada',
                latitude: 53.5204368,
                longitude: -113.622524,
                start_date: Date.new(2016, 10, 15),
                end_date: Date.new(2016, 10, 30),
                description: "Fun place!",
                user_id: 1
               )

Location.create(
                address: "Disney's Boardwalk Resort, 2101 Epcot Resorts Blvd, Kissimmee, FL 34747, USA",
                latitude: 28.36529149999999,
                longitude: -81.5548435,
                start_date: Date.new(2016, 10, 15),
                end_date: Date.new(2016, 10, 30),
                description: "Fun place!",
                user_id: 1
               )

Location.create(
                address: 'Santa Monica Pier, Santa Monica, CA 90401, USA',
                latitude: 34.0092419,
                longitude: -118.49760370000001,
                start_date: Date.new(2016, 10, 15),
                end_date: Date.new(2016, 10, 30),
                description: "Fun place!",
                user_id: 1
               )

Location.create(
                address: 'Aguas Calientes, Peru',
                latitude: -13.1547062,
                longitude: -72.52544119999999,
                start_date: Date.new(2016, 10, 15),
                end_date: Date.new(2016, 10, 30),
                description: "Fun place!",
                user_id: 2
               )

Location.create(
                address: 'Mount Everest',
                latitude: 27.98785,
                longitude: 86.92502609999997,
                start_date: Date.new(2016, 10, 15),
                end_date: Date.new(2016, 10, 30),
                description: "Fun place!",
                user_id: 2
               )

Location.create(
                address: 'Mt Kilimanjaro, Tanzania',
                latitude: -3.067424699999999,
                longitude: 37.355627299999924,
                start_date: Date.new(2016, 10, 15),
                end_date: Date.new(2016, 10, 30),
                description: "Fun place!",
                user_id: 2
               )

########################
#  Relationship seeds  #
########################

users = User.all
user  = users.first
following = users[2..50]
followers = users[3..40]
following.each { |followed| user.follow(followed) }
followers.each { |follower| follower.follow(user) }
