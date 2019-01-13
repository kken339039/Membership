ActiveRecord::Base.transaction do
  # Create defalut roles
  Role.destroy_all

  admin_role = Role.create!(name: 'admin')
  normal_role = Role.create!(name: 'normal')
  premium_role = Role.create!(name: 'premium')
  puts "Admin role 建立成功"
  puts "Normal role 建立成功"
  puts "Premium role 建立成功"

  # Create defalut users and role relation
  User.destroy_all

  admin_user = User.create!(email: "admin_user@gm.com", password: "abc12345")
  normal_user = User.create!(email: "normal_user@gm.com", password: "abc12345")
  premium_user = User.create!(email: "premium_user@gm.com", password: "abc12345")
  puts "admin_user 建立成功"
  puts "normal_user 建立成功"
  puts "premium_user 建立成功"

  admin_user.roles << admin_role
  premium_user.roles << premium_role

  # Create defalut products
  Product.destroy_all

  30.times do 
    Product.create!(name:  Faker::Name.name, price: rand(10000))
  end
  puts "建立 #{Product.count} 筆資料"
end