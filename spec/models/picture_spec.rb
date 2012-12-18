require 'spec_helper'
 
describe Picture do
 
  it { should belong_to(:gallery) }
 
  #Paperclip attachment testing
  it { should have_attached_file(:avatar) }
  it { should validate_attachment_content_type(:avatar).allowing('image/png', 'image/jpg', 'image/jpeg') }
  it { should validate_attachment_size(:avatar).less_than(4.megabytes)}
 
end
