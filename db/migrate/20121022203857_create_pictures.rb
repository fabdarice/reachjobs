class CreatePictures < ActiveRecord::Migration
  def change
    create_table :pictures do |t|
      t.references :gallery
      t.timestamps
    end
  end
end
