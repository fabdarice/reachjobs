class ContactsController < ApplicationController
  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(params[:contact])
    if (@contact.save)
      flash[:success] = "Message sent to ReachJobs administrator. You'll received a response soon."  
      UserMailer.send_email(@contact).deliver
      redirect_to new_contacts_path
    else
      flash[:error] = "Error while sending a message."  
      render "new"
    end
  end
end
