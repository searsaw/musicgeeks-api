module API
  class Version1 < Grape::API
    version 'v1'
    format :json
    formatter :json, Grape::Formatter::Rabl
    rescue_from :all

    helpers do
      def access_token_valid?
        token = AccessToken.find(token: params[:apikey])
        token && request.referer && token.valid_on_domain?(request.referer)
      end
    end

    before do
      error! 'Access Denied', 401 unless access_token_valid?
    end

    resource :songs do

      get '/', rabl: 'songs/songs' do
        @songs = Song.order(Sequel.desc(:posted_on)).all
      end

      get ':slug', rabl: 'songs/song' do
        @song = Song.find(slug: params[:slug].to_s)
      end

    end

  end
end