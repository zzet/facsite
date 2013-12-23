# == Schema Information
#
# Table name: documents
#
#  id          :integer          not null, primary key
#  title       :string(255)
#  attachment  :string(255)
#  description :text
#  body        :text
#  state       :string(255)
#  photo       :string(255)
#  created_at  :datetime
#  updated_at  :datetime
#

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
