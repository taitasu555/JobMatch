user = User.new(
  name: "admin",
  email: 'admin@example.com', 
  password: 'admin@example.com', 
  password_confirmation: 'admin@example.com'
)
user.save!


user = User.new(
  name: "リクルーター",
  email: 'aaa@example.com', 
  password: 'aaa@example.com', 
  password_confirmation: 'aaa@example.com'
)

user.save!
user = User.new(
  name: "就活生",
  email: 'bbb@example.com', 
  password: 'bbb@example.com', 
  password_confirmation: 'bbb@example.com'
)
user.save!




