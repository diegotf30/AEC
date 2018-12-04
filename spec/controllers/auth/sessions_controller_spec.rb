require 'spec_helper'

describe Auth::SessionsController do
  before :each do
    @request.env["devise.mapping"] = Devise.mappings[:member]
  end

  describe '#create' do
    context 'when member is not found' do
      it 'returns unauthorized' do
        post :create, params: session_params

        expect(response.status).to eq 200
      end
    end

    context 'when member exists' do
      it 'logs member in' do
        member = create :member, email: 'diego@gmail.com', password: 'foobar123' 

        post :create, params: session_params

        expect(response).to have_http_status(302)
        expect(json['name']).to eq(member.name)
        expect(json['email']).to eq(member.email)
      end
    end
  end

  describe '#destroy' do
    it 'returns 204, no content' do
      delete :destroy, params: session_params

      expect(response).to have_http_status(204)
    end
  end

  def session_params
    {
      member: {
        email: 'diego@gmail.com',
        password: 'foobar123'
      }
    }
  end
end