module API
  class Version1 < Grape::API
    version 'v1', using: :header, vendor: :musicgeeks, strict: true, cascade: false
    format :json
    rescue_from :all

    resource :songs do

      get do
        @songs = Song.all
      end

      get ':slug' do
        @song = Song.find(slug: params[:slug].to_s)
      end

    end

  end
end