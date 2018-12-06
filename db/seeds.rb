# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require "faker"
require "./app/models/book"
require "./app/models/author"
require "./app/models/book_author"
require "./app/models/review"
require "./app/models/user"

# author_1 = Author.create!(name: "Ernest Hemmingway")
# author_2 = Author.create!(name: "Spot")
# book_1 = author_1.books.create!(title: "Long Day", page_count: 375)
# BookAuthor.create!(author_id: author_2.id, book_id: book_1.id)
# user_1 = User.create!(name: "Bob")
# user_2 = User.create!(name: "Barb")
# review_ = book_1.reviews.create!(title: "Wow.", rating: 5, user_id: user_1.id, text: "This book flew by! It was amazing!")
# review_ = book_1.reviews.create!(title: "Boo.", rating: 1, user_id: user_2.id, text: "This book took too long to read! It was bad!")

Author.destroy_all
Book.destroy_all
BookAuthor.destroy_all
Review.destroy_all
User.destroy_all

user_1 = User.create!(name: Faker::Name.unique.name)
user_2 = User.create!(name: Faker::Name.unique.name)
user_3 = User.create!(name: Faker::Name.unique.name)
user_4 = User.create!(name: Faker::Name.unique.name)
user_5 = User.create!(name: Faker::Name.unique.name)
user_6 = User.create!(name: Faker::Name.unique.name)
user_7 = User.create!(name: Faker::Name.unique.name)
user_8 = User.create!(name: Faker::Name.unique.name)
user_9 = User.create!(name: Faker::Name.unique.name)
user_10 = User.create!(name: Faker::Name.unique.name)
user_11 = User.create!(name: Faker::Name.unique.name)
user_12 = User.create!(name: Faker::Name.unique.name)
user_13 = User.create!(name: Faker::Name.unique.name)
user_14 = User.create!(name: Faker::Name.unique.name)
user_15 = User.create!(name: Faker::Name.unique.name)
user_16 = User.create!(name: Faker::Name.unique.name)
user_17 = User.create!(name: Faker::Name.unique.name)
user_18 = User.create!(name: Faker::Name.unique.name)
user_19 = User.create!(name: Faker::Name.unique.name)
user_20 = User.create!(name: Faker::Name.unique.name)
user_21 = User.create!(name: Faker::Name.unique.name)
user_22 = User.create!(name: Faker::Name.unique.name)
user_23 = User.create!(name: Faker::Name.unique.name)
user_24 = User.create!(name: Faker::Name.unique.name)



author_1 = Author.create!(name: Faker::Name.unique.name)
author_2 = Author.create!(name: Faker::Name.unique.name)
author_3 = Author.create!(name: Faker::Name.unique.name)
author_4 = Author.create!(name: Faker::Name.unique.name)
author_5 = Author.create!(name: Faker::Name.unique.name)
author_6 = Author.create!(name: Faker::Name.unique.name)
author_7 = Author.create!(name: Faker::Name.unique.name)
author_8 = Author.create!(name: Faker::Name.unique.name)
author_9 = Author.create!(name: Faker::Name.unique.name)
author_10 = Author.create!(name: Faker::Name.unique.name)
author_11 = Author.create!(name: Faker::Name.unique.name)
author_12 = Author.create!(name: Faker::Name.unique.name)

book_1 = Book.create!(title: Faker::Book.unique.title, page_count: rand(900), publish_year: rand(1950..2018))
review_1 = book_1.reviews.create!(title: "#{Faker::App.name} #{Faker::Ancient.god}", rating: rand(1..5), user_id: user_1.id, text: Faker::RickAndMorty.quote)
review_2 = book_1.reviews.create!(title: "#{Faker::App.name} #{Faker::Ancient.god}", rating: rand(1..5), user_id: user_24.id, text: Faker::RickAndMorty.quote)


book_2 = Book.create!(title: Faker::Book.unique.title, page_count: rand(900), publish_year: rand(1950..2018))
review_3 = book_1.reviews.create!(title: "#{Faker::App.name} #{Faker::Ancient.god}", rating: rand(1..5), user_id: user_13.id, text: Faker::RickAndMorty.quote)
review_4 = book_1.reviews.create!(title: "#{Faker::App.name} #{Faker::Ancient.god}", rating: rand(1..5), user_id: user_24.id, text: Faker::RickAndMorty.quote)

book_3 = Book.create!(title: Faker::Book.unique.title, page_count: rand(900), publish_year: rand(1950..2018))
review_5 = book_1.reviews.create!(title: "#{Faker::App.name} #{Faker::Ancient.god}", rating: rand(1..5), user_id: user_13.id, text: Faker::RickAndMorty.quote)
review_6 = book_1.reviews.create!(title: "#{Faker::App.name} #{Faker::Ancient.god}", rating: rand(1..5), user_id: user_24.id, text: Faker::RickAndMorty.quote)

author_1.books += [book_1, book_2, book_3]



book_4 = Book.create!(title: Faker::Book.unique.title, page_count: rand(900), publish_year: rand(1950..2018))
review_7 = book_1.reviews.create!(title: "#{Faker::App.name} #{Faker::Ancient.god}", rating: rand(1..5), user_id: user_1.id, text: Faker::RickAndMorty.quote)
review_8 = book_1.reviews.create!(title: "#{Faker::App.name} #{Faker::Ancient.god}", rating: rand(1..5), user_id: user_2.id, text: Faker::RickAndMorty.quote)
review_9 = book_1.reviews.create!(title: "#{Faker::App.name} #{Faker::Ancient.god}", rating: rand(1..5), user_id: user_23.id, text: Faker::RickAndMorty.quote)
review_10 = book_1.reviews.create!(title: "#{Faker::App.name} #{Faker::Ancient.god}", rating: rand(1..5), user_id: user_22.id, text: Faker::RickAndMorty.quote)

book_5 = Book.create!(title: Faker::Book.unique.title, page_count: rand(900), publish_year: rand(1950..2018))
review_11 = book_1.reviews.create!(title: "#{Faker::App.name} #{Faker::Ancient.god}", rating: rand(1..5), user_id: user_1.id, text: Faker::RickAndMorty.quote)
review_12 = book_1.reviews.create!(title: "#{Faker::App.name} #{Faker::Ancient.god}", rating: rand(1..5), user_id: user_20.id, text: Faker::RickAndMorty.quote)
review_13 = book_1.reviews.create!(title: "#{Faker::App.name} #{Faker::Ancient.god}", rating: rand(1..5), user_id: user_22.id, text: Faker::RickAndMorty.quote)

book_6 = Book.create!(title: Faker::Book.unique.title, page_count: rand(900), publish_year: rand(1950..2018))
book_7 = Book.create!(title: Faker::Book.unique.title, page_count: rand(900), publish_year: rand(1950..2018))
book_8 = Book.create!(title: Faker::Book.unique.title, page_count: rand(900), publish_year: rand(1950..2018))
review_14 = book_1.reviews.create!(title: "#{Faker::App.name} #{Faker::Ancient.god}", rating: rand(1..5), user_id: user_22.id, text: Faker::RickAndMorty.quote)
review_15 = book_1.reviews.create!(title: "#{Faker::App.name} #{Faker::Ancient.god}", rating: rand(1..5), user_id: user_4.id, text: Faker::RickAndMorty.quote)
review_16 = book_1.reviews.create!(title: "#{Faker::App.name} #{Faker::Ancient.god}", rating: rand(1..5), user_id: user_3.id, text: Faker::RickAndMorty.quote)

author_2.books += [book_4,book_5,book_6,book_7,book_8]

book_9 = Book.create!(title: Faker::Book.unique.title, page_count: rand(900), publish_year: rand(1950..2018))
review_17 = book_1.reviews.create!(title: "#{Faker::App.name} #{Faker::Ancient.god}", rating: rand(1..5), user_id: user_4.id, text: Faker::RickAndMorty.quote)
review_18 = book_1.reviews.create!(title: "#{Faker::App.name} #{Faker::Ancient.god}", rating: rand(1..5), user_id: user_2.id, text: Faker::RickAndMorty.quote)
review_19 = book_1.reviews.create!(title: "#{Faker::App.name} #{Faker::Ancient.god}", rating: rand(1..5), user_id: user_3.id, text: Faker::RickAndMorty.quote)

book_10 = Book.create!(title: Faker::Book.unique.title, page_count: rand(900), publish_year: rand(1950..2018))
review_20 = book_1.reviews.create!(title: "#{Faker::App.name} #{Faker::Ancient.god}", rating: rand(1..5), user_id: user_4.id, text: Faker::RickAndMorty.quote)
review_21 = book_1.reviews.create!(title: "#{Faker::App.name} #{Faker::Ancient.god}", rating: rand(1..5), user_id: user_5.id, text: Faker::RickAndMorty.quote)
review_22 = book_1.reviews.create!(title: "#{Faker::App.name} #{Faker::Ancient.god}", rating: rand(1..5), user_id: user_19.id, text: Faker::RickAndMorty.quote)
review_23 = book_1.reviews.create!(title: "#{Faker::App.name} #{Faker::Ancient.god}", rating: rand(1..5), user_id: user_3.id, text: Faker::RickAndMorty.quote)

book_11 = Book.create!(title: Faker::Book.unique.title, page_count: rand(900), publish_year: rand(1950..2018))
review_24 = book_1.reviews.create!(title: "#{Faker::App.name} #{Faker::Ancient.god}", rating: rand(1..5), user_id: user_3.id, text: Faker::RickAndMorty.quote)
review_25 = book_1.reviews.create!(title: "#{Faker::App.name} #{Faker::Ancient.god}", rating: rand(1..5), user_id: user_20.id, text: Faker::RickAndMorty.quote)
review_26 = book_1.reviews.create!(title: "#{Faker::App.name} #{Faker::Ancient.god}", rating: rand(1..5), user_id: user_19.id, text: Faker::RickAndMorty.quote)
review_27 = book_1.reviews.create!(title: "#{Faker::App.name} #{Faker::Ancient.god}", rating: rand(1..5), user_id: user_14.id, text: Faker::RickAndMorty.quote)
review_28 = book_1.reviews.create!(title: "#{Faker::App.name} #{Faker::Ancient.god}", rating: rand(1..5), user_id: user_18.id, text: Faker::RickAndMorty.quote)
review_29 = book_1.reviews.create!(title: "#{Faker::App.name} #{Faker::Ancient.god}", rating: rand(1..5), user_id: user_17.id, text: Faker::RickAndMorty.quote)


book_12 = Book.create!(title: Faker::Book.unique.title, page_count: rand(900), publish_year: rand(1950..2018))
review_30 = book_1.reviews.create!(title: "#{Faker::App.name} #{Faker::Ancient.god}", rating: rand(1..5), user_id: user_14.id, text: Faker::RickAndMorty.quote)
review_31 = book_1.reviews.create!(title: "#{Faker::App.name} #{Faker::Ancient.god}", rating: rand(1..5), user_id: user_16.id, text: Faker::RickAndMorty.quote)

book_13 = Book.create!(title: Faker::Book.unique.title, page_count: rand(900), publish_year: rand(1950..2018))
review_32 = book_1.reviews.create!(title: "#{Faker::App.name} #{Faker::Ancient.god}", rating: rand(1..5), user_id: user_16.id, text: Faker::RickAndMorty.quote)

book_14 = Book.create!(title: Faker::Book.unique.title, page_count: rand(900), publish_year: rand(1950..2018))
author_3.books += [book_9,book_10,book_11,book_12,book_13,book_14]

book_15 = Book.create!(title: Faker::Book.unique.title, page_count: rand(900), publish_year: rand(1950..2018))
book_16 = Book.create!(title: Faker::Book.unique.title, page_count: rand(900), publish_year: rand(1950..2018))
author_4.books += [book_15,book_16]

book_17 = Book.create!(title: Faker::Book.unique.title, page_count: rand(900), publish_year: rand(1950..2018))
review_33 = book_1.reviews.create!(title: "#{Faker::App.name} #{Faker::Ancient.god}", rating: rand(1..5), user_id: user_17.id, text: Faker::BackToTheFuture.unique.quote)
review_34 = book_1.reviews.create!(title: "#{Faker::App.name} #{Faker::Ancient.god}", rating: rand(1..5), user_id: user_16.id, text: Faker::BackToTheFuture.unique.quote)
review_35 = book_1.reviews.create!(title: "#{Faker::App.name} #{Faker::Ancient.god}", rating: rand(1..5), user_id: user_15.id, text: Faker::BackToTheFuture.unique.quote)
review_36 = book_1.reviews.create!(title: "#{Faker::App.name} #{Faker::Ancient.god}", rating: rand(1..5), user_id: user_20.id, text: Faker::BackToTheFuture.unique.quote)
review_37 = book_1.reviews.create!(title: "#{Faker::App.name} #{Faker::Ancient.god}", rating: rand(1..5), user_id: user_11.id, text: Faker::BackToTheFuture.unique.quote)
review_38 = book_1.reviews.create!(title: "#{Faker::App.name} #{Faker::Ancient.god}", rating: rand(1..5), user_id: user_10.id, text: Faker::BackToTheFuture.unique.quote)
author_5.books << book_17

book_18 = Book.create!(title: Faker::Book.unique.title, page_count: rand(900), publish_year: rand(1950..2018))
review_39 = book_1.reviews.create!(title: "#{Faker::App.name} #{Faker::Ancient.god}", rating: rand(1..5), user_id: user_10.id, text: Faker::BackToTheFuture.unique.quote)
review_40 = book_1.reviews.create!(title: "#{Faker::App.name} #{Faker::Ancient.god}", rating: rand(1..5), user_id: user_9.id, text: Faker::BackToTheFuture.unique.quote)
review_41 = book_1.reviews.create!(title: "#{Faker::App.name} #{Faker::Ancient.god}", rating: rand(1..5), user_id: user_7.id, text: Faker::BackToTheFuture.unique.quote)

book_19 = Book.create!(title: Faker::Book.unique.title, page_count: rand(900), publish_year: rand(1950..2018))
review_42 = book_1.reviews.create!(title: "#{Faker::App.name} #{Faker::Ancient.god}", rating: rand(1..5), user_id: user_11.id, text: Faker::BackToTheFuture.unique.quote)
review_43 = book_1.reviews.create!(title: "#{Faker::App.name} #{Faker::Ancient.god}", rating: rand(1..5), user_id: user_4.id, text: Faker::BackToTheFuture.unique.quote)
review_44 = book_1.reviews.create!(title: "#{Faker::App.name} #{Faker::Ancient.god}", rating: rand(1..5), user_id: user_5.id, text: Faker::BackToTheFuture.unique.quote)
review_45 = book_1.reviews.create!(title: "#{Faker::App.name} #{Faker::Ancient.god}", rating: rand(1..5), user_id: user_11.id, text: Faker::BackToTheFuture.unique.quote)

book_20 = Book.create!(title: Faker::Book.unique.title, page_count: rand(900), publish_year: rand(1950..2018))
review_46 = book_1.reviews.create!(title: "#{Faker::App.name} #{Faker::Ancient.god}", rating: rand(1..5), user_id: user_21.id, text: Faker::BackToTheFuture.unique.quote)
author_6.books += [book_18,book_19,book_20]

book_21 = Book.create!(title: Faker::Book.unique.title, page_count: rand(900), publish_year: rand(1950..2018))
review_47 = book_1.reviews.create!(title: "#{Faker::App.name} #{Faker::Ancient.god}", rating: rand(1..5), user_id: user_7.id, text: Faker::RickAndMorty.quote)
review_48 = book_1.reviews.create!(title: "#{Faker::App.name} #{Faker::Ancient.god}", rating: rand(1..5), user_id: user_21.id, text: Faker::RickAndMorty.quote)
review_49 = book_1.reviews.create!(title: "#{Faker::App.name} #{Faker::Ancient.god}", rating: rand(1..5), user_id: user_8.id, text: Faker::RickAndMorty.quote)

book_22 = Book.create!(title: Faker::Book.unique.title, page_count: rand(900), publish_year: rand(1950..2018))
review_50 = book_1.reviews.create!(title: "#{Faker::App.name} #{Faker::Ancient.god}", rating: rand(1..5), user_id: user_21.id, text: Faker::RickAndMorty.quote)
review_51 = book_1.reviews.create!(title: "#{Faker::App.name} #{Faker::Ancient.god}", rating: rand(1..5), user_id: user_10.id, text: Faker::RickAndMorty.quote)
review_52 = book_1.reviews.create!(title: "#{Faker::App.name} #{Faker::Ancient.god}", rating: rand(1..5), user_id: user_15.id, text: Faker::RickAndMorty.quote)
review_53 = book_1.reviews.create!(title: "#{Faker::App.name} #{Faker::Ancient.god}", rating: rand(1..5), user_id: user_14.id, text: Faker::RickAndMorty.quote)
review_54 = book_1.reviews.create!(title: "#{Faker::App.name} #{Faker::Ancient.god}", rating: rand(1..5), user_id: user_17.id, text: Faker::RickAndMorty.quote)
author_7.books += [book_21,book_22]

book_23 = Book.create!(title: Faker::Book.unique.title, page_count: rand(900), publish_year: rand(1950..2018))
book_24 = Book.create!(title: Faker::Book.unique.title, page_count: rand(900), publish_year: rand(1950..2018))
author_8.books += [book_23,book_24]

book_25 = Book.create!(title: Faker::Book.unique.title, page_count: rand(900), publish_year: rand(1950..2018))
review_55 = book_1.reviews.create!(title: "#{Faker::App.name} #{Faker::Ancient.god}", rating: rand(1..5), user_id: user_8.id, text: Faker::RickAndMorty.quote)
review_56 = book_1.reviews.create!(title: "#{Faker::App.name} #{Faker::Ancient.god}", rating: rand(1..5), user_id: user_7.id, text: Faker::RickAndMorty.quote)

book_26 = Book.create!(title: Faker::Book.unique.title, page_count: rand(900), publish_year: rand(1950..2018))
review_57 = book_1.reviews.create!(title: "#{Faker::App.name} #{Faker::Ancient.god}", rating: rand(1..5), user_id: user_8.id, text: Faker::RickAndMorty.quote)

book_27 = Book.create!(title: Faker::Book.unique.title, page_count: rand(900), publish_year: rand(1950..2018))
review_58 = book_1.reviews.create!(title: "#{Faker::App.name} #{Faker::Ancient.god}", rating: rand(1..5), user_id: user_7.id, text: Faker::RickAndMorty.quote)

book_28 = Book.create!(title: Faker::Book.unique.title, page_count: rand(900), publish_year: rand(1950..2018))
review_59 = book_1.reviews.create!(title: "#{Faker::App.name} #{Faker::Ancient.god}", rating: rand(1..5), user_id: user_8.id, text: Faker::RickAndMorty.quote)

book_29 = Book.create!(title: Faker::Book.unique.title, page_count: rand(900), publish_year: rand(1950..2018))
review_60 = book_1.reviews.create!(title: "#{Faker::App.name} #{Faker::Ancient.god}", rating: rand(1..5), user_id: user_2.id, text: Faker::RickAndMorty.quote)
review_61 = book_1.reviews.create!(title: "#{Faker::App.name} #{Faker::Ancient.god}", rating: rand(1..5), user_id: user_7.id, text: Faker::RickAndMorty.quote)
review_62 = book_1.reviews.create!(title: "#{Faker::App.name} #{Faker::Ancient.god}", rating: rand(1..5), user_id: user_10.id, text: Faker::RickAndMorty.quote)
review_63 = book_1.reviews.create!(title: "#{Faker::App.name} #{Faker::Ancient.god}", rating: rand(1..5), user_id: user_16.id, text: Faker::RickAndMorty.quote)
author_9.books += [book_25,book_25,book_26,book_27,book_28,book_29]

book_30 = Book.create!(title: Faker::Book.unique.title, page_count: rand(900), publish_year: rand(1950..2018))
review_64 = book_1.reviews.create!(title: "#{Faker::App.name} #{Faker::Ancient.god}", rating: rand(1..5), user_id: user_16.id, text: Faker::RickAndMorty.quote)
review_65 = book_1.reviews.create!(title: "#{Faker::App.name} #{Faker::Ancient.god}", rating: rand(1..5), user_id: user_8.id, text: Faker::RickAndMorty.quote)
review_66 = book_1.reviews.create!(title: "#{Faker::App.name} #{Faker::Ancient.god}", rating: rand(1..5), user_id: user_19.id, text: Faker::RickAndMorty.quote)
review_67 = book_1.reviews.create!(title: "#{Faker::App.name} #{Faker::Ancient.god}", rating: rand(1..5), user_id: user_5.id, text: Faker::RickAndMorty.quote)
review_68 = book_1.reviews.create!(title: "#{Faker::App.name} #{Faker::Ancient.god}", rating: rand(1..5), user_id: user_9.id, text: Faker::RickAndMorty.quote)
author_10.books << book_30

book_31 = Book.create!(title: Faker::Book.unique.title, page_count: rand(900), publish_year: rand(1950..2018))
review_ = book_1.reviews.create!(title: "#{Faker::App.name} #{Faker::Ancient.god}", rating: rand(1..5), user_id: user_19.id, text: Faker::RickAndMorty.quote)
review_ = book_1.reviews.create!(title: "#{Faker::App.name} #{Faker::Ancient.god}", rating: rand(1..5), user_id: user_17.id, text: Faker::RickAndMorty.quote)
author_11.books << book_31

book_32 = Book.create!(title: Faker::Book.unique.title, page_count: rand(900), publish_year: rand(1950..2018))
review_69 = book_1.reviews.create!(title: "#{Faker::App.name} #{Faker::Ancient.god}", rating: rand(1..5), user_id: user_23.id, text: Faker::RickAndMorty.quote)
review_70 = book_1.reviews.create!(title: "#{Faker::App.name} #{Faker::Ancient.god}", rating: rand(1..5), user_id: user_13.id, text: Faker::RickAndMorty.quote)
review_71 = book_1.reviews.create!(title: "#{Faker::App.name} #{Faker::Ancient.god}", rating: rand(1..5), user_id: user_5.id, text: Faker::RickAndMorty.quote)

book_33 = Book.create!(title: Faker::Book.unique.title, page_count: rand(900), publish_year: rand(1950..2018))
review_72 = book_1.reviews.create!(title: "#{Faker::App.name} #{Faker::Ancient.god}", rating: rand(1..5), user_id: user_18.id, text: Faker::RickAndMorty.quote)
review_73 = book_1.reviews.create!(title: "#{Faker::App.name} #{Faker::Ancient.god}", rating: rand(1..5), user_id: user_13.id, text: Faker::RickAndMorty.quote)
review_74 = book_1.reviews.create!(title: "#{Faker::App.name} #{Faker::Ancient.god}", rating: rand(1..5), user_id: user_6.id, text: Faker::RickAndMorty.quote)

book_34 = Book.create!(title: Faker::Book.unique.title, page_count: rand(900), publish_year: rand(1950..2018))
review_75 = book_1.reviews.create!(title: "#{Faker::App.name} #{Faker::Ancient.god}", rating: rand(1..5), user_id: user_18.id, text: Faker::Community.unique.quotes)
review_76 = book_1.reviews.create!(title: "#{Faker::App.name} #{Faker::Ancient.god}", rating: rand(1..5), user_id: user_3.id, text: Faker::Community.unique.quotes)
review_77 = book_1.reviews.create!(title: "#{Faker::App.name} #{Faker::Ancient.god}", rating: rand(1..5), user_id: user_6.id, text: Faker::Community.unique.quotes)
review_78 = book_1.reviews.create!(title: "#{Faker::App.name} #{Faker::Ancient.god}", rating: rand(1..5), user_id: user_13.id, text: Faker::Community.unique.quotes)
review_79 = book_1.reviews.create!(title: "#{Faker::App.name} #{Faker::Ancient.god}", rating: rand(1..5), user_id: user_2.id, text: Faker::Community.unique.quotes)

book_35 = Book.create!(title: Faker::Book.unique.title, page_count: rand(900), publish_year: rand(1950..2018))
review_80 = book_1.reviews.create!(title: "#{Faker::App.name} #{Faker::Ancient.god}", rating: rand(1..5), user_id: user_18.id, text: Faker::Community.unique.quotes)
review_81 = book_1.reviews.create!(title: "#{Faker::App.name} #{Faker::Ancient.god}", rating: rand(1..5), user_id: user_1.id, text: Faker::Community.unique.quotes)

book_36 = Book.create!(title: Faker::Book.unique.title, page_count: rand(900), publish_year: rand(1950..2018))
review_82 = book_1.reviews.create!(title: "#{Faker::App.name} #{Faker::Ancient.god}", rating: rand(1..5), user_id: user_18.id, text: Faker::Community.unique.quotes)
review_83 = book_1.reviews.create!(title: "#{Faker::App.name} #{Faker::Ancient.god}", rating: rand(1..5), user_id: user_6.id, text: Faker::Community.unique.quotes)
review_84 = book_1.reviews.create!(title: "#{Faker::App.name} #{Faker::Ancient.god}", rating: rand(1..5), user_id: user_7.id, text: Faker::Community.unique.quotes)

book_37 = Book.create!(title: Faker::Book.unique.title, page_count: rand(900), publish_year: rand(1950..2018))
review_85 = book_1.reviews.create!(title: "#{Faker::App.name} #{Faker::Ancient.god}", rating: rand(1..5), user_id: user_6.id, text: Faker::Community.unique.quotes)
review_86 = book_1.reviews.create!(title: "#{Faker::App.name} #{Faker::Ancient.god}", rating: rand(1..5), user_id: user_1.id, text: Faker::Community.unique.quotes)

book_38 = Book.create!(title: Faker::Book.unique.title, page_count: rand(900), publish_year: rand(1950..2018))
review_87 = book_1.reviews.create!(title: "#{Faker::App.name} #{Faker::Ancient.god}", rating: rand(1..5), user_id: user_2.id, text: Faker::Community.unique.quotes)
review_88 = book_1.reviews.create!(title: "#{Faker::App.name} #{Faker::Ancient.god}", rating: rand(1..5), user_id: user_3.id, text: Faker::Community.unique.quotes)
review_89 = book_1.reviews.create!(title: "#{Faker::App.name} #{Faker::Ancient.god}", rating: rand(1..5), user_id: user_6.id, text: Faker::Community.unique.quotes)
review_90 = book_1.reviews.create!(title: "#{Faker::App.name} #{Faker::Ancient.god}", rating: rand(1..5), user_id: user_9.id, text: Faker::Community.unique.quotes)

book_39 = Book.create!(title: Faker::Book.unique.title, page_count: rand(900), publish_year: rand(1950..2018))
review_91 = book_1.reviews.create!(title: "#{Faker::App.name} #{Faker::Ancient.god}", rating: rand(1..5), user_id: user_6.id, text: Faker::Community.unique.quotes)

book_40 = Book.create!(title: Faker::Book.unique.title, page_count: rand(900), publish_year: rand(1950..2018))
review_92 = book_1.reviews.create!(title: "#{Faker::App.name} #{Faker::Ancient.god}", rating: rand(1..5), user_id: user_6.id, text: Faker::Community.quotes)

book_41 = Book.create!(title: Faker::Book.unique.title, page_count: rand(900), publish_year: rand(1950..2018))
review_93 = book_1.reviews.create!(title: "#{Faker::App.name} #{Faker::Ancient.god}", rating: rand(1..5), user_id: user_9.id, text: Faker::Community.quotes)
review_94 = book_1.reviews.create!(title: "#{Faker::App.name} #{Faker::Ancient.god}", rating: rand(1..5), user_id: user_1.id, text: Faker::Community.quotes)

book_42 = Book.create!(title: Faker::Book.unique.title, page_count: rand(900), publish_year: rand(1950..2018))
review_95 = book_1.reviews.create!(title: "#{Faker::App.name} #{Faker::Ancient.god}", rating: rand(1..5), user_id: user_9.id, text: Faker::MostInterestingManInTheWorld.unique.quote)
review_96 = book_1.reviews.create!(title: "#{Faker::App.name} #{Faker::Ancient.god}", rating: rand(1..5), user_id: user_4.id, text: Faker::MostInterestingManInTheWorld.unique.quote)
review_97 = book_1.reviews.create!(title: "#{Faker::App.name} #{Faker::Ancient.god}", rating: rand(1..5), user_id: user_5.id, text: Faker::MostInterestingManInTheWorld.unique.quote)
review_98 = book_1.reviews.create!(title: "#{Faker::App.name} #{Faker::Ancient.god}", rating: rand(1..5), user_id: user_1.id, text: Faker::MostInterestingManInTheWorld.unique.quote)
review_99 = book_1.reviews.create!(title: "#{Faker::App.name} #{Faker::Ancient.god}", rating: rand(1..5), user_id: user_2.id, text: Faker::MostInterestingManInTheWorld.unique.quote)
review_100 = book_1.reviews.create!(title: "#{Faker::App.name} #{Faker::Ancient.god}", rating: rand(1..5), user_id: user_8.id, text: Faker::MostInterestingManInTheWorld.unique.quote)
review_101 = book_1.reviews.create!(title: "#{Faker::App.name} #{Faker::Ancient.god}", rating: rand(1..5), user_id: user_11.id, text: Faker::MostInterestingManInTheWorld.unique.quote)
review_102 = book_1.reviews.create!(title: "#{Faker::App.name} #{Faker::Ancient.god}", rating: rand(1..5), user_id: user_13.id, text: Faker::MostInterestingManInTheWorld.unique.quote)
author_12.books += [book_32,book_33,book_34,book_35,book_36,book_37,book_38,book_39,book_40,book_41,book_42]
