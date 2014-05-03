# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    email "MyString"
    password_digest "MyString"
    first_name "MyString"
    last_name "MyString"
    birthday "2014-05-03 14:49:44"
    personal_income 1
    spouse_name "MyString"
    birthdate "2014-05-03 14:49:44"
    spouse_income 1
  end
end
