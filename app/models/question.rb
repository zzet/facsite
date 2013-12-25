# == Schema Information
#
# Table name: questions
#
#  id          :integer          not null, primary key
#  title       :string(255)
#  description :text
#  first_name  :string(255)
#  last_name   :string(255)
#  email       :string(255)
#  created_at  :datetime
#  updated_at  :datetime
#

class Question < ActiveRecord::Base
  has_one :answer
end
