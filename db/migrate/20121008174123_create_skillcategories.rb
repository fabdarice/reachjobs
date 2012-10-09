class CreateSkillcategories < ActiveRecord::Migration
  def change
    create_table :skillcategories do |t|
      t.references :profile
      t.string :category_name
      t.timestamps
    end
  end
end
