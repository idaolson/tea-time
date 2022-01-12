class API::V1::SubscriptionsController < ApplicationController
  def index
    customer = Customer.find(params[:customer_id])
    supscriptions = Subscription.all_subscriptions(customer)
    render json: SubscriptionSerializer.new(subscriptions)
  end 

  def create
    subscription = Subscription.new(subscription_params)
    if subscription.save
      #success code
    else
      #failure code
    end 
  end 

  def update


  end 

  private

  def subscription_params
    params.permit(:title, :price, :status, :frequency, :quantity, :customer_id, :tea_id)
  end 
end 



