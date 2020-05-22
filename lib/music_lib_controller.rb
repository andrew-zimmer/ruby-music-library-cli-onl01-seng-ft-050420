require 'pry'
class MusicLibraryController 
  attr_accessor :path
  
  def initialize(path="./db/mp3s")
    @path =path 
    MusicImporter.new(@path).import
  end
  
  def call 
    puts "Welcome to your music library!"
    puts "To list all of your songs, enter 'list songs'."
    puts "To list all of the artists in your library, enter 'list artists'."
    puts "To list all of the genres in your library, enter 'list genres'."
    puts "To list all of the songs by a particular artist, enter 'list artist'."
    puts "To list all of the songs of a particular genre, enter 'list genre'."
    puts "To play a song, enter 'play song'."
    puts "To quit, type 'exit'."
    puts "What would you like to do?"
    respond = gets.strip
    call if respond != "exit"
  end 
  
  def list_songs 
    Song.all.sort{|a,b| a.name <=> b.name}.each.with_index(1){|song, index| puts "#{index}. #{song.artist.name} - #{song.name} - #{song.genre.name}"}
  end 
  
  def list_artists
    Artist.all.sort{|a,b| a.name <=> b.name}.each.with_index(1){|artist, index| puts "#{index}. #{artist.name}"}
  end 
  
  def list_genres 
    Genre.all.sort{|a,b| a.name <=> b.name}.each.with_index(1){|genre, index| puts "#{index}. #{genre.name}"}
  end 
  
  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    respond = gets.strip 
    
  end 
end 