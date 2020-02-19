class ApplicationController < ActionController::Base
  @whatsapp_number = ENV['WHATSAPP_NUMBER'] || '972526626511'
end
