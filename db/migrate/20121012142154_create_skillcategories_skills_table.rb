class CreateSkillcategoriesSkillsTable < ActiveRecord::Migration
  def up
    create_table :skillcategories_skills, :id => false do |t|
        t.references :skillcategory
        t.references :skill
    end
    add_index :skillcategories_skills, [:skillcategory_id, :skill_id]
    add_index :skillcategories_skills, [:skill_id, :skillcategory_id]
  end

  def down
    drop_table :skillcategories_skills
  end
end
