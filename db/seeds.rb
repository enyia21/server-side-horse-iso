# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'pry'
require 'rake'

# johnny = {
#     username: 'johnny_46',
#     email: 'johnny_46@smail.com',
#     password: 'password',
#     password_confirmation: 'password',
#     phone_number: '3125555555',
#     first_name: 'John',
#     last_name: 'Bravo',
#     address: "555 Ridiculous Lane"
# }

# joey = {
#     username: 'joe_46',
#     email: 'joe_46@smail.com',
#     password: 'password',
#     password_confirmation: 'password',
#     phone_number: '2135555555',
#     first_name: 'Joesph',
#     last_name: 'Wins',
#     address: "1600 Pennsylvania St"
# }
# User.create([
#     johnny,
#     joey
# ]
# )
#Create 20 users
40.times do
    user_firstName = Faker::Name.first_name
    user_lastName = Faker::Name.unique.last_name
    user_username_specifier = user_lastName + rand(9).to_s + rand(9).to_s
    user_userName = Faker::Internet.username(specifier: user_username_specifier)
    user = User.create(
        first_name: user_firstName,
        last_name: user_lastName,
        username: user_userName,
        email: Faker::Internet.safe_email(name: user_lastName),
        password: 'password',
        phone_number: Faker::Number.number(digits: 10),
        address: Faker::Address.full_address
    )   
end

Rake::Task["slurp:breeds"].invoke

wonderPony = {
    name: "Topaz",
    location: "Illinois, Manteno",
    gender: 'Gelding',
    size: "14 hands",
    color: 'black',
    foal_date: 'December 12, 2017',
    profile_picture: 'www.horseurl.com/madeup',
    video: 'www.youtube.com',
    temperment: 'hot',
    description: 'this is a test test test.',
    user_id: '1',
    breed_id: '10'
}

ed = {
    name: "Mr. Ed",
    location: "California, San Diego",
    gender: 'colt',
    size: '15.5 hands',
    color: 'gold',
    foal_date: 'January 28, 2010',
    profile_picture: 'www.horseurl.com/madeup',
    video: 'www.youtube.com',
    temperment: 'hot',
    description: "This is a test1.",
    user_id: '1',
    breed_id: '10'
}

Horse.create!([
    wonderPony,
    ed
    ])
# Create 40 horses
30.times do
    horse_name = Faker::Creature::Horse.name
    horse = Horse.create!(
        name: horse_name,
        location: Faker::Address.full_address,
        gender: 'Gelding',
        size: "1#{rand(9).to_s}.#{rand(9).to_s} hands",
        color: "Bey",
        foal_date: "#{Faker::Date.between(from: '2013-09-23', to: '2020-09-25')}", 
        profile_picture: 'https://www.fakepictures.com',
        video: 'https://www.fakepictures.com', 
        temperment: "Happy",
        description: "fake description of animal.....",
        user_id: "#{(1+rand(30)).to_s}",
        breed_id: "#{(1 + rand(1200)).to_s}"
    )   
end


    
    #Create 10 reviews

    #Create 10 reviews
20.times do 
    validReviewCreated = false;
    while (!validReviewCreated)
        horse = Horse.find((1+ rand(15)));
        review_title = "#{horse.name} Review"
        review_comment = Faker::ChuckNorris.fact
        possibleUsers = 1 + rand(30);
        reviewer = User.find(possibleUsers);
        if (reviewer.id != horse.user.id)
            review = Review.new(
                title: review_title,
                comment: review_comment,
                horse_id: "#{horse.id}",
                user_id: "#{reviewer.id}"
            )
            review.save
            validReviewCreated = true;
        end
    end
end