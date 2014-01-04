class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string :title
      t.text :content
      t.integer :rating, default: 0
      t.integer :time
      t.integer :class_id
      t.integer :video_in_class
      t.integer :right_answer_id

      t.timestamps
    end
  end
end
