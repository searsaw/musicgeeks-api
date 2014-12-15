Sequel.migration do

  up do
    create_table :songs do
      primary_key :id
      String :url, null: false
      String :slug, null: false
      String :page_title
      String :song_title
      String :soundcloud_url, null: false
      String :gif_url, null: false
      String :love
      String :who_where
      String :cred
      String :posted_on, null: false
    end
  end

  down do
    drop_table :songs
  end

end