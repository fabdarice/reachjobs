class CreateProjectsSkills < ActiveRecord::Migration
  def up
    create_table :projects_skills, :id => false do |t|
        t.references :project
        t.references :skill
    end
    add_index :projects_skills, [:project_id, :skill_id]
    add_index :projects_skills, [:skill_id, :project_id]
  end

  def down
    drop_table :projects_skills
  end
end
