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

class Departament < ActiveRecord::Base

  has_many :news, as: :newsable
end
