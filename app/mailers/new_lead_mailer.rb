class NewLeadMailer < ApplicationMailer

  def lead_email
    @customer = params[:customer]
    prefix = 'ליד חדש בדף הנחיתה'
    full_msg = prefix + ': ' + @customer.fname + ' ' + @customer.lname + '. '
    mail(to: 'aargaman@gmail.com', subject: full_msg)
  end
end