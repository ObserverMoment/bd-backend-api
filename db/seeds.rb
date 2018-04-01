# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

TestUser.create(name: "Barry", email: "barry@manilow.com", data: { job: "singer", age: 52 })
TestUser.create(name: "Gary", email: "gary@lineker.com", data: { job: "footballer", age: 45 })
TestUser.create(name: "Larry", email: "larry@david.com", data: { job: "comedian", age: 48 })

TestIdea.create(title:"These are good ideas", body:"This will be 140 characters part 1", author:"Gary")
TestIdea.create(title:"Fourth idea is back", body:"This will be 140 characters part 2", author:"Barry")
TestIdea.create(title:"Get a job", body:"This will be 140 characters part 3", author:"Larry")
TestIdea.create(title:"Work it out", body:"This will be 140 characters part 4", author:"Rich")
