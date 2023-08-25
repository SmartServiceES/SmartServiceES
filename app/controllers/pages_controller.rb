class PagesController < ApplicationController
  def whatsapp
    phone_number = params[:phone_number]
    message = params[:message]
    whatsapp_url = "https://api.whatsapp.com/send?phone=+55#{phone_number}&text=#{message}"
    redirect_to whatsapp_url, allow_other_host: true
  end
end
