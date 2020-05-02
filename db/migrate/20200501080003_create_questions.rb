class CreateQuestions < ActiveRecord::Migration[6.0]
  def change
    create_table :questions do |t|
      t.integer :test_id
      t.string :content
      t.string :description

      t.timestamps
    end

    add_index :questions, :test_id
  end
end
