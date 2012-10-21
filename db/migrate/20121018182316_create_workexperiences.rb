class CreateWorkexperiences < ActiveRecord::Migration
  def change
    create_table :workexperiences do |t|
      t.references :profile
      t.date :start_date
      t.date :end_date
      t.string :company
      t.string :job_title
      t.string :city
      t.string :country
      t.string :mission_title
      t.string :mission_description
      t.boolean :visible, :default => "true"
      t.integer :position
      t.timestamps
    end
  end
end
