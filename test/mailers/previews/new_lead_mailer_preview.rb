class NewLeadMailerPreview < ActionMailer::Preview
  def lead_mail_preview
    NewLeadMailer.lead_email(Customer.first)
  end
end