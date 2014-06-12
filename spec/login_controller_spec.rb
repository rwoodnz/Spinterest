require 'spec_helper'

describe 'Login Controller' do

  describe 'logging in' do

    before do
      user = double(:user, id: 1)
      User.stub(:find_by_username).with('testuser') {user}
      user.stub(:check_password).with('blah') {false}
      user.stub(:check_password).with('test') {true}
    end

    context 'correct credentials' do

      before do
        post '/login', {username: 'testuser', password:'test'}
      end

      it 'redirects you to your previous page' do
        expect(last_response).to be_redirect
        expect(last_response.location).to eq 'http://example.org/login'
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
