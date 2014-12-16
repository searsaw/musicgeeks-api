class AccessToken < Sequel::Model
  many_to_one :users
end