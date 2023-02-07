require 'rails_helper'

describe "Merchants API", type: :request do
  it "sends a list of all merchants" do
    # create_list(:merchant, 3)
    merchant_1 = Merchant.create!(name: "Billys Boots")
    merchant_2 = Merchant.create!(name: "Henrys Hats")
    merchant_3 = Merchant.create!(name: "Shirleys Shirts")
    item_1 = Item.create!(name: "fancy boots", description: "some fancy boots", unit_price: 15.00, merchant_id: merchant_1.id)
    item_2 = Item.create!(name: "big hat", description: "A big hat", unit_price: 20.00, merchant_id: merchant_2.id)
    item_3 = Item.create!(name: "sparkly shirt", description: "A sparkly shirt", unit_price: 35.00, merchant_id: merchant_3.id)
    get "/api/v1/items/#{item_1.id}"

    expect(response).to be_successful

    item = JSON.parse(response.body, symbolize_names: true)


    expect(item).to have_key(:id)
    expect(item[:id]).to be_an(Integer)
    expect(item).to have_key(:name)
    expect(item[:name]).to be_a(String)
    expect(item).to have_key(:description)
    expect(item[:description]).to be_a(String)
    expect(item).to have_key(:unit_price)
    expect(item[:unit_price]).to be_a(Float)
    expect(item).to have_key(:merchant_id)
    expect(item[:merchant_id]).to be_a(Integer)
  end
end