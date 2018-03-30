class AddBioFieldToTutors < ActiveRecord::Migration[5.1]
  def change
  	add_column :tutors, :bio, :string
  	add_column :tutors, :subjects, :string
  end
end
