require 'rails_helper'

describe "Items API", type: :request do
  it "it can find all merchants based on its name" do
    create_list(:merchant, 14)
    create(:merchant, name: "Turing")
    create(:merchant, name: "Ring World")
    
    item = Item.first

    get "/api/v1/merchants/find_all?name=ring"

    found_item = JSON.parse(response.body, symbolize_names: true)
    # binding.pry
    expect(response).to be_successful

    expect(found_item[:data][0][:id]).to be_a(String)
    expect(found_item[:data][0][:type]).to be_a(String)
    expect(found_item[:data][0][:attributes]).to be_a(Hash)
    expect(found_item[:data][0][:attributes][:name]).to eq("Ring World")
    expect(found_item[:data][1][:attributes][:name]).to eq("Turing")
    
  end
end