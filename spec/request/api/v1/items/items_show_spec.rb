require 'rails_helper'

describe "Items API", type: :request do
  it "sends a single item" do
    create_list(:merchant, 3)
    create_list(:item, 10)
    merchant_1 = Merchant.create!(name: "Test Merch")
    item_1 = Item.create!(name: "Item", description: "This is the description", unit_price: 12.00, merchant_id: merchant_1.id)
    get "/api/v1/items/#{item_1.id}"

    expect(response).to be_successful

    item = JSON.parse(response.body, symbolize_names: true)

    # binding.pry
    expect(item[:data]).to have_key(:id)
    expect(item[:data][:id]).to be_an(String)
    expect(item[:data]).to have_key(:type)
    expect(item[:data][:type]).to be_a(String)
    expect(item[:data]).to have_key(:attributes)
    expect(item[:data][:attributes]).to have_key(:name)
    expect(item[:data][:attributes]).to have_key(:description)
    expect(item[:data][:attributes]).to have_key(:unit_price)
    # expect(item[:data][:attributes]).to have_key(:merchant_id)
    expect(item[:data][:attributes][:name]).to be_a(String)
    expect(item[:data][:attributes][:description]).to be_a(String)
    expect(item[:data][:attributes][:unit_price]).to be_a(Float)
    # expect(item[:data][:attributes]).to be_a(String)
  end
end