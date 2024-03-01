require 'rails_helper'

RSpec.describe Person, type: :model do
  describe 'validations' do
    it 'is not valid without a name' do
      person = Person.new(name: '')
      expect(person).to_not be_valid
    end

    it 'is valid with a name' do
      person = Person.new(name: 'John')
      expect(person).to be_valid
    end
  end
end