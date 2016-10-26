require 'rails_helper'
require 'spec_helper'

describe Post do

  let(:user) { FactoryGirl.create(:user) }

  before do
    @post = Post.new title: 'post', body: 'post one', published_at: DateTime.now, author: user
    @post_without_published_at = Post.new title: 'post2', body: 'post two', author: user
  end

  subject { @post }

  it { should respond_to(:title) }
  it { should respond_to(:body) }
  it { should respond_to(:published_at) }
  it { should respond_to(:author) }
  it { should respond_to(:author_id) }
  it { should be_valid }

  describe 'without published_at' do

    subject { @post_without_published_at }

    it { should respond_to(:title) }
    it { should respond_to(:body) }
    it { should respond_to(:published_at) }
    it { should respond_to(:author) }
    it { should respond_to(:author_id) }
    it { should be_valid }

    describe 'after save' do

      before { @post_without_published_at.save! }

      its(:published_at) { should_not be_nil }

    end

  end

end
