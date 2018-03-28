class EditColumnsTutorSessions < ActiveRecord::Migration[5.1]
  def up
  	remove_column :tutor_sessions, :date
  end

  def down
  	add_column :tutor_sessions, :date, :date
  	add_column :tutor_sessions, :starttime, :time
  	add_column :tutor_sessions, :endtime, :time
  end
end
