require 'pry'
class MusicLibraryController

  def initialize(path = "./db/mp3s")
    importer = MusicImporter.new(path)
    importer.import
  end


    def call
      input = ""
    #  input = gets.strip
      puts "Welcome to Your Music Library!"
      puts "What would you like to do?"
      while input != "exit"

        input = gets.strip
        case input
        when "list songs"
          songs

        when "list artists"
          artists

        when "list genres"
          genres

        when "play song"
          play_song

        when "list artist"
             list_artist
        when "list genre"
             list_genre


        end
      end
    end

  def songs
    Song.all.each.with_index(1) do |song, index|
      puts "#{index}. #{song}"
    end
  end

  def artists
    Artist.all.each.with_index(1) do |artist, index|
      puts "{index}. #{artist}"
    end
  end

  def genres
    Genre.all.each.with_index(1) do |g, i|
      puts "#{i}. #{g}"
    end
  end

  def play_song
    puts "What song number would you like to play?"
    song_input = gets.strip
    puts "Playing #{Song.all[song_input.to_i-1]}"
  end

  def list_artist
  puts "What artist by name you like to list songs for?"
  artist_input = gets.strip
  if artist = Artist.find_by_name(artist_input)
    artist.songs.each do |s,i|
      puts "#{i}. #{s}"
    end
  end
end

def list_genre
  puts "What genre by name you like to list songs for?"
  genre_input = gets.strip
  if genre = Genre.find_by_name(genre_input)
    genre.songs.each do |s,i|
      puts "#{i}. #{s}"
    end
  end
end




end
