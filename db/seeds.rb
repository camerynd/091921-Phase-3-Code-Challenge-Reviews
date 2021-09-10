puts "Deleting old data..."
Product.destroy_all
User.destroy_all
Review.destroy_all

puts "Creating users..."
user1 = User.create(name: Faker::Name.name)
user2 = User.create(name: Faker::Name.name)
user3 = User.create(name: Faker::Name.name)

puts "Creating products..."
product1 = Product.create(name: "Stapler", price: 10)
product2 = Product.create(name: "Whiteboard", price: 15)
product3 = Product.create(name: "Dry Erase Markers", price: 5)
product4 = Product.create(name: "Ballpoint Pens", price: 2)
product5 = Product.create(name: "Scotch Tape", price: 3)

puts "Creating reviews..."
review1 = Review.create(star_rating: 5, comment: "wow amazing", product_id: product3.id, user_id: user2.id)
review2 = Review.create(star_rating: 3, comment: "its ok...", product_id: product1.id, user_id: user3.id)
review3 = Review.create(star_rating: 4, comment: "quite alright!", product_id: product3.id, user_id: user1.id)
review4 = Review.create(star_rating: 2, comment: "yuck", product_id: product2.id, user_id: user1.id)

puts "Seeding done!"

puts 
puts "Review#user"
puts review1.user.name

puts
puts "Review#product"
puts review2.product.name

puts
puts "Product#reviews"
puts product5.reviews.map(&:comment)

puts
puts "Product#users"
puts product3.users.map(&:name)

puts
puts "User#reviews"
puts user2.reviews.map(&:star_rating)

puts 
puts "User#products"
puts user2.products.map(&:name)

puts
puts "Review#print_review"
puts review2.print_review

puts 
puts "Product#leave_review(user, star_rating, comment)"
new_review = product4.leave_review(user2, 2, "idk it was pretty bad!")
puts new_review

puts
puts "Product#print_all_reviews"
puts product3.print_all_reviews

puts
puts "Product#average_rating"
puts product3.average_rating

puts
puts "User#favorite_product"
puts user1.favorite_product

puts
puts "User#remove_reviews(product)"
user1.remove_reviews(product3)
puts user1.reviews.map(&:comment)
#the testing is weird for this one, but it works if you comment out all the other tests

