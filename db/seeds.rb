10.times do 
  Item.create(
    title: Faker::Commerce.product_name, 
    inventory: Faker::Number.number(2), 
    price: Faker::Number.number(4)
  )
  Category.create(title: Faker::Commerce.department)
end

counter = 1
Item.all.each do |item|
  item.category_id = counter
  item.save
  counter += 1
end

10.times do |i|
  User.create(email: "email_#{i}@email.com", password: "password_#{i}")
end

# 10.times do |i|
#   Cart.create(name: "cart_#{i}", user_id: i)
# end

# 10.times do |i|
#   Item.create(title: "item_#{i}")
# end

# 10.times do |i|
#   LineItem.create(cart_id: i, item_id: i)
# end

