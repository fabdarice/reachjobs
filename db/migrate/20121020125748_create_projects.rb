class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.references :profile
      t.string :name
      t.string :headline
      t.string :description
      t.boolean :visible, :default => "true"
      t.integer :position
      t.timestamps
    end
  end
end
