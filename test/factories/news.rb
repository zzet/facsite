# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :news do
    title "MyString"
    description "MyText"
    body "MyText"
    photo "MyString"
    author_id 1
  end
end
