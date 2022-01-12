require 'rails_helper'

RSpec.describe "Get all customer subscriptions" do 
  before :each do

    @customer1 = Customer.create!(first_name: 'Ida', last_name: 'Olson', email: 'idao@email.com', address: '1108 Ichabod St, North Pole, AK 99705')
    @customer2 =Customer.create!(first_name: 'Sarah', last_name: 'Carter', email: 'sarahc@email.com', address: '1300 Becky St, North Pole, AK 99705')
    @customer3 =Customer.create!(first_name: 'Doug', last_name: 'Olson', email: 'dougo@email.com', address: '2591 Garnet Dr, North Pole, AK 99705')
    @tea1 = Tea.create!(title: 'Masala chai', description: 'The traditional drink of India and defined as a blend of black tea, milk, sugar, and spices.', temperature: '212', brew_time: '5')
    @tea2 = Tea.create!(title: 'Oolong', description: 'A traditional semi-oxidized Chinese tea produced through a process including withering the plant under strong sun and oxidation before curling and twisting.', temperature: '205', brew_time: '4')
    @tea3 = Tea.create!(title: 'Green tea', description: 'A tea made from Camellia sinensis leaves and buds that have not undergone the same withering and oxidation process used to make oolong teas and black teas.', temperature: '185', brew_time: '3')
    @tea4 = Tea.create!(title: 'Chamomile tea', description: 'An herbal drink made from dried chamomile flowers steeped in water.', temperature: '208', brew_time: '5')
    @subscription1 = Subscription.create!(title: 'My weekly oolong', price: 7.99, status: 'cancelled', frequency: 7, quantity: 2, customer_id: @customer1.id, tea_id: @tea2.id)
    @subscription2 = Subscription.create!(title: 'Green tea me', price: 10.99, status: 'active', frequency: 14, quantity: 3, customer_id: @customer1.id, tea_id: @tea3.id)
    @subscription3 = Subscription.create!(title: 'Chai in the sky', price: 25.99, status: 'active', frequency: 30, quantity: 1, customer_id: @customer1.id, tea_id: @tea1.id)
  end 

  it "returns all of a customers subscriptions both cancelled and active" do
    get "/api/v1/customers/#{@customer1.id}/subscriptions", params: body, as: :json
    result = JSON.parse(response.body, symbolize_names: true)
    data = result[:data].first
    expect(response).to be_successful
    expect(result).to be_a Hash
    expect(data).to be_a Hash
    expect(data.count).to eq(3)
    expect(data).to have_key(:id)
    expect(data).to have_key(:type)
    expect(data[:type]).to eq('subscription')
    expect(data).to have_key(:attributes)
    expect(data[:attributes].size).to eq(6)
    expect(data[:attributes]).to have_key(:title)
    expect(data[:attributes]).to have_key(:price)
    expect(data[:attributes]).to have_key(:status)
    expect(data[:attributes][:status]).to eq('cancelled')
    expect(data[:attributes]).to have_key(:frequency)
    expect(data[:attributes]).to have_key(:quantity)
    expect(data[:attributes]).to have_key(:tea_id)
  end 
end
