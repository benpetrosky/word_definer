require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('word', {:type => :feature}) do
  it('processes user entry and adds the word to word bank') do
    visit('/')
    click_on('Add a new word')
    expect(page).to have_content('Fill in a word')
  end
  it('processes user word entry') do
    visit('/words/new')
    fill_in('word', :with => "dog")
    click_on('Add the Word')
    click_on('Back Word list')
    expect(page).to have_content("dog")
  end
  it('processes definitions properly') do
    visit('/words/')
    fill_in('definition', :with => 'enemy of felines')
    click_on('Add definition to Word')
    expect(page).to have_content('enemy of felines')
  end
end
