describe Api::V1::ReportsController do

  let!(:users) { FactoryGirl.create_list(:user, 25)}
  let!(:posts) { FactoryGirl.create_list(:post, 25)}
  let!(:comments) { FactoryGirl.create_list(:comment, 25)}

  describe 'getting report' do
    it 'returns message' do
      post :show, format: :json, params: { email: 'yermakov.v.o@gmail.com' }
      expect(response).to have_http_status(:success)

      res = JSON.parse response.body

      res.should have_key 'message'
    end

    it 'returns error if no email' do
      post :show, format: :json
      expect(response).to have_http_status(:success)

      res = JSON.parse response.body

      res.should have_key 'errors'
      res['errors'][0]['code'] == 10
    end
  end

end
