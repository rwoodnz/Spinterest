require 'spec_helper'
require 'sinatra/json'

describe 'Pic Controller' do

  it 'get to pic delivery url' do

    get '/spuns'
    expect(last_response).to be_ok

  end

  it 'request pic content' do


    pic = double(:pic, to_hash: {title: 'cat', url: 'asdf', favorited: true})
    pic2 = double(:pic, to_hash: {title:'kitty', url:'lkjk', favorited: false})
    Pic.stub(:latest_pics).and_return([pic, pic2])
    pic.stub(:favorited_by_user?).and_return(true)
    pic2.stub(:favorited_by_user?).and_return(false)
    pic.stub(:[]=)
    pic2.stub(:[]=)

    get '/spuns?num=2'
    expect(last_response.body).to include('cat')
    expect(last_response.body).to include('lkjk')
    expect(last_response.body).to include('favorited')

  end

  it 'get to post pic content url' do

    post '/spun'
    expect(last_response).to be_ok

  end

  it 'post pic content' do
    pic3 = double(:pic, to_hash: {title:'another cool cat', url: 'http://placekitten.com/302/302'})

    Pic.stub(:create).and_return(pic3)
    post '/spun', title:'another cool cat', url: 'http://placekitten.com/302/302'
    expect(last_response.body).to include('another cool cat')

  end

  describe 'pic favoriting' do

    before do
      User.destroy_all
      Pic.destroy_all
      @bob = double(:user)
      @bob.stub(:favor)
      User.stub(:find_by_id).and_return (@bob)
      @pic = double(:pic)
      @pic.stub(:id)
      Pic.stub(:find_by_id).and_return (@pic)

    end

    it 'get to favorite pic content url' do
      post '/favorite', {num: @pic.id}
      expect(last_response).to be_ok

    end

    it 'got successful confirmation message' do
      post '/favorite', {num: @pic.id}
      expect(last_response.status).to eq(200)
    end

    it 'got failed confirmation message' do
      Pic.stub(:find_by_id)
      post '/favorite', {num: 0}
      expect(last_response.status).to eq(403)
    end


  end

end
