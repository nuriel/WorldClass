class Question < ActiveRecord::Base
  attr_accessible :class_id, :content, :rating, :time, :title, :video_in_class
end
