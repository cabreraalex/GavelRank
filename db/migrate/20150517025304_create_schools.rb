class CreateSchools < ActiveRecord::Migration
  def change
    create_table :schools do |t|
      t.string :name
      t.string :location
      t.integer :students
      t.integer :best
      t.integer :outstanding
      t.integer :honorable
      t.string :email
      t.string :password
      t.string :salt
      t.string :geo
      t.integer :score

      t.timestamps
    end
  end
end
