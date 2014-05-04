# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :realestate do
    zipaddress "MyString"
    zipcity "MyString"
    zipcode 1
    zipid 1
    zestimate 1
    zillow_link "MyString"
    financialinstrument nil
    user nil
  end
end
