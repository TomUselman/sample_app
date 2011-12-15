# By using the symbol ':user', we get Factory Girl to simulate the User model.
Factory.define :user do |user|
  user.name                  "New Name"
  user.email                 "user@example.org"
  user.password              "foobars"
  user.password_confirmation "foobars"
end