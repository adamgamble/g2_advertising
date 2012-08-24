require_relative 'env.rb' unless Rails.env.production?
require 'dragonfly'

app = Dragonfly[:images]
app.configure_with(:imagemagick)
app.configure_with(:rails)
app.datastore = Dragonfly::DataStorage::S3DataStore.new({
  :bucket_name        => ENV["S3_BUCKET"],
  :access_key_id      => ENV["amazon_s3_access_key"],
  :secret_access_key  => ENV["amazon_s3_secret_key"]
})
app.define_macro(ActiveRecord::Base, :image_accessor)
