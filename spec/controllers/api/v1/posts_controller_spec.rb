describe Api::V1::PostsController do

  let(:user) { FactoryGirl.create(:user) }
  let!(:posts) { FactoryGirl.create_list(:post, 15) }

  describe 'get posts' do
    it 'returns all posts' do
      get :index, format: :json
      response.should have_http_status(:success)

      res = JSON.parse(response.body)['posts']

      res.should have_attributes size: 15
      res[0]['published_at'].should be > res[1]['published_at']
    end

    it 'returns 5 posts' do
      get :index, format: :json, params: { per_page: 5 }
      response.should have_http_status(:success)

      res = JSON.parse(response.body)['posts']

      res.should have_attributes size: 5
      res[0]['published_at'].should be > res[1]['published_at']
    end
  end

  describe 'get one post' do
    it 'returns post' do
      get :show, format: :json, params: { id: posts[0].id }
      response.should have_http_status(:success)

      res = JSON.parse(response.body)['post']

      res['id'].should be posts[0].id
    end

    it 'don\'t return post with bad id' do
      get :show, format: :json, params: { id: 1010102 }
      response.should have_http_status :success

      res = JSON.parse response.body

      res.should have_key 'errors'
      res['errors'][0]['code'].should be == 9
    end
  end

  describe 'creating post' do
    it 'returns errors' do
      post :create, format: :json
      response.should have_http_status(:success)

      res = JSON.parse(response.body)

      res.should have_key 'errors'
      res = res['errors']
      res.should have_attributes(size: 3)
      res[0]['code'].should be == 1
    end

    it 'returns error' do
      post :create, format: :json, params: { title: 'post 1', body: 'bb' }
      response.should have_http_status(:success)

      res = JSON.parse(response.body)

      res.should have_key 'errors'
      res = res['errors']
      res.should have_attributes(size: 1)
      res[0]['code'].should be == 1
    end

    it 'returns error' do
      post :create, format: :json, params: { auth_token: user.auth_token, title: 'the post' }
      response.should have_http_status(:success)

      res = JSON.parse(response.body)

      res.should have_key 'errors'
      res = res['errors']
      res.should have_attributes(size: 1)
      res[0]['code'].should be == 3
    end

    it 'returns error' do
      post :create, format: :json, params: { auth_token: user.auth_token, body: 'the post' }
      response.should have_http_status(:success)

      res = JSON.parse(response.body)

      res.should have_key 'errors'
      res = res['errors']
      res.should have_attributes(size: 1)
      res[0]['code'].should be == 2
    end

    it 'returns ok' do
      post :create, format: :json, params: { title: 'poop', body: 'oolo', auth_token: user.auth_token }
      response.should have_http_status(:success)

      res = JSON.parse(response.body)

      res.should have_key 'post'
      res = res['post']

      id, title, body, author_nickname = res['id'], res['title'], res['body'], res['author_nickname']

      title.should be == 'poop'
      body.should be == 'oolo'
      author_nickname.should be == user.nickname
      id.should be == posts[-1].id + 1
    end
  end

end
