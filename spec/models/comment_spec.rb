describe Comment do

  let(:user) { FactoryGirl.create(:user) }
  let(:post) { FactoryGirl.create(:post) }

  before do
    @comment = Comment.new body: 'comment one', author: user, post: post, published_at: DateTime.now
    @comment_without_published_at = Comment.new body: 'comment one', author: user, post: post
  end

  subject { @comment }

  it { should respond_to(:body)}
  it { should respond_to(:author) }
  it { should respond_to(:author_id) }
  it { should respond_to(:post) }
  it { should respond_to(:post_id) }
  it { should respond_to(:published_at) }
  it { should be_valid }

  describe 'without published_at ' do

    subject { @comment_without_published_at }

    it { should respond_to(:body)}
    it { should respond_to(:author) }
    it { should respond_to(:author_id) }
    it { should respond_to(:post) }
    it { should respond_to(:post_id) }
    it { should respond_to(:published_at) }
    it { should be_valid }

    describe 'after save' do

      before { @comment_without_published_at.save! }

      its(:published_at) { should_not be_nil }

    end

  end

end
