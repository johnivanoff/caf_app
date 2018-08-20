# Set the host name for URL creation
SitemapGenerator::Sitemap.default_host = "https://commemorativeairforce.com"

SitemapGenerator::Sitemap.create do
  # Put links creation logic here.
  #
  # The root path '/' and sitemap index file are added automatically for you.
  # Links are added to the Sitemap in the order they are specified.
  #
  # Usage: add(path, options={})
  #        (default options are used if you don't specify)
  #
  # Defaults: :priority => 0.5, :changefreq => 'weekly',
  #           :lastmod => Time.now, :host => default_host
  #
  # Examples:
  #
  # Add '/news'
  #
      add news_path, :priority => 0.7, :changefreq => 'daily'
  #
  # Add all public news articles:
  #
      Content.news.public.find_each do |content|
        add content_path(content), :lastmod => content.updated_at
      end



  add '/home'
  add '/news'
  add '/blogs'
  add '/contacts'
  add '/careers'
  add '/airbase'
  add '/rtl-support' 
  add '/privacy_policy'
  add '/membership'
  add '/hq_directory'
  add '/headquarters_staff'
  add '/general_staff'
  add '/content/:id/news_edit'
  add '/aircraft_rides'
  add '/hall_of_fame'


events
units
aircraft




end
