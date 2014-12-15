module API
  class Version1 < Grape::API
    version 'v1', using: :header, vendor: :musicgeeks, strict: true, cascade: false
    format :json
    formatter :json, Grape::Formatter::Rabl
    rescue_from :all

    resource :songs do

      get '/', rabl: 'songs/songs' do
        @songs = Song.all
      end

      get ':slug', rabl: 'songs/song' do
        @song = Song.find(slug: params[:slug].to_s)
      end

    end

  end
end