require 'rails_helper'

RSpec.describe UsersController do
  describe 'POST create' do
    it 'assigns @user' do
      post :create, params: { user: { Username: 'Name', FullName: 'Name Name' } }
      expect(assigns(:user).Username).to eq('Name')
    end
  end
end
