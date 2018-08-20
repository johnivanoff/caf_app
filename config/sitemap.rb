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


  # Hard-coded pretty urls
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
    add '/request_an_aircraft_appearance'
    add '/how_to_get_involved_with_the_caf'
    add '/about'
    add '/support'
    add '/donation'
    add '/sponsor_an_aircraft'
    add '/support_a_special_caf_project'
    add '/join_the_heritage_club'
    add '/join_the_victory_circle'
    add '/aircraft_donations'
    add '/education'
    add '/airbase'
    add '/non_profit_information'
    add '/membership'
    add '/membership_options'
    add '/how_to_get_involved'
    add '/renew_membership'
    add '/member_benefits'
    add '/contact_member_services'
    add '/media_inquiries'

  # Add '/aircraft'
  #
#      add aircraft_path, :priority => 0.7, :changefreq => 'weekly'
  #
  # Add all aircraft:
  #
      Aircraft.find_each do |aircraft|
        add aircraft_path(aircraft), :lastmod => aircraft.updated_at
      end

  # Add '/events'
  #
      add events_path, :priority => 0.7, :changefreq => 'daily'
  #
  # Add all upcaoming events:
  #
      Event.ordered.published.find_each do |event|
        add event_path(event), :lastmod => event.updated_at
      end

  # Add '/units'
  #
      add units_path, :priority => 0.7, :changefreq => 'weekly'
  #
  # Add all units:
  #
      Unit.alpha_order.find_each do |unit|
        add unit_path(unit), :lastmod => unit.updated_at
      end

  # Add '/news'
  #
      add news_path, :priority => 0.7, :changefreq => 'daily'
  #
  # Add all public news articles:
  #
      Content.news.public.find_each do |content|
        add content_path(content), :lastmod => content.updated_at
      end



end
