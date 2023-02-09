require 'rails_helper'

describe "Items API", type: :request do
  it "sends a list of a merchants items" do
    create_list(:merchant, 3)
    create_list(:item, 10)
    merchant_1 = Merchant.create!(name: "Test Merch")
    item_1 = Item.create!(name: "Item_1", description: "This is the description", unit_price: 12.00, merchant_id: merchant_1.id)
    item_2 = Item.create!(name: "Item_2", description: "WHOPPPPER WHOPPER", unit_price: 12.00, merchant_id: merchant_1.id)
    item_3 = Item.create!(name: "Item_3", description: "Tripple double", unit_price: 12.00, merchant_id: merchant_1.id)
    get "/api/v1/merchants/#{merchant_1.id}/items"

    expect(response).to be_successful

    merchant_items = JSON.parse(response.body, symbolize_names: true)


    # binding.pry
    merchant_items[:data].each do |item|

    expect(item).to have_key(:id)
    expect(item[:id]).to be_a(String)
    expect(item).to have_key(:type)
    expect(item[:type]).to be_a(String)
    expect(item).to have_key(:attributes)
    expect(item[:attributes]).to be_a(Hash)
    expect(item[:attributes]).to have_key(:name)
    expect(item[:attributes]).to have_key(:description)
    expect(item[:attributes]).to have_key(:unit_price)
    expect(item[:attributes]).to have_key(:merchant_id)
    expect(item[:attributes][:name]).to be_a(String)
    expect(item[:attributes][:description]).to be_a(String)
    expect(item[:attributes][:unit_price]).to be_a(Float)
    expect(item[:attributes][:merchant_id]).to be_a(Integer)
    end
  end
end