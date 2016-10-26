require 'rails_helper'
require 'spec_helper'

describe Api::V1::PostsController do

  let!(:posts) { FactoryGirl.create_list(:post, 15) }

  describe 'GET #index' do
    it 'returns http success' do
      get :index, format: :json
      expect(response).to have_http_status(:success)
      puts response.body
    end
  end

  describe 'GET #show' do
    it 'returns http success' do
      get :show, format: :json, params: { id: posts[0].id }
      expect(response).to have_http_status(:success)
      puts response.body
    end
  end

  describe 'POST #create' do
    it 'returns http success' do
      post :create, format: :json
      expect(response).to have_http_status(:success)
      puts response.body
    end
  end

end
