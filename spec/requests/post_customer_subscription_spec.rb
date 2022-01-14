require 'rails_helper'

RSpec.describe "Post subscription endpoint" do 
  before :each do
    @customer1 = Customer.create!(first_name: 'Ida', last_name: 'Olson', email: 'idao@email.com', address: '1108 Ichabod St, North Pole, AK 99705')
    @customer2 =Customer.create!(first_name: 'Sarah', last_name: 'Carter', email: 'sarahc@email.com', address: '1300 Becky St, North Pole, AK 99705')
    @customer3 =Customer.create!(first_name: 'Doug', last_name: 'Olson', email: 'dougo@email.com', address: '2591 Garnet Dr, North Pole, AK 99705')
    @tea1 = Tea.create!(title: 'Masala chai', description: 'The traditional drink of India and defined as a blend of black tea, milk, sugar, and spices.', temperature: '212', brew_time: '5')
    @tea2 = Tea.create!(title: 'Oolong', description: 'A traditional semi-oxidized Chinese tea produced through a process including withering the plant under strong sun and oxidation before curling and twisting.', temperature: '205', brew_time: '4')
    @tea3 = Tea.create!(title: 'Green tea', description: 'A tea made from Camellia sinensis leaves and buds that have not undergone the same withering and oxidation process used to make oolong teas and black teas.', temperature: '185', brew_time: '3')
    @tea4 = Tea.create!(title: 'Chamomile tea', description: 'An herbal drink made from dried chamomile flowers steeped in water.', temperature: '208', brew_time: '5')
  end 

  it "creates a new subscription for a customer" do 
    body = {
        "title": "My weekly oolong",
        "price": 7.99,
        "status": "active",
        "frequency": 7,
        "quantity": 2,
        "customer_id": @customer1.id,
        "tea_id": @tea2.id
    }

    post '/api/v1/subscriptions', params: body, as: :json

    result = JSON.parse(response.body, symbolize_names: true)
    expect(response).to be_successful
    expect(result[:response]).to eq("Subscription created!")
  end 

  it "won't create a subscription if data is missing" do 
    body = {
        "title": "My weekly oolong",
        "status": "active",
        "quantity": 2,
        "customer_id": @customer1.id,
        "tea_id": @tea2.id
    }

    post '/api/v1/subscriptions', params: body, as: :json

    result = JSON.parse(response.body, symbolize_names: true)
    expect(response).to_not be_successful
    expect(result[:error]).to eq("Missing data")
  end 
end 