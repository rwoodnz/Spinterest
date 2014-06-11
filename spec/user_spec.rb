require 'spec_helper'

describe User do

  it 'exists' do
    user = User.new
    expect(user).to be_a(User)

  end

end
