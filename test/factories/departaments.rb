# == Schema Information
#
# Table name: departaments
#
#  id          :integer          not null, primary key
#  name        :string(255)
#  description :text
#  history     :text
#  image       :string(255)
#  created_at  :datetime
#  updated_at  :datetime
#

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :departament do
    name
    description
    history
    image       { fixture_file_upload(Rails.root.join('test/fixtures/image.png'), 'image/png') }
  end
end
