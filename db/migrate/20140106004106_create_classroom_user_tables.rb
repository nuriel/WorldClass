class CreateClassroomUserTables < ActiveRecord::Migration
  def up
    create_table :classrooms_users, :id => false do |t|
      t.references :classroom
      t.references :user
    end
    add_index :classrooms_users, [:classroom_id, :user_id]
    add_index :classrooms_users, :user_id
  end

  def down
    drop_table :classroom_users
  end
end
