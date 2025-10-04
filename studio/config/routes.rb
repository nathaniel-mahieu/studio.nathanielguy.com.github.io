ActionController::Routing::Routes.draw do |map|
  map.connect 'sitemap.xml', :controller => 'studio', :action => 'sitemap'
  map.connect 'rss.xml', :controller => 'studio', :action => 'rss_xml'
  
  map.connect 'index', :controller => 'studio', :action => 'index'
  map.connect '/', :controller => 'studio', :action => 'index'
  map.connect 'google_gadget', :controller => 'studio', :action => 'google_gadget'
  map.connect 'google_gadget_pic', :controller => 'studio', :action => 'google_gadget_pic'
  map.connect 'ads', :controller => 'studio', :action => 'ads'
  map.connect 'search', :controller => 'studio', :action => 'search'
  map.connect 'browse', :controller => 'studio', :action => 'browse'
  map.connect 'prints', :controller => 'studio', :action => 'prints'
  map.connect 'admin', :controller => 'admin/pictures', :action => 'index'
  map.connect 'about', :controller => 'studio', :action => 'about'
  map.connect 'rss', :controller => 'studio', :action => 'rss'
  map.connect 'slideshow', :controller => 'studio', :action => 'slideshow'
  map.connect 'get_slideshow_picture', :controller => 'studio', :action => 'get_slideshow_picture'
  map.connect 'get_photostream_pic', :controller => 'studio', :action => 'get_photostream_pic'
  map.connect ':title', :controller => 'studio', :action => 'view'

  # Install the default route as the lowest priority.
  map.connect ':controller/:action/:id'
end
