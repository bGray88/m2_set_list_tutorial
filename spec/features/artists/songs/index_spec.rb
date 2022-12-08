require 'rails_helper'

RSpec.describe 'Artists songs index' do
  before :each do
    @artist = Artist.create!(name: 'Eugene')
    @rain   = @artist.songs.create!(title: 'Rains a Fallin\'', length: 845, play_count: 8599)
    @chick  = @artist.songs.create!(title: 'Chicken Pluckin\'', length: 555, play_count: 8009)
    @truck  = @artist.songs.create!(title: 'Four Wheel Truckin\'', length: 795, play_count: 5564)
  end
  it 'shows all of the songs for the artist' do
    visit "/artists/#{@artist.id}/songs"

    expect(page).to have_content(@rain.title)
    expect(page).to have_content(@chick.title)
  end

  it 'links to each songs show page' do
    visit "/artists/#{@artist.id}/songs"

    click_on @rain.title

    expect(current_path).to eq("/songs/#{@rain.id}")
  end

  it 'shows the average song length for the artist' do
    visit "/artists/#{@artist.id}/songs"

    expect(page).to have_content("Average Song Length for Eugene: 731.67")
  end
end