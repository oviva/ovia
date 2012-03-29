Factory.define :user do |user|
  user.sequence(:email) { |n| "user#{n}@ovia.in" }
  user.password "password"
  user.password_confirmation "password"
end