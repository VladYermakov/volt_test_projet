describe Api::V1::SessionsController do

  before do
    @user = User.create nickname: 'vlad', email: 'yermakov.v.o@gmail.com',
                        password: '123123123',
                        password_confirmation: '123123123'

  end

  describe 'GET #create' do
    it 'returns auth_token' do
      get :create, format: :json, params: { nickname: @user.nickname, password: '123123123' }
      expect(response).to have_http_status(:success)

      res = JSON.parse response.body

      @user = User.find_by nickname: @user.nickname

      res.should have_key 'auth_token'
      res['auth_token'].should be == @user.auth_token
    end

    it 'returns error' do
      get :create, format: :json, params: { nickname: @user.nickname, password: 'ssssssss' }
      expect(response).to have_http_status(:success)

      res = JSON.parse response.body

      res.should have_key 'errors'
      res['errors'][0]['code'].should be == 7
    end

    it 'returns error' do
      get :create, format: :json, params: { nickname: @user.nickname}
      expect(response).to have_http_status(:success)

      res = JSON.parse response.body

      res.should have_key 'errors'
      res['errors'][0]['code'].should be == 5
    end

    it 'returns error' do
      get :create, format: :json, params: { password: 'ssssssss' }
      expect(response).to have_http_status(:success)

      res = JSON.parse response.body

      res.should have_key 'errors'
      res['errors'][0]['code'].should be == 4
    end

    it 'returns error' do
      get :create, format: :json, params: { email: @user.nickname, password: 'ssssssss' }
      expect(response).to have_http_status(:success)

      res = JSON.parse response.body

      res.should have_key 'errors'
      res['errors'][0]['code'].should be == 6
    end

    it 'returns auth_token' do
      get :create, format: :json, params: { email: @user.email, password: '123123123' }
      expect(response).to have_http_status(:success)

      res = JSON.parse response.body

      @user = User.find_by nickname: @user.nickname

      res.should have_key 'auth_token'
      res['auth_token'].should be == @user.auth_token
    end
  end

end
