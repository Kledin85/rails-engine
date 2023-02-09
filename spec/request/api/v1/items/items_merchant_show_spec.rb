require 'rails_helper'

describe "Items API", type: :request do
  it "sends a single items merchant" do
    create_list(:merchant, 3)
    create_list(:item, 10)
    merchant_1 = Merchant.create!(name: "Test Merch")
    item_1 = Item.create!(name: "Item", description: "This is the description", unit_price: 12.00, merchant_id: merchant_1.id)
    get "/api/v1/items/#{item_1.id}/merchant"

    expect(response).to be_successful

    item_merchant = JSON.parse(response.body, symbolize_names: true)


    #  binding.pry

    expect(item_merchant).to have_key(:data)
    expect(item_merchant[:data]).to have_key(:id)
    expect(item_merchant[:data][:id]).to eq(merchant_1.id.to_s)
    expect(item_merchant[:data][:attributes]).to have_key(:name)
    expect(item_merchant[:data][:attributes][:name]).to eq(merchant_1.name)
  end
end