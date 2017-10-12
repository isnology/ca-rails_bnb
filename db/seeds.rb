# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Listing.create!([
    {title: 'White House', street_address: '1600 Pennsylvania Avenue NW', city: 'Washington', country_code: 'us',
     bed_count: rand(1..10), bedroom_count: rand(1..5), bathroom_count: rand(1..5), description: "good place to stay",
     night_fee_cents: rand(1000..5000), cleaning_fee_cents: rand(500..2000)},
    {title: 'Eiffel Tower', street_address: 'Champ de mars, 5 Avenue Anatole France', city: 'Paris', country_code: 'fr',
     bed_count: rand(1..20), bedroom_count: rand(1..20), bathroom_count: rand(1..5), description: "bad place to stay",
     night_fee_cents: rand(1000..5000), cleaning_fee_cents: rand(500..2000)},
    {title: 'Big Ben', street_address: 'Big Ben Westminster', city: 'London', country_code: 'gb',
     bed_count: rand(1..20), bedroom_count: rand(1..20), bathroom_count: rand(1..5), description: "bad place to stay",
     night_fee_cents: rand(1000..5000), cleaning_fee_cents: rand(500..2000)},
                ])