require 'rails_helper'

RSpec.describe 'Member Search', type: :feature do
  it 'sucessfully finds members of a nation and list the first 25' do 
    visit root_path

    expect(page).to have_select(:nation, with_options: ['Air Nomads', 'Earth Kingdom', 'Water Tribes', 'Fire Nation'])
    select 'Fire Nation', from: :nation
    expect(page).to have_select(:nation, selected: 'Fire Nation')

    expect(page).to have_button("Search For Members")
    click_on "Search For Members"

    expect(current_path).to eq(search_path)

    within(first('.member')) do
      expect(page).to have_css('.name')
      expect(page).to have_css('.allias')
      expect(page).to have_css('.enemies')
      expect(page).to have_css('.affiliations')
    end
  end
end