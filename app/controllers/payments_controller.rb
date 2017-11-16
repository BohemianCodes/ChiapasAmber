class PaymentsController < ApplicationController

  def create
    @product = Product.find(params[:product_id])
    @user = current_user
    token = params[:stripeToken]
  # Create the charge on Stripe's servers - this will charge the user's card
    begin
      charge = Stripe::Charge.create(
        amount: (@product.price * 100).to_i, # amount in cents
        currency: "eur",
        source: token,
        description: "Purchase",
        receipt_email: params[:stripeEmail]
      )

    if charge.paid
      Order.create(
        user_id: @user,
        product_id: @product,
        total: @product.price
        )
      flash[:success] = "Your payment was processed successfully"
    end

    rescue Stripe::CardError => e
      # The card has been declined
      body = e.json_body
      err = body[:error]
      flash[:error] = "Unfortunately, there was an error processing your payment: #{err[:message]}"
    end

    redirect_to product_path(@product)
  end
end
