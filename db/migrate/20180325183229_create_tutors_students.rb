class CreateTutorsStudents < ActiveRecord::Migration[5.1]
  def change
    create_table :tutors_students, id: false do |t|
      t.belongs_to :tutor, index: true
      t.belongs_to :student, index: true
      t.timestamps
    end
  end
end
