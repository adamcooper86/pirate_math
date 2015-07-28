class CreatePractices < ActiveRecord::Migration
  def change
    create_table :practices do |t|
      t.string :session_data
      t.integer :user_id
      t.timestamps null: false
    end
  end
end
