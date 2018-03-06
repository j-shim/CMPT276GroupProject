class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
    	t.string :firstname
    	t.string :lastname
      t.string :username
      t.string :password
      t.string :gender
      t.string :role
      t.string :location

      t.timestamps
    end
  end
end
