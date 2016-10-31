require 'rails_helper'

RSpec.describe Api::V1::UsersController, type: :controller do

  describe 'create new user' do
    it 'returns id and auth_token' do
      get :create, format: :json, params: { user: { nickname: 'user new', email: 'user@emial.com', password: '123123123'} }
      response.should have_http_status(:success)

      res = JSON.parse response.body

      res.should have_key 'id'
      res.should have_key 'auth_token'

      res['id'].should_not be_nil
      res['auth_token'].should_not be_nil
    end

    it 'returns null' do
      get :create, format: :json, params: { user: { nickname: 'user', email: 'user@emial.com'} }
      response.should have_http_status(:success)

      res = JSON.parse response.body

      res.should have_key 'id'
      res.should have_key 'auth_token'

      res['id'].should be_nil
      res['auth_token'].should be_nil
    end

  end

end
