class CreateSocialnetworks < ActiveRecord::Migration
  def change
    create_table :socialnetworks do |t|
      t.references :profile
      t.string :linkedin_link
      t.string :facebook_link
      t.string :viadeo_link
      t.string :twitter_link
      t.string :reachjobs_link
      t.string :skype_link
      t.timestamps
    end
  end
end
