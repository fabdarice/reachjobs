class CreateRecommendations < ActiveRecord::Migration
  def change
    create_table :recommendations do |t|
      t.references :profile
      t.text :content
      t.string :author
      t.string :relation
      t.timestamps
    end
  end
end
