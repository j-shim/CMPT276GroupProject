class CreateTutorSessions < ActiveRecord::Migration[5.1]
  def change
    create_table :tutor_sessions do |t|
      t.string :subject
      t.datetime :date
      t.references :user, foreign_key: true

      t.timestamps
    end
    add_index :tutor_sessions, [:user_id, :created_at]
  end
end
