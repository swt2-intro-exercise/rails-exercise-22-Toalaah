require 'rails_helper'

RSpec.describe Author, type: :model do
  context 'with valid arguments' do
    it 'should correctly initialize' do
      author = Author.new(first_name: 'Alan', last_name: 'Turing', homepage: 'https://wikipedia.com/Alan_Turing')
      expect(author.first_name).to eq('Alan')
      expect(author.last_name).to eq('Turing')
      expect(author.homepage).to eq('https://wikipedia.com/Alan_Turing')

      expect(author.name).to eq('Alan Turing')
    end
  end

  context 'with invalid arguments' do
    it 'is invalid with an empty last name' do
      author = Author.new(first_name: 'Alan', homepage: 'https://wikipedia.com/Alan_Turing')
      expect(author).not_to be_valid
    end
  end
end
