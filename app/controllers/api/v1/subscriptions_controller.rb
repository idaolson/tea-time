class Api::V1::SubscriptionsController < ApplicationController
  def index
    customer = Customer.find(params[:customer_id])
    supscriptions = Subscription.all_subscriptions(customer)
    render json: SubscriptionSerializer.new(subscriptions)
  end 

  def create
    subscription = Subscription.new(subscription_params)
    if subscription.save
      render json: { response: 'Subscription created!' }, status: :created
    else
      render json: { error: "Missing data." }, status: :bad_request
    end 
  end 

  def update


  end 

  private

  # def subscription_params
  #   params.permit(:title, :price, :status, :frequency, :quantity, :customer_id, :tea_id)
  # end 

  def subscription_params
    params.require(:subscription).permit(:title, :price, :status, :frequency, :quantity, :customer_id, :tea_id)
  end
end 



