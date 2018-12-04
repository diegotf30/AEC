require 'spec_helper'

describe 'Country Requests' do
  it 'sends a list of countries' do
    create_list(:country, 10)

    get '/countries'

    expect(response.status).to eq 302
    expect(json.length).to eq 10
  end

  it 'creates a country' do
    post "/countries", params: country_params

    expect(response.status).to eq 302
    expect(json['name']).to eq 'México eme eh acento equis i ce oh'
  end

  it 'updates country details' do
    country = create :country

    patch "/countries/#{country.id}", params: country_params

    expect(response.status).to eq 302
    expect(json['name']).to eq 'México eme eh acento equis i ce oh'
  end

  it 'deletes countries' do
    country = create :country

    delete "/countries/#{country.id}"

    expect(response.status).to eq 302
  end

  def country_params
    {
      country: {
        name: 'México, eme eh acento equis i ce oh'
      }
    }.to_json
  end
end