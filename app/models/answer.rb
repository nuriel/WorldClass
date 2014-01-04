# == Schema Information
#
# Table name: answers
#
#  id                  :integer          not null, primary key
#  question_id         :integer
#  content             :text
#  rating              :integer          default(0)
#  solved              :boolean          default(FALSE)
#  approved_by_teacher :boolean
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#

class Answer < ActiveRecord::Base
  attr_accessible :approved_by_teacher, :content, :question_id, :rating, :solved
end
