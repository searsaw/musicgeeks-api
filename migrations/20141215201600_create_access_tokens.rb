Sequel.migration do

  up do
    create_table :access_tokens do
      primary_key :id
      foreign_key :user_id, :users
      String :token
      String :domain
      index :token, unique: true
    end
  end

  down do
    drop_table :access_tokens
  end

end