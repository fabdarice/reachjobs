class CreateSkills < ActiveRecord::Migration
  def change
    create_table :skills do |t|
      t.references :skillcategory
      t.string :skill_name
      t.integer :order
      t.timestamps
    end
  end
end
