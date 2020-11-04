require 'rails_helper'

RSpec.describe User, type: :model do
  context 'Initiating object' do
    it 'creates a new object' do
      u = User.new
      expect(u).to be_a(Object)
    end

    it 'assigns the values passed' do
      u = User.new({ Username: 'Polos' })
      expect(u.Username).to eql('Polos')
    end
  end

  context 'Testing validations' do
    it 'validates the object without attributes to be invalid' do
      u = User.new
      expect(u.valid?).to be_falsy
    end

    it 'validates the object to with proper attributes to be valid' do
      u = User.new(Username: 'Polos', FullName: 'Paul Polos')
      expect(u.valid?).to be_truthy
    end

    it 'validates Username uniqueness' do
      u = User.new(Username: 'Polos', FullName: 'Paul Polos')
      u.save
      u2 = User.new(Username: 'Polos', FullName: 'Paul Polos')
      expect(u2.valid?).to be_falsy
    end

    it 'validates the Username is no more than 12 characters' do
      u = User.new(Username: 'El_derpodddssspppeeeccc', FullName: 'Paul Polos')
      expect(u.valid?).to be_falsy
    end
  end

  context 'Testing associations' do
    it 'has many opinions' do
      u = User.new(Username: 'Polos', FullName: 'Paul Polos')
      u.save
      expect(u.opinions.empty?).to be_truthy
    end

    it 'has many follower_relationships' do
      u = User.new(Username: 'Polos', FullName: 'Paul Polos')
      u.save
      expect(u.follower_relationships.empty?).to be_truthy
    end

    it 'has many followers' do
      u = User.new(Username: 'Polos', FullName: 'Paul Polos')
      u.save
      expect(u.followers.empty?).to be_truthy
    end

    it 'has many following_relationships' do
      u = User.new(Username: 'Polos', FullName: 'Paul Polos')
      u.save
      expect(u.following_relationships.empty?).to be_truthy
    end

    it 'has many following' do
      u = User.new(Username: 'Polos', FullName: 'Paul Polos')
      u.save
      expect(u.following.empty?).to be_truthy
    end

  end
end
