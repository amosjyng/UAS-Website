class UserMailer < ActionMailer::Base
  default from: "uas.ucla@gmail.com"
  
  def creation_notice(officer, password)
    @officer = officer
    @temp_password = password
    mail(:to => "#{officer.name} <#{officer.email}>", \
         :subject => "You're an officer at UAS now!")
  end
end
