class CreateStudentTutors < ActiveRecord::Migration[5.1]
  def change
  	drop_table :students_tutors

    create_table :students_tutors, id: false do |t|
      t.belongs_to :tutor, index: true
      t.belongs_to :student, index: true
      t.timestamps
  	end
  end
end
