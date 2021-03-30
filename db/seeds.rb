# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).

chris = User.create(username: "chris123", password: "abc123", name: "Christopher Kim", age: 30, education: "Some College")



50.times do
    Listing.create({
        Faker::Job.title,
        Faker::Job.position,
        Faker::Job.employment_type,
        location: Faker::Address.city 
    })

10.times do
    User.create ((

    ))

