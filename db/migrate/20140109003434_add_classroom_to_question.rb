class AddClassroomToQuestion < ActiveRecord::Migration
  def change
    add_column :questions, :classroom_id, :integer
  end
end
