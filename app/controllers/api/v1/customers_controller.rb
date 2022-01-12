class Api::V1::CustomersController < ApplicationController
  def show
    customer = Customer.find(params[:id])
    subscriptions = customer.subscriptions
    render json: SubscriptionSerializer.new(subscriptions)
  end 
end 