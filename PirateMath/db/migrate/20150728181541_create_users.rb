class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username
      t.string :first_name
      t.string :last_name
      t.string :password_digest
      t.string :type
      t.integer :school_id
      t.timestamps null: false
    end
  end
end
