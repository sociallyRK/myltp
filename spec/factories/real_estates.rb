# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :real_estate do
    zipaddress "MyString"
    zipcity "MyString"
    zipcode 1
    zipid 1
    zestimate 1
    zillow_link "MyString"
    financial_instrument nil
    user nil
  end
end
