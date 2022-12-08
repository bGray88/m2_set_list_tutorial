class Artist < ApplicationRecord
  has_many :songs, through::playlist_songs,  :dependent => :destroy
  has_many :playlist_songs

  def average_song_length
    self.songs.average(:length).round(2)
  end
end
