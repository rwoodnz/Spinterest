require 'spec_helper'
require 'sinatra/json'

describe 'Pic Controller' do

  it 'get to pic delivery url' do

    get '/spuns'
    expect(last_response).to be_ok

  end

  it 'request pic content' do

    pic = double(:pic, to_hash: {title: 'cat', url: 'asdf'})

    pic2 = double(:pic, to_hash: {title:'kitty', url:'lkjk'})
    Pic.stub(:latest_pics).and_return([pic, pic2])

    get '/spuns?num=2'
    expect(last_response.body).to include('cat')
    expect(last_response.body).to include('lkjk')

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

end
