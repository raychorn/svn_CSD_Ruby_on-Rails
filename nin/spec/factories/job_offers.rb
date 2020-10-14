# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :job_offer do
    job_request_id 1
    person_id 1
    status "MyString"
  end
end
