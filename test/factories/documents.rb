# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :document do
    title "MyString"
    attachment "MyString"
    description "MyText"
    body "MyText"
    state "MyString"
  end
end
