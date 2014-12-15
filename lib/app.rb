module API
  class Version1 < Grape::API
    version 'v1', using: :header, vendor: :musicgeeks, strict: true, cascade: false
    format :json
    rescue_from :all

    resource :songs do

      get do
        @songs = Song.all
      end

      get ':id' do
        @song = Song.with_pk!(params[:id])
      end

    end

  end
end