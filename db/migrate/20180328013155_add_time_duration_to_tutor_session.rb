class AddTimeDurationToTutorSession < ActiveRecord::Migration[5.1]
  def change
  	add_column :tutor_sessions, :time_duration, :float
  end
end
