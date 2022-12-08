require 'rails_helper'

RSpec.describe 'Songs index', type: :feature do
  describe 'As a user' do
    describe 'When I visit /songs, ' do
      it 'I see each song\'s title and play count' do
        artist = Artist.create(name: 'Stinky Pete')
        song_1 = artist.songs.create!(title: "I Really Like You", length: 208, play_count: 2456357, artist: artist)
        song_2 = artist.songs.create!(title: "I Stink", length: 500, play_count: 25482, artist: artist)

        visit '/songs'

        expect(page).to have_content(song_1.title)
        expect(page).to have_content(song_2.title)
        expect(page).to have_content("Play count: #{song_1.play_count}")
        expect(page).to have_content("Play count: #{song_2.play_count}")
      end
    end
  end
end
