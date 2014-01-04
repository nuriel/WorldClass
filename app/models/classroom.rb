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
#

class Classroom < ActiveRecord::Base
  attr_accessible :teacher_id, :video_provider, :video_url
end
