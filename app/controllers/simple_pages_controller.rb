class SimplePagesController < ApplicationController
  def about
  end

  def contact
  end
  def landing_page
    @featured_product = Product.first
  end
  def landing_page
    @products = Product.limit(3)
  end

  def thank_you
    @name = params[:name]
    @email = params[:email]
    @message = params[:message]
    UserMailer.contact_form(@email, @name, @message).deliver_now
  end
end
