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

class Answer < ActiveRecord::Base
  belongs_to :question
end
