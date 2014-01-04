class CreateClassrooms < ActiveRecord::Migration
  def change
    create_table :classrooms do |t|
      t.integer :teacher_id
      t.string :video_url
      t.string :video_provider

      t.timestamps
    end
  end
end
