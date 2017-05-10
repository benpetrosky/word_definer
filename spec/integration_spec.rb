require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('word', {:type => :feature}) do
  it('processes user entry and adds the word to word bank') do
    visit('/')
    expect(page).to have_content('Lets Learn Some Words')
  end
  it('processes user word entry') do
    visit('/words/new')
    fill_in("word", :with => 'dog')
    click_button('Add the Word')
    visit('/words')
    expect(page).to have_content('dog')

  end
  it('takes you to the individual word page') do
  visit('/words/new')
  fill_in("word", :with => 'dog')
  click_button('Add the Word')
  visit('/words')
  visit('/words/1')
  fill_in("definition", :with => "enemy of felines")
  click_button('Add definition to Word')
  expect(page).to have_content('dog enemy of felines')
  end
end
