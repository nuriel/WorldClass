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
#  user_id             :integer
#

class Answer < ActiveRecord::Base
  attr_accessible :approved_by_teacher, :content, :question_id, :rating, :solved, :user_id

  belongs_to :question
  validates :question, presence: true
  belongs_to :user
  validates :user, presence: true

  has_reputation :avg_rating,
                 :source => :user,
                 :aggregated_by => :average,
                 :source_of => [{ :reputation => :answering_skill, :of => :user }]
end
