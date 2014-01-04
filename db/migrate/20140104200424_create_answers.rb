class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.integer :question_id
      t.text :content
      t.integer :rating, default: 0
      t.boolean :solved, default: false
      t.boolean :approved_by_teacher

      t.timestamps
    end
  end
end
