class RemoveIndexFromShortenedUrls < ActiveRecord::Migration[6.1]
  def change
    remove_index :shortened_urls, :long_url
  end
end
