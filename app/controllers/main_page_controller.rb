class MainPageController < ApplicationController
  def index
    @customer || Customer.new
    @whatsapp_number = ENV['WHATSAPP_NUMBER'] || '972526626511'
  end

  def new

  end

  def create
    @customer = Customer.new(customer_params)
    # respond_to do |f|
    if @customer.save
      # Customer.transaction do
      begin
        LeadMailer.with(customer: @customer).lead_email.deliver_now
      rescue Net::SMTPAuthenticationError, Net::SMTPServerBusy, Net::SMTPSyntaxError, Net::SMTPFatalError, Net::SMTPUnknownError => e
        Rails.logger.error e.message
      end
      render :'thanks/index', locals: {customer: @customer}

      # end
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
