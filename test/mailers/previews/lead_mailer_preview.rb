# Preview all emails at http://localhost:3000/rails/mailers/lead_mailer
class LeadMailerPreview < ActionMailer::Preview
  def lead_email
    customer = Customer.new(fname: 'shmulik', lname: 'rot', phone: '123456789')
    LeadMailer.with(customer: customer).lead_email
  end
end
