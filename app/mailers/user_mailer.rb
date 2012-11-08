class UserMailer < ActionMailer::Base
  default from: "from@reachjobs.net"

  def send_email(contact)
    @contact = contact
    mail(:to => 'fabrice.cheng@gmail.com', :subject => "[ReachJobs] Notification from" + @contact.email)
  end 
end
