require 'rails_helper'

RSpec.describe 'authors/index', type: :view do
  # created in author factory
  # You can also create a singe author via: let(:author) { build(:user) }
  let(:authors) { FactoryBot.create_list(:author, 1) }

  before do
    assign(:authors, authors)
  end

  it "shows every available author's name and homepage" do
    render
    author = authors[0]
    assert_select 'tr>td', text: author.name, count: 1
  end

  it 'shows a link to create a new author' do
    render
    expect(rendered).to have_link 'New author', href: new_author_path
  end

  it 'shows a link to delete an existing author' do
    author = authors[0]
    expect(render).to have_link 'Delete', href: author_path(author)
  end
end
