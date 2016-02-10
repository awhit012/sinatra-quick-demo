class FirstSinatraApp < Sinatra::Base
  get "/" do # this is the route, a ROOT route. our homepage!
    # erb :"index" # this is the view we're going to render, straight text
  end

  get '/songs' do
    @songs = ["Fly Me To The Moon", "New York, New York", "Luck Be A Lady"]
    erb :"songs"
  end

  get '/songs/:id' do
    song_hashes = create_objects
    @songs = ["Fly Me To The Moon", "New York, New York", "Luck Be A Lady"]
    @song = song_hashes[params[:id].to_i]
    erb :"show"
  end

  def create_objects
    @song_hashes = []
    @songs = ["Fly Me To The Moon", "New York, New York", "Luck Be A Lady"]
    @songs.each_with_index do |song, index|
      @song_hashes << {id: index, name: song, img: "http://i.giphy.com/rfofDhVoQbdSg.gif"}
    end
    @song_hashes
  end
end
