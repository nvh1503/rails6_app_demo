class CreateOptions < ActiveRecord::Migration[6.0]
  def change
    create_table :options do |t|
      t.integer :question_id
      t.string :content
      t.string :description
      t.boolean :is_correct_answer, default: :false

      t.timestamps
    end

    add_index :options, :question_id
  end
end
