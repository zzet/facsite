# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :question do
    title
    description
    first_name
    last_name
    email
  end
end
