describe JsonHelper do

  let(:user) { FactoryGirl.create(:user)}

  it 'returns nil' do
    helper.from_json('{"errors":[{"code":1,"message":"suka"}]}').should be_nil
  end

  it 'returns User' do
    helper.from_json('{"user":{"nickname":"vlad","email":"vlad@v.com","password_digest":"12313","auth_token":"12333"}}')
      .should be_instance_of User
  end

  it 'returns nil' do
    helper.from_json('{"author":{"nickname":"vlad","email":"vlad@v.com","password_digest":"12313","auth_token":"12333"}}')
      .should be_nil
  end

  it 'returns Post' do
    post = Post.create title: 'one', body: 'post one', author: user
    helper.from_json(post.to_json).should be == post
  end

end