class ThanksController < ApplicationController
  before_action :check_redirect
  def index
    @whatsapp_number = ENV['WHATSAPP_NUMBER'] || '972526626511'
    @customer = Customer.find(params[:customer])
  end

  def check_redirect
    redirect_to root_path if !params[:customer]
  end
end
