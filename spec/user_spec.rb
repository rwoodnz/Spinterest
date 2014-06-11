require 'spec_helper'

describe User do
  let (:user) {User.new(username: 'Widdershin')}

  it 'exists' do
    expect(user).to be_a(User)
  end

  it 'has a username' do
    expect(user.username).to eq 'Widdershin'
  end

  it 'can set a password' do
    user.set_password('test')

    expect(user.password_hash).to eq PasswordHasher.hash_password('test')
  end

end
