require 'rails_helper'

describe Github::Api, type: :model do
  let(:dummy_class) do
    Class.new do
      include Github::Api
      get :all, uri: '/users/:username/repos'
    end
  end

  describe 'endpoint' do
    subject { dummy_class.new }
    it { is_expected.to be_respond_to :all }
  end
 end
