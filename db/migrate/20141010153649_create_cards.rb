class CreateCards < ActiveRecord::Migration
  def change
    create_table :cards do |t|
      t.string :question
      t.string :question_image_url
      t.string :answer
      t.string :answer_image_url
      t.integer :deck_id
      t.timestamps
    end
  end
end
