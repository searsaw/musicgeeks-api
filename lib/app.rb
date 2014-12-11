module API
  class Version1 < Grape::API
    version 'v1', using: :header, vendor: :musicgeeks, strict: true, cascade: false
    format :json
    rescue_from :all

  end
end