class CreateWorkexperiencesSkills < ActiveRecord::Migration
  def up
    create_table :workexperiences_skills, :id => false do |t|
        t.references :workexperience
        t.references :skill
    end
    add_index :workexperiences_skills, [:workexperience_id, :skill_id]
    add_index :workexperiences_skills, [:skill_id, :workexperience_id]
  end

  def down
    drop_table :workexperiences_skills
  end
end
