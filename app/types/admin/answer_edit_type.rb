class Admin::AnswerEditType < Answer
  include ApplicationType

  permit :title, :description, :question, :question_id
end
