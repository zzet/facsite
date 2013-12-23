class QuestionEditType < Question
  include ApplicationType

  permit :title, :description, :first_name, :last_name, :email
end
