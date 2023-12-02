class AddYoutubeUrlToTourists < ActiveRecord::Migration[6.1]
  def change
    add_column :tourists, :youtube_url, :string
  end
end
