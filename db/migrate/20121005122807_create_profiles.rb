class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.references :user
      t.string :head_description
      t.string :second_description
      t.text :about_me_description
      t.text :search_description
      t.string :phone
      t.timestamps
    end
  end
end
