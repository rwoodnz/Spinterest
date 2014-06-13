require 'spec_helper'

describe User do
  let (:user) {User.new(username: 'Widdershin')}

  it 'exists' do
    expect(user).to be_a(User)
  end

  it 'has a username' do
    expect(user.username).to eq 'Widdershin'
  end

  context 'passwords' do

    before { user.set_password('test') }

    it 'can set a password hash' do
      expect(user.password_hash).to eq PasswordHasher.hash_password('test', user.password_salt)
    end

    describe 'check password' do

      it 'returns true if correct password' do
        expect(user.check_password('test')).to be_true
      end

      it 'returns false if password is wrong' do
        expect(user.check_password('blah')).to be_false
      end
    end
  end

  it 'favor status can be toggled' do
    pic = Pic.create(title: 'Wow cat', url:'asdf')
    user.save

    user.toggle_favor(pic)

    expect(pic.favorited_by_user?(user)).to be_true
    user.toggle_favor(pic)

    expect(pic.favorited_by_user?(user)).to be_false
  end

end
