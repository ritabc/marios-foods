
Product.destroy_all
50.times do |index|
  product = Product.create!(name: Faker::Food.unique.ingredient, cost: Faker::Number.normal(15, 5).round(2), country_of_origin: Faker::Address.country)
  product.update_attributes(created_at: Faker::Date.between(1.year.ago, Date.today))
end

Review.destroy_all
250.times do |index|
  review = Review.create!(author: Faker::Pokemon.name, content_body: Faker::Lorem.paragraph_by_chars(rand(50..250)), rating: rand(1..5), product_id: Product.all.shuffle.first.id)
  product = Product.find(review.product_id)
  review.update_attributes(created_at: Faker::Date.between(product.created_at, Date.today))
end

puts "Created #{Product.count} products"
puts "Created #{Review.count} reviews"
