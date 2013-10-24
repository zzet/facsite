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

class Attachment < ActiveRecord::Base
end
