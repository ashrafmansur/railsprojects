class AddGenderToStudent < ActiveRecord::Migration[5.0]
  def change
    add_column :students, :gender, :integer
  end
end
