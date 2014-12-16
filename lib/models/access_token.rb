class AccessToken < Sequel::Model
  many_to_one :users

  def valid_on_domain?(host)
    domain == host
  end
end