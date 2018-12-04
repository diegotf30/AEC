require 'spec_helper'

describe Auth::RegistrationsController do
  describe '#create' do
    before :each do
      @request.env["devise.mapping"] = Devise.mappings[:member]
    end

    context 'when member is unauthenticated' do
      it 'registers successfully' do
        post :create, params: signup_params

        expect(response.status).to eq 302
      end
    end

    context 'when member already exists' do
      it 'returns error' do
        create :member, email: 'diego@gmail.com'
        post :create, params: signup_params

        expect(response.status).to eq 200
        expect(json['errors'].first['title']).to eq('Bad Request')
      end
    end
  end

  def signup_params
    {
      member: {
        email: 'diego@gmail.com',
        password: 'foobar123'
      }
    }
  end
end