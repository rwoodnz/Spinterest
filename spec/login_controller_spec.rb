require 'spec_helper'

describe 'Login Controller' do

  describe 'logging in' do

    before do
      user = double(:user)
      User.stub(:find_by_username).with('testuser') {user}
      user.stub(:check_password).with('blah') {false}
      user.stub(:check_password).with('test') {true}
    end

    context 'correct credentials' do

      it 'redirects you to profile page' do
        post '/login', {username: 'testuser', password:'test'}
        expect(last_response).to be_redirect
        expect(last_response.location).to include '/profile'
      end
    end

    context 'incorrect credentials' do
      it 'redirects you to the home page' do
        post '/login', {username: 'testuser', password:'blah'}

        expect(last_response).to be_redirect
        expect(last_response.location).to eq 'http://example.org/'
      end
    end
  end
end
