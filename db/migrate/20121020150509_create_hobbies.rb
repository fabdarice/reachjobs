class CreateHobbies < ActiveRecord::Migration
  def change
    create_table :hobbies do |t|
      t.references :profile
      t.string :name
      t.text :description
      t.boolean :visible, :default => "true"
      t.integer :position
      t.timestamps
    end
  end
end
