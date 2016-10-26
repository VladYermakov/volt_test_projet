require 'rails_helper'
require 'spec_helper'

describe User do

  before do
    @user = User.new nickname: 'vlad', email: 'yermakov@gmail.com',
                     password: '12312312', password_confirmation: '12312312'
  end

  subject { @user }

  it { should respond_to(:nickname) }
  it { should respond_to(:email) }
  it { should respond_to(:password_digest) }
  it { should respond_to(:auth_token) }
  it { should respond_to(:password) }
  it { should respond_to(:password_confirmation) }
  it { should respond_to(:authenticate) }
  it { should respond_to(:comments) }
  it { should respond_to(:posts) }
  it { should be_valid }
  its(:auth_token) { should be_blank}

  describe 'after save' do
    before { @user.save! }

    its(:auth_token) { should_not be_blank}
  end

end