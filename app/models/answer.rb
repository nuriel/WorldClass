class Answer < ActiveRecord::Base
  attr_accessible :approved_by_teacher, :content, :question_id, :rating, :solved
end
