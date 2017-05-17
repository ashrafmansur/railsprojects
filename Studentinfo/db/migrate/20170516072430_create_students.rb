class CreateStudents < ActiveRecord::Migration[5.0]
  def change
    create_table :students do |t|
      t.string :firstname
      t.string :lastname
      t.integer :age
      t.integer :grade
      t.boolean :plays_sports

      t.timestamps
    end
  end
end
