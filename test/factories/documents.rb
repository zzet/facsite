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
    title
    #attachment  { fixture_file_upload(Rails.root.join('test/fixtures/image.png'), 'image/png') }
    #photo       { fixture_file_upload(Rails.root.join('test/fixtures/image.png'), 'image/png') }
    description
    body
  end
end
