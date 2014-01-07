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


end
