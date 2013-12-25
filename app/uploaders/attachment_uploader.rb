# encoding: utf-8

class AttachmentUploader < ApplicationUploader
  def extension_white_list
    %w(doc docx xlc zip rar pdf)
  end
end
