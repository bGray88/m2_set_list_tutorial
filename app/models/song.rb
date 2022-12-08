class Song < ApplicationRecord
  belongs_to :artist
  has_many :playlists, through::playlist_songs
  has_many :playlist_songs
end
