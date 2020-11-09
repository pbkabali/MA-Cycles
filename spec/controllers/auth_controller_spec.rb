require 'rails_helper'

RSpec.describe AuthController do
  describe 'POST create' do
    it 'assigns @user' do
      u = User.create!(Username: 'Name', FullName: 'Name Name')
      post :create, params: { auth: { Username: 'Name' } }
      expect(assigns(:user).Username).to eq(u.Username)
    end
  end
end
