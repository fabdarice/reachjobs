FactoryGirl.define do
  factory :gallery do       
    association :profile, :factory => :profile      
    name Faker::Lorem::words
    headline Faker::Lorem::sentence
    description Faker::Lorem::paragraphs
    #avatar fixture_file_upload('/files/gallery.jpg', 'image/jpg')
	  avatar File.open(Dir.glob(File.join(Rails.root, 'spec', 'test_images', '*')).sample)
  end
end