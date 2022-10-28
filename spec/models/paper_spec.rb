require 'rails_helper'

RSpec.describe Paper, type: :model do
  context 'with valid arguments' do
    it 'should correctly initialize' do
      paper = Paper.new(title: 'Test', venue: 'Venue', year: 1219)
      expect(paper.title).to eq('Test')
      expect(paper.venue).to eq('Venue')
      expect(paper.year).to eq(1219)
    end
  end

  context 'with invalid arguments' do
    it 'is invalid with an empty title' do
      paper = Paper.new(venue: 'Venue', year: 1219)
      expect(paper).not_to be_valid
    end

    it 'is invalid with a negative year' do
      paper = Paper.new(title: 'Test', venue: 'Venue', year: -100)
      expect(paper).not_to be_valid
    end
  end
end
