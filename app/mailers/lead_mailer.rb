class LeadMailer < ApplicationMailer
  def lead_email
    @customer = params[:customer]
    prefix = 'ליד חדש בדף הנחיתה'
    default_mail = "aargaman@gmail.com"
    full_msg = prefix + ': ' + @customer.fname + ' ' + @customer.lname + '. '
    mail(to: ENV['MAIL_TO'] || default_mail, subject: full_msg)
  end
end
