# == Schema Information
#
# Table name: attachments
#
#  id          :integer          not null, primary key
#  title       :string(255)
#  file        :string(255)
#  description :string(255)
#  photo       :string(255)
#  created_at  :datetime
#  updated_at  :datetime
#

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :attachment do
    title "MyString"
    file "MyString"
    description "MyString"
    photo "MyString"
  end
end
