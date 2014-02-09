# == Schema Information
#
# Table name: books
#
#  id          :integer          not null, primary key
#  title       :string(255)
#  description :text
#  preview     :string(255)
#  scan        :string(255)
#  pdf         :string(255)
#  doc         :string(255)
#  state       :string(255)
#  author_id   :integer
#  author_name :string(255)
#  library_id  :integer
#  created_at  :datetime
#  updated_at  :datetime
#

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :book do
    title "MyString"
    description "MyText"
    preview "MyString"
    scan "MyString"
    pdf "MyString"
    doc "MyString"
    author_id 1
    author_name "MyString"
    library_id 1
  end
end
