class Classroom < ActiveRecord::Base
  attr_accessible :teacher_id, :video_provider, :video_url
end
