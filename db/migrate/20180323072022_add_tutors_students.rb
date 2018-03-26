class AddTutorsStudents < ActiveRecord::Migration[5.1]
  def change
  	create_table :tutors, id: false do |t|
      t.belongs_to :user, index: { unique: true }, foreign_key: true, primary_key: true
      t.string :school
      t.timestamps
    end
     create_table :students, id: false do |t|
      t.belongs_to :user, index: { unique: true }, foreign_key: true, primary_key: true
      t.integer :age
      t.timestamps
    end
  end
end
