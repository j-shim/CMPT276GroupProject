class AddTimeColumns < ActiveRecord::Migration[5.1]
  def change
  	add_column :tutor_sessions, :date, :date
  	add_column :tutor_sessions, :starttime, :time
  	add_column :tutor_sessions, :endtime, :time
  end
end
