require 'rails_helper'

RSpec.describe Detail, type: :model do
  describe 'validations' do
    it 'is not valid without a email' do
      detail = Detail.new(email: '')
      expect(detail).to_not be_valid
    end

    it 'is valid with a email' do
     person = Person.create(name: "john")
      detail = Detail.new(email: 'john@email.com', person_id: person.id)
      expect(detail).to be_valid
    end
  end
end