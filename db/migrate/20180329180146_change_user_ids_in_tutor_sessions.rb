class ChangeUserIdsInTutorSessions < ActiveRecord::Migration[5.1]
  def change
  	add_column :tutor_sessions, :student_id, :integer
  	add_column :tutor_sessions, :tutor_id, :integer
  end
end
