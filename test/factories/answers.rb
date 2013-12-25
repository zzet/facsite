# == Schema Information
#
# Table name: answers
#
#  id          :integer          not null, primary key
#  title       :string(255)
#  description :text
#  question_id :integer
#  created_at  :datetime
#  updated_at  :datetime
#

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :answer do
    title
    description
    question
  end
end
