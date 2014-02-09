# == Schema Information
#
# Table name: persones
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  position   :string(255)
#  photo      :string(255)
#  bio        :text
#  state      :string(255)
#  created_at :datetime
#  updated_at :datetime
#

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :persone do
    name
    position
    bio
  end
end
