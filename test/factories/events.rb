# == Schema Information
#
# Table name: events
#
#  id           :integer          not null, primary key
#  title        :string(255)
#  description  :text
#  body         :text
#  picture      :string(255)
#  state        :string(255)
#  slug         :string(255)
#  started_at   :datetime
#  ended_at     :datetime
#  published_at :datetime
#  created_at   :datetime
#  updated_at   :datetime
#

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :event do
    title
    description
    body
    slug
    started_at { DateTime.now }
    ended_at  { DateTime.now + 1.day }
    published_at { DateTime.now }
  end
end
