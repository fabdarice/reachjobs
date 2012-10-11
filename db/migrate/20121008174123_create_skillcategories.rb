class CreateSkillcategories < ActiveRecord::Migration
  def change
    create_table :skillcategories do |t|
      t.references :profile
      t.string :category_name
      t.integer :position
      t.boolean :visible, :default => "true"
      t.timestamps
    end
  end
end
