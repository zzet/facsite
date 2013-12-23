# == Schema Information
#
# Table name: news
#
#  id            :integer          not null, primary key
#  title         :string(255)
#  description   :text
#  body          :text
#  picture       :string(255)
#  slug          :string(255)
#  state         :string(255)
#  author_id     :integer
#  published_at  :datetime
#  created_at    :datetime
#  updated_at    :datetime
#  newsable_id   :integer
#  newsable_type :string(255)
#

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :news do
    title
    description
    body
    slug
    #picture       { fixture_file_upload(Rails.root.join('test/fixtures/image.png'), 'image/png') }
    #author
  end
end
