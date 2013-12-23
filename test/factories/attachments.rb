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

include ActionDispatch::TestProcess

FactoryGirl.define do
  factory :attachment do
    title
    description
    #file        { fixture_file_upload(Rails.root.join('test/fixtures/image.png'), 'image/png') }
    #photo       { fixture_file_upload(Rails.root.join('test/fixtures/image.png'), 'image/png') }
  end
end
