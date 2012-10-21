class CreateLanguages < ActiveRecord::Migration
  def change
    create_table :languages do |t|
      t.references :profile
      t.string :name
      t.string :level
      t.string :additional_information
      t.boolean :visible, :default => "true"
      t.integer :position
      t.timestamps
    end
  end
end
