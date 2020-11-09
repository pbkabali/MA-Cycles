require 'rails_helper'

RSpec.describe Opinion, type: :model do
  context 'Initiating object' do
    it 'creates a new object' do
      o = Opinion.new
      expect(o).to be_a(Object)
    end

    it 'assigns the values passed' do
      o = Opinion.new({ Text: 'My crazy post' })
      expect(o.Text).to eql('My crazy post')
    end
  end

  context 'Testing validations' do
    it 'validates the object without attributes to be invalid' do
      o = Opinion.new
      expect(o.valid?).to be_falsy
    end

    it 'validates the object with proper attributes to be valid' do
      u = User.new(Username: 'Polos', FullName: 'Paul Polos')
      u.save
      o = Opinion.new(AuthorId: u.id, Text: 'Crazy jus')
      expect(o.valid?).to be_truthy
    end

    it 'validates text presence' do
      u = User.new(Username: 'Polos', FullName: 'Paul Polos')
      u.save
      o = Opinion.new(AuthorId: u.id, Text: ' ')
      expect(o.valid?).to be_falsy
    end
  end

  context 'Testing associations' do
    it 'belongs to a user' do
      u = User.new(Username: 'Polos', FullName: 'Paul Polos')
      u.save
      o = Opinion.new(AuthorId: u.id, Text: 'Crazy jus')
      expect(o.author.Username).to eql(u.Username)
    end
  end
end
