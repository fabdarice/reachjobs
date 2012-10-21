class CreateSchools < ActiveRecord::Migration
  def change
    create_table :schools do |t|
      t.references :profile
      t.date :start_date
      t.date :end_date
      t.string :name
      t.string :city
      t.string :country
      t.string :degree
      t.string :field_study
      t.boolean :visible, :default => "true"
      t.integer :position
      t.timestamps
    end
  end
end
