require 'rails_helper'

describe 'Edit author page', type: :feature do
  it "should update an author's fields when the form is submitted" do
    author = Author.new(first_name: 'Alan', last_name: 'Turing', homepage: 'https://wikipedia.com/Alan_Turing')
    author.save
    expect(author.last_name).to eq('Turing')
    visit edit_author_path(author)
    page.fill_in 'author[last_name]', with: 'Changed'
    find('input[type="submit"]').click
    author.reload
    expect(author.last_name).to eq('Changed')
  end
end
