describe "Merchants API", type: :request do
  it "sends a single merchant" do
    # create_list(:merchant, 3)
    merchant_1 = Merchant.create!(name: "Billys Boots")
    merchant_2 = Merchant.create!(name: "Henrys Hats")
    merchant_3 = Merchant.create!(name: "Shirleys Shirts")
    get "/api/v1/merchants/#{merchant_1.id}"

    expect(response).to be_successful

    merchant = JSON.parse(response.body, symbolize_names: true)

    expect(merchant).to have_key(:id)
    expect(merchant[:id]).to be_an(Integer)
    expect(merchant).to have_key(:name)
    expect(merchant[:name]).to be_a(String)
  end
end