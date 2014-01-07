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

require 'test_helper'

class ClassroomTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
