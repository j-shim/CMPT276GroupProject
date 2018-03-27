class AddRateColumn < ActiveRecord::Migration[5.1]
  def change
  	add_column :tutors, :rate, :decimal, precision: 4, scale: 2
  end
end
