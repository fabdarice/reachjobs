class AddLinkToProfiles < ActiveRecord::Migration
  def change
    add_column :profiles, :link, :string
  end
end
