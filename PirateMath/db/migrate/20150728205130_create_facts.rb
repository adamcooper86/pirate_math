class CreateFacts < ActiveRecord::Migration
  def change
    create_table :facts do |t|
      t.string :operation
      t.integer :number_1
      t.integer :number_2
      t.integer :solution
      t.timestamps null: false
    end
  end
end
