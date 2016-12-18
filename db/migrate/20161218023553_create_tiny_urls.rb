##
# Table for TinyUrls
class CreateTinyUrls < ActiveRecord::Migration
  def change
    create_table :tiny_urls do |t|
      t.string :full_url
      t.string :shortend_url

      t.timestamps null: false
    end
  end
end
