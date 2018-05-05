class Genre < ActiveRecord::Base
  has_many :songs
  has_many :artists, through: :songs

  def song_count
    # return the number of songs in a genre
    self.songs.count
  end

  def artist_count
    self.songs.length
  end

  def all_songs
    self.songs.select { |song| song.genre == self }
  end

  def all_artist_names
    # return an array of strings containing every musician's name
    self.all_songs.map { |song| song.artist.name }
  end

end
