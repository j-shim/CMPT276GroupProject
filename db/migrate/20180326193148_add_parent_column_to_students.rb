class AddParentColumnToStudents < ActiveRecord::Migration[5.1]
  def change
  	add_column :students, :need_parent, :boolean
  	add_column :students, :parent_firstname, :string
  	add_column :students, :parent_lastname, :string

  	remove_column :students, :age
  end
end
