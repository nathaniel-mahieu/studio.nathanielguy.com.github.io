# Methods added to this helper will be available to all templates in the application.
module StudioHelper
   def filenamealize(string)
    string.gsub(/[^\w\.\-]/,'_').downcase
  end  
  def get_filename(string)
    string.gsub(/[^\w\.\-]/,'_').downcase
  end
end
