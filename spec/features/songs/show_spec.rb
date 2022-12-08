require 'rails_helper'

RSpec.describe 'the songs show page' do
  it 'shows individual song title' do
    artist = Artist.create(name: 'Stinky Pete')
    song1 = artist.songs.create!(title: "I Really Like You", length: 208, play_count: 2456357, artist: artist)
    song2 = artist.songs.create!(title: "I Stink", length: 500, play_count: 25482, artist: artist)
    
    visit "/songs/#{song1.id}"

    expect(page).to have_content(song1.title)
    expect(page).to_not have_content(song2.title)
  end

  it 'displays the name of the artist for the song' do
    artist = Artist.create(name: 'Stinky Pete')
    song1 = artist.songs.create!(title: "I Really Like You", length: 208, play_count: 2456357, artist: artist)
    song2 = artist.songs.create!(title: "I Stink", length: 500, play_count: 25482, artist: artist)
    
    visit "/songs/#{song1.id}"
    
    expect(page).to have_content(artist.name)
  end
end