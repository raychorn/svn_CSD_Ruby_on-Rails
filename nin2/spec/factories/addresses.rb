# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :address do
    street "MyString"
    street2 "MyString"
    city "MyString"
    state "MyString"
    zip "MyString"
  end
end
