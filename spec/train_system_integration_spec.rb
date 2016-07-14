require('capybara/rspec')
require './app'
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('the admin path', {:type => :feature}) do
  it 'allows users to view the site' do
    visit('/')
    expect(page).to have_content('Train riders')
    expect(page).to have_content('Train conductors')
    click_button('Train conductors')
    expect(page).to have_content('Do you want to Add?')
    click_button('Add City')
    fill_in('add_city' :with => 'prague')
    fill_in('add_line' :with => 'blue')
    fill_in('arr' :with => '12:10:01')
    fill_in('dep' :with => '01:11:03')
    click_button('Add Line')
    fill_in('add_line' :with => 'green')
    fill_in('add_city' :with => 'lisbon')
    fill_in('arr' :with => '12:10:01')
    fill_in('dep' :with => '01:11:03')
  end
end
