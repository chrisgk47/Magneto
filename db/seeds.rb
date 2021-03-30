# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
# User.destroy_all
# chris = User.create(username: "chris123", password: "abc123", name: "Christopher Kim", age: 30, education: "Some College")

# listing1 = Listing.create(title: "Electrician", position: "", company: "G.E.", location: "Springfield, Ohio", url: "www.pepperpotelect.com")
# User.destroy_all
Category.destroy_all
Listing.destroy_all



 
cat1 = Category.create(field: "Hospitality")
cat2 = Category.create(field: "Education")
cat3 = Category.create(field: "Engineering")  
cat4 = Category.create(field: "Journalism")
cat5 = Category.create(field: "Manufacturing")
cat6 = Category.create(field: "Transportation")
cat7 = Category.create(field: "Government")
cat8 = Category.create(field: "Environment")
cat9 = Category.create(field: "Communications")
cat10 = Category.create(field: "Business")

    

    50.times do
        Listing.create({
            title: Faker::Job.title,
            position: Faker::Job.position,
            employment_type: Faker::Job.employment_type,
            company: Faker::Company.name,
            location: Faker::Address.city, 
            category_id: Category.all.sample.id  

        })
    end

    10.times do
        User.create ({
            username: Faker::Internet.username(specifier: 5..10),
            password: Faker::Internet.password(min_length: 5),
            name: Faker::Artist.name,
            age: rand(19...75),
            education: Faker::Job.education_level
        })
    end

    10.times do
        UserCategory.create(user_id: User.all.sample.id, category_id: Category.all.sample.id)
    end

    50.times do
        Bookmark.create({
            user_id: User.all.sample.id,
            listing_id: Listing.all.sample.id,
            status: ["Pending", "Submitted", "Under Review"].sample
        })
    end


puts "seeded"