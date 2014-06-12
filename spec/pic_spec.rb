require 'spec_helper'

describe Pic do

  let(:pic) {Pic.new(title: 'coolcat')}

  it 'exists' do
    expect(pic).to be_a(Pic)

  end

  it 'has a title' do
    expect(pic.title).to eq 'coolcat'
  end

end
