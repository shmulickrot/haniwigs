class MainPageController < ApplicationController
  def index
    @customer || Customer.new
    @whatsapp_number = ENV['WHATSAPP_NUMBER'] || '972526626511'
  end


  def create
    @customer = Customer.new(customer_params)
    if @customer.save
      begin
        LeadMailer.with(customer: @customer).lead_email.deliver_now
      rescue Net::SMTPAuthenticationError, Net::SMTPServerBusy, Net::SMTPSyntaxError, Net::SMTPFatalError, Net::SMTPUnknownError => e
        Rails.logger.error e.message
      end
      redirect_to thanks_path customer: @customer
    else
      flash[:error] = @customer.errors
      render 'index'
    end
  end

  private

  def customer_params
    params.require(:customer).permit(Customer.column_names)
  end

end
