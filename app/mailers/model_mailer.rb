class ModelMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.model_mailer.new_user_notification.subject
  #
  def new_user_notification()

  end

  def new_order_notification(order, enhanced_cart)
    @order = order
    @enhanced_cart = enhanced_cart

    mail to: @order.email, subject: "Jungle - Order ID ##{@order.id}"
  end

end