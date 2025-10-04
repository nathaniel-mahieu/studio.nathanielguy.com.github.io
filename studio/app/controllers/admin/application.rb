# Filters added to this controller will be run for all controllers in the application.
# Likewise, all the methods added will be available for all controllers.
class ApplicationController < ActionController::Base

  session :off
  
  require 'RMagick'
  include Magick
  
  def reverse_filename(string) #clean up usage
    string.gsub(/_/,' ').downcase
  end
  
  def get_filename(string)
    string.gsub(/[^\w\.\-]/,'_').downcase
  end
  
  def off_limits
    headers["Status"] = "404 Not Found"
    render :action => 'off_limits', :layout => false
  end
  
end