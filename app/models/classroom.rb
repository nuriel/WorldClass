# == Schema Information
#
# Table name: classrooms
#
#  id             :integer          not null, primary key
#  teacher_id     :integer
#  video_url      :string(255)
#  video_provider :string(255)
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  name           :string(255)
#

class Classroom < ActiveRecord::Base
  attr_accessible :teacher_id, :video_provider, :video_url, :name

  belongs_to :teacher, class_name: "User"
  validates :teacher, presence: true
  has_and_belongs_to_many :students, class_name: "User"

  has_many :questions
  has_many :answers, through: :questions

  validates :video_url, presence: true

  def video_id
    if self.video_url[/youtu\.be\/([^\?]*)/]
      youtube_id = $1
    else
      # Regex from # http://stackoverflow.com/questions/3452546/javascript-regex-how-to-get-youtube-video-id-from-url/4811367#4811367
      self.video_url[/^.*((v\/)|(embed\/)|(watch\?))\??v?=?([^\&\?]*).*/]
      youtube_id = $5
    end
    youtube_id
  end

end
