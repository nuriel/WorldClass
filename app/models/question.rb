# == Schema Information
#
# Table name: questions
#
#  id              :integer          not null, primary key
#  title           :string(255)
#  content         :text
#  rating          :integer          default(0)
#  time            :integer
#  class_id        :integer
#  video_in_class  :integer
#  right_answer_id :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  classroom_id    :integer
#

class Question < ActiveRecord::Base
  attr_accessible :classroom_id, :content, :rating, :time, :title, :video_in_class

  has_reputation :votes, source: :user, aggregated_by: :sum

  belongs_to :user
  belongs_to :classroom
  validates :classroom, presence: true
  has_many :answers
end
