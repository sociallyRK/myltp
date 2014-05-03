# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :financial_instrument do
    instrument_type "MyString"
    instrument_sub "MyString"
    amount 1
    user nil
  end
end
