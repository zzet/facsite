# == Schema Information
#
# Table name: faculties
#
#  id          :integer          not null, primary key
#  name        :string(255)
#  description :text
#  history     :text
#  image       :string(255)
#  created_at  :datetime
#  updated_at  :datetime
#

class Faculty < ActiveRecord::Base

  has_many :news, as: :newsable
  has_many :events, as: :eventable
  mount_uploader :image, ::ImageUploader
end
