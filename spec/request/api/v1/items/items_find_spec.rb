require 'rails_helper'

describe "Items API", type: :request do
  it "it can find a item based on its name" do
    create_list(:merchant, 14)
    create(:item, name: "Turing")
    create(:item, name: "Ring World")
    
    item = Item.first

    get "/api/v1/items/find?name=ring"

    found_item = JSON.parse(response.body, symbolize_names: true)
    expect(response).to be_successful

    expect(found_item[:data][:id]).to be_a(String)
    expect(found_item[:data][:type]).to be_a(String)
    expect(found_item[:data][:attributes]).to be_a(Hash)
    expect(found_item[:data][:attributes][:name]).to eq("Ring World")
    
  end

  it "it can find a item based on its min price" do
    create_list(:merchant, 14)
    create(:item, name: "Turing", unit_price: 75.23)
    create(:item, name: "Ring World", unit_price: 35.45)
    

    get "/api/v1/items/find?min_price=50"

    found_item = JSON.parse(response.body, symbolize_names: true)
    expect(response).to be_successful

    expect(found_item[:data][:id]).to be_a(String)
    expect(found_item[:data][:type]).to be_a(String)
    expect(found_item[:data][:attributes]).to be_a(Hash)
    expect(found_item[:data][:attributes][:name]).to eq("Turing")

  end

  it "it can find a item based on its max price" do
    create_list(:merchant, 14)
    create(:item, name: "Turing", unit_price: 75.23)
    create(:item, name: "Ring World", unit_price: 35.45)
    

    get "/api/v1/items/find?max_price=50"

    found_item = JSON.parse(response.body, symbolize_names: true)
    expect(response).to be_successful

    expect(found_item[:data][:id]).to be_a(String)
    expect(found_item[:data][:type]).to be_a(String)
    expect(found_item[:data][:attributes]).to be_a(Hash)
    expect(found_item[:data][:attributes][:name]).to eq("Ring World")

  end
  it "it can find a item based on its min and max price" do
    create_list(:merchant, 14)
    create(:item, name: "Turing", unit_price: 75.23)
    create(:item, name: "Kazoo", unit_price: 50.00)
    create(:item, name: "Ring World", unit_price: 35.45)
    

    get "/api/v1/items/find?min_price=40&max_price=70"

    found_item = JSON.parse(response.body, symbolize_names: true)
    expect(response).to be_successful

    expect(found_item[:data][:id]).to be_a(String)
    expect(found_item[:data][:type]).to be_a(String)
    expect(found_item[:data][:attributes]).to be_a(Hash)
    expect(found_item[:data][:attributes][:name]).to eq("Kazoo")

  end
end