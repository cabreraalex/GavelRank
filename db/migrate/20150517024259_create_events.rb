class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :name
      t.string :location
      t.text :teams
      t.text :best
      t.text :outstanding
      t.text :honorable
      t.string :date
      t.text :geo
      t.integer :weight
      t.text :about
      t.text :link

      t.timestamps
    end
  end
end
