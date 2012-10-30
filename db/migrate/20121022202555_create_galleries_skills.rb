class CreateGalleriesSkills < ActiveRecord::Migration
  def up
    create_table :galleries_skills, :id => false do |t|
        t.references :gallery
        t.references :skill
    end
    add_index :galleries_skills, [:gallery_id, :skill_id]
    add_index :galleries_skills, [:skill_id, :gallery_id]
  end

  def down
    drop_table :galleries_skills
  end
end
