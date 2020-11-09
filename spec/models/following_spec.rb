require 'rails_helper'

RSpec.describe Following, type: :model do
  context 'Initiating object' do
    it 'creates a new object' do
      f = Following.new
      expect(f).to be_a(Object)
    end
  end

  context 'Attribute validations' do
    it 'validates following without users to be invalid' do
      f = Following.new
      expect(f.valid?).to be_falsy
    end

    it 'checks that a user doesnt follow themselves' do
      u = User.new(Username: 'Polos', FullName: 'Paul Polos')
      u.save
      f = Following.new(FollowerId: u.id, FollowedId: u.id)
      expect(f.valid?).to be_falsy
    end

    it 'finds the friendship object with correct attributes to be valid' do
      u = User.new(Username: 'Polos', FullName: 'Paul Polos')
      u.save
      u2 = User.new(Username: 'Polos2', FullName: 'Paul Polos')
      u2.save
      f = Following.new(FollowerId: u.id, FollowedId: u2.id)
      expect(f.valid?).to be_truthy
    end
  end

  context 'Association tests' do
    it 'associates follower and followed' do
      u = User.new(Username: 'Polos', FullName: 'Paul Polos')
      u.save
      u2 = User.new(Username: 'Polos2', FullName: 'Paul Polos')
      u2.save
      f = Following.new(FollowerId: u.id, FollowedId: u2.id)
      expect(f.follower.Username).to eql(u.Username)
      expect(f.followed.Username).to eql(u2.Username)
    end
  end
end
