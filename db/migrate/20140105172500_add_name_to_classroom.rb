class AddNameToClassroom < ActiveRecord::Migration
  def change
    add_column :classrooms, :name, :string, not_null: true
  end
end
