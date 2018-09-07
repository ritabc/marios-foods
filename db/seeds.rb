
Product.destroy_all
50.times do |index|
  Product.create!(name: Faker::Food.unique.ingredient, cost: Faker::Number.normal(15, 15).round(2), country_of_origin: Faker::Address.country)
end

Review.destroy_all
250.times do |index|
  Review.create!(author: Faker::Pokemon.name, content_body: Faker::Lorem.paragraph_by_chars(rand(50..250)), rating: rand(1..5), product_id: Product.all.shuffle.first.id)
end


puts "Created #{Product.count} products"
puts "Created #{Review.count} reviews"
