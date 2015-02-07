class AccessToken < Sequel::Model
  many_to_one :users

  def valid_on_domain?(host)
    domain == host.sub(/^https?:\/\/([A-Za-z0-9.:-]*)\/?$/, '\1')
  end
end