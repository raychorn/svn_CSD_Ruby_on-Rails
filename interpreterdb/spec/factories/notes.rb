# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :note do
    comment "MyText"
    visibility "MyString"
    notable_type "MyString"
    notable_id 1
  end
end
