class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.integer :practice_id
      t.integer :fact_id
      t.integer :answer
      t.timestamps null: false
    end
  end
end
