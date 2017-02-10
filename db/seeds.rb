# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).

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

User.create(
            first_name: 'Tom',
            last_name: 'Sawyer',
            email: 'tom.sawyer@travelbook.com',
            password: '123456',
            password_confirmation: '123456'
           )

User.create(
            first_name: 'Huckleberry',
            last_name: 'Finn',
            email: 'huckleberry.finn@travelbook.com',
            password: '123456',
            password_confirmation: '123456'
           )

User.create(
            first_name: 'Anakin',
            last_name: 'Skywalker',
            email: 'anakin.skywalker@travelbook.com',
            password: '123456',
            password_confirmation: '123456'
           )

User.create(
            first_name: 'Sheev',
            last_name: 'Palpatine',
            email: 'sheev.palpatine@travelbook.com',
            password: '123456',
            password_confirmation: '123456'
           )

User.create(
            first_name: 'Obi-Wan',
            last_name: 'Kenobi',
            email: 'obiwan.kenobi@travelbook.com',
            password: '123456',
            password_confirmation: '123456'
           )

User.create(
            first_name: 'Kit',
            last_name: 'Fisto',
            email: 'kit.fisto@travelbook.com',
            password: '123456',
            password_confirmation: '123456'
           )

User.create(
            first_name: 'Guest',
            last_name: 'Guest',
            email: 'guest.guest@travelbook.com',
            password: '123456',
            password_confirmation: '123456'
           )


####################
#    Trip Seeds    #
####################

Trip.create(
           title: 'Asia Trip',
           summary: 'Visited various locations in Asia',
           user_id: 1
           )

Trip.create(
           title: 'Europe Trip',
           summary: 'Visited various locations in Europe',
           user_id: 1
           )

Trip.create(
           title: 'Trip to the US!',
           summary: 'Visited various locations in the states',
           user_id: 1
           )

Trip.create(
           title: 'Trip to Canada!',
           summary: 'Visited various locations in the Canada',
           user_id: 2
           )

Trip.create(
           title: 'Trip to the US!',
           summary: 'Visited various locations in the states',
           user_id: 3
           )

Trip.create(
           title: 'Trip to the US!',
           summary: 'Visited various locations in the states',
           user_id: 4
           )

Trip.create(
           title: 'Trip to the US!',
           summary: 'Visited various locations in the states',
           user_id: 5
           )

Trip.create(
           title: 'Trip to the US!',
           summary: 'Visited various locations in the states',
           user_id: 6
           )

Trip.create(
           title: 'Trip to the US!',
           summary: 'Visited various locations in the states',
           user_id: 7
           )

Trip.create(
           title: 'Trip to the US!',
           summary: 'Visited various locations in the states',
           user_id: 8
           )

Trip.create(
           title: 'Trip to the US!',
           summary: 'Visited various locations in the states',
           user_id: 9
           )

Trip.create(
           title: 'Trip to Africa!',
           summary: 'Visited various locations in the Africa',
           user_id: 12
           )


Trip.create(
           title: 'Trip to Australia!',
           summary: 'Visited various locations in Australia',
           user_id: 12
           )


Trip.create(
           title: 'Trip to Europe!',
           summary: 'Visited various locations in Europe',
           user_id: 12
           )


Trip.create(
           title: 'Trip to the Asia!',
           summary: 'Visited various locations in Asia',
           user_id: 12
           )


Trip.create(
           title: 'Trip to the Antarctica',
           summary: 'Visited the penguins',
           user_id: 12
           )

Trip.create(
           title: 'Trip to South America',
           summary: 'So much nice scenery',
           user_id: 12
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
                user_id: 1,
                trip_id: 1
               )

Location.create(
                address: 'Kinkakujicho, Kita Ward, Kyoto, Kyoto Prefecture 603-8361, Japan',
                latitude: 35.0393553,
                longitude: 135.72932650000007,
                start_date: Date.new(2016, 8, 12),
                end_date: Date.new(2016, 10, 15),
                description: "Fun place!",
                user_id: 1,
                trip_id: 1
               )

Location.create(
                address: 'Kuala Lumpur, Federal Territory of Kuala Lumpur, Malaysia',
                latitude: 3.139003,
                longitude: 101.68685499999992,
                start_date: Date.new(2016, 10, 15),
                end_date: Date.new(2016, 10, 30),
                description: "Fun place!",
                user_id: 1,
                trip_id: 1
               )

Location.create(
                address: 'Westminster Bridge Rd, South Bank, London SE1 7PB, UK',
                latitude: 51.5033808,
                longitude: -0.1203766999999516,
                start_date: Date.new(2016, 10, 15),
                end_date: Date.new(2016, 10, 30),
                description: "Fun place!",
                user_id: 1,
                trip_id: 2
               )

Location.create(
                address: 'London Eye Pier, Westminster Bridge Road, London, United Kingdom',
                latitude: 51.5033808,
                longitude: 48.8584,
                start_date: Date.new(2016, 10, 15),
                end_date: Date.new(2016, 10, 30),
                description: "Fun place!",
                user_id: 1,
                trip_id: 2
               )

Location.create(
                address: 'Stanley Park Dr, Vancouver, BC, Canada',
                latitude: 49.3035521,
                longitude: -123.13147709999998,
                start_date: Date.new(2016, 10, 15),
                end_date: Date.new(2016, 10, 30),
                description: "Fun place!",
                user_id: 2,
                trip_id: 2
               )

Location.create(
                address: 'Edmonton, AB T5T, Canada',
                latitude: 53.5204368,
                longitude: -113.622524,
                start_date: Date.new(2016, 10, 15),
                end_date: Date.new(2016, 10, 30),
                description: "Fun place!",
                user_id: 2,
                trip_id: 2
               )

Location.create(
                address: "Disney's Boardwalk Resort, 2101 Epcot Resorts Blvd, Kissimmee, FL 34747, USA",
                latitude: 28.36529149999999,
                longitude: -81.5548435,
                start_date: Date.new(2016, 10, 15),
                end_date: Date.new(2016, 10, 30),
                description: "Fun place!",
                user_id: 1,
                trip_id: 3
               )

Location.create(
                address: 'Santa Monica Pier, Santa Monica, CA 90401, USA',
                latitude: 34.0092419,
                longitude: -118.49760370000001,
                start_date: Date.new(2016, 10, 15),
                end_date: Date.new(2016, 10, 30),
                description: "Fun place!",
                user_id: 1,
                trip_id: 3
               )

Location.create(
                address: 'Aguas Calientes, Peru',
                latitude: -13.1547062,
                longitude: -72.52544119999999,
                start_date: Date.new(2016, 10, 15),
                end_date: Date.new(2016, 10, 30),
                description: "Fun place!",
                user_id: 12,
                trip_id: 16
               )

Location.create(
                address: 'Mount Everest',
                latitude: 27.98785,
                longitude: 86.92502609999997,
                start_date: Date.new(2016, 10, 15),
                end_date: Date.new(2016, 10, 30),
                description: "Fun place!",
                user_id: 12,
                trip_id: 14
               )

Location.create(
                address: 'Mt Kilimanjaro, Tanzania',
                latitude: -3.067424699999999,
                longitude: 37.355627299999924,
                start_date: Date.new(2016, 10, 15),
                end_date: Date.new(2016, 10, 30),
                description: "Tall mountain!",
                user_id: 12,
                trip_id: 12
               )

Location.create(
                address: 'Cape Town, South Africa',
                latitude: -33.9248685,
                longitude: 18.424055299999964,
                start_date: Date.new(2016, 10, 15),
                end_date: Date.new(2016, 10, 30),
                description: "Surfing is good here!",
                user_id: 12,
                trip_id: 12
               )

Location.create(
                address: 'Madagascar',
                latitude: -18.766947,
                longitude: 46.869106999999985,
                start_date: Date.new(2016, 10, 15),
                end_date: Date.new(2016, 10, 30),
                description: "Cool place!",
                user_id: 12,
                trip_id: 12
               )

Location.create(
                address: 'Victoria Falls, Zimbabwe',
                latitude: -17.9318052,
                longitude: 25.82555750000006,
                start_date: Date.new(2016, 10, 15),
                end_date: Date.new(2016, 10, 30),
                description: "Beautiful!",
                user_id: 12,
                trip_id: 12
               )

Location.create(
                address: 'Melbourne VIC 3004, Australia',
                latitude: -37.8195007,
                longitude: 144.97882960000004,
                start_date: Date.new(2016, 10, 15),
                end_date: Date.new(2016, 10, 30),
                description: "Federer won here recently!",
                user_id: 12,
                trip_id: 13
               )

Location.create(
                address: 'Bondi Beach, NSW 2026, Australia',
                latitude: -33.8914755,
                longitude: 151.2766845,
                start_date: Date.new(2016, 10, 15),
                end_date: Date.new(2016, 10, 30),
                description: "I went surfing here :)",
                user_id: 12,
                trip_id: 13
               )

Location.create(
                address: 'The Outback Hwy, Beltana Station SA 5730, Australia',
                latitude: -30.7796437,
                longitude: 138.3373692,
                start_date: Date.new(2016, 10, 15),
                end_date: Date.new(2016, 10, 30),
                description: "I went surfing here :)",
                user_id: 12,
                trip_id: 13
               )

Location.create(
                address: 'Mosman NSW 2088, Australia',
                latitude: -33.8421303,
                longitude: 151.24341600000002,
                start_date: Date.new(2016, 10, 15),
                end_date: Date.new(2016, 10, 30),
                description: "Saw lots of kangaroos!",
                user_id: 12,
                trip_id: 13
               )

Location.create(
                address: 'Wallstraße, 10179 Berlin, Germany',
                latitude: 52.5121517,
                longitude: 13.40949409999996,
                start_date: Date.new(2016, 10, 15),
                end_date: Date.new(2016, 10, 30),
                description: "Berlin wall was awesome!",
                user_id: 12,
                trip_id: 14
               )

Location.create(
                address: 'London, UK',
                latitude: 51.5073509,
                longitude: -0.12775829999998223,
                start_date: Date.new(2016, 10, 15),
                end_date: Date.new(2016, 10, 30),
                description: "London was awesome!",
                user_id: 12,
                trip_id: 13
               )

Location.create(
                address: 'Rome, Italy',
                latitude: 41.90278349999999,
                longitude: 12.496365500000024,
                start_date: Date.new(2016, 10, 15),
                end_date: Date.new(2016, 10, 30),
                description: "Wish I get to see Ancient Rome",
                user_id: 12,
                trip_id: 13
               )

Location.create(
                address: 'Tokyo, Japan',
                latitude: 35.6894875,
                longitude: 139.69170639999993,
                start_date: Date.new(2016, 10, 15),
                end_date: Date.new(2016, 10, 30),
                description: "L and Light showdown",
                user_id: 12,
                trip_id: 14
               )

Location.create(
                address: 'Kuala Lumpur, Federal Territory of Kuala Lumpur, Malaysia',
                latitude: 3.139003,
                longitude: 101.68685499999992,
                start_date: Date.new(2016, 10, 15),
                end_date: Date.new(2016, 10, 30),
                description: "Where Lee Chong Wei trains",
                user_id: 12,
                trip_id: 14
               )

Location.create(
                address: 'Hong Kong',
                latitude: 22.2783151,
                longitude: 114.17469499999993,
                start_date: Date.new(2016, 10, 15),
                end_date: Date.new(2016, 10, 30),
                description: "Chow Yun Fat is here!",
                user_id: 12,
                trip_id: 14
               )

Location.create(
                address: 'Taipei City, Taiwan',
                latitude: 25.0329636,
                longitude: 121.56542680000007,
                start_date: Date.new(2016, 10, 15),
                end_date: Date.new(2016, 10, 30),
                description: "Jay Chou fan!",
                user_id: 12,
                trip_id: 14
               )

Location.create(
                address: 'Seoul, South Korea',
                latitude: 37.566535,
                longitude: 126.97796919999996,
                start_date: Date.new(2016, 10, 15),
                end_date: Date.new(2016, 10, 30),
                description: "Great food here!",
                user_id: 12,
                trip_id: 14
               )

Location.create(
                address: 'Antarctic Great Wall Station, Antarctica',
                latitude: -62.218048,
                longitude: -58.96024139999997,
                start_date: Date.new(2016, 10, 15),
                end_date: Date.new(2016, 10, 30),
                description: "Penguins!",
                user_id: 12,
                trip_id: 15
               )

Location.create(
                address: 'Antarctic Bay, SIQQ 1ZZ, South Georgia and the South Sandwich Islands',
                latitude: -54.0696994,
                longitude: -36.94622820000001,
                start_date: Date.new(2016, 10, 15),
                end_date: Date.new(2016, 10, 30),
                description: "Polar Bears!",
                user_id: 12,
                trip_id: 15
               )

Location.create(
                address: 'Rio de Janeiro, State of Rio de Janeiro, Brazil',
                latitude: -22.9068467,
                longitude: -43.17289649999998,
                start_date: Date.new(2016, 10, 15),
                end_date: Date.new(2016, 10, 30),
                description: "Such a lively place!",
                user_id: 12,
                trip_id: 16
               )

Location.create(
                address: 'Argentina',
                latitude: -38.416097,
                longitude: -63.616671999999994,
                start_date: Date.new(2016, 10, 15),
                end_date: Date.new(2016, 10, 30),
                description: "Best soccer players",
                user_id: 12,
                trip_id: 16
               )

Location.create(
                address: 'Amazon Rainforest, Codajás - State of Amazonas, Brazil',
                latitude: -3.4653053,
                longitude: -62.215880500000026,
                start_date: Date.new(2016, 10, 15),
                end_date: Date.new(2016, 10, 30),
                description: "Amazon!",
                user_id: 12,
                trip_id: 16
               )

########################
#  Relationship seeds  #
########################

users = User.all
user_one = users.first
user_second = users.second
user_last = users.last
following = users[1..5]
followers = users[6..9]
following.each { |followed| user_one.follow(followed) }
followers.each { |follower| follower.follow(user_one) }
following.each { |followed| user_last.follow(followed) }
followers.each { |follower| follower.follow(user_last) }
following.each { |followed| user_second.follow(followed) }
followers.each { |follower| follower.follow(user_second) }
