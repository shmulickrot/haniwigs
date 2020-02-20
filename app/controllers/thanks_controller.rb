class ThanksController < ApplicationController
  before_action :check_redirect

  def index
    @customer = Customer.find(params[:customer])
  end

  def check_redirect
    redirect_to root_path if !params[:customer]
  end
end
