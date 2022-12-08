require 'rails_helper'

RSpec.describe Artist, type: :model do
  it {should have_many :songs}

  describe 'instance methods' do
    describe '#average song length' do
      before :each do
        @artist = Artist.create!(name: 'Eugene')
        @rain   = @artist.songs.create!(title: 'Rains a Fallin\'', length: 845, play_count: 8599)
        @chick  = @artist.songs.create!(title: 'Chicken Pluckin\'', length: 555, play_count: 8009)
        @truck  = @artist.songs.create!(title: 'Four Wheel Truckin\'', length: 795, play_count: 5564)
      end
      it 'returns the average song length' do
        expect(@artist.average_song_length.round(2)).to eq(731.67)
      end
    end
  end
end
