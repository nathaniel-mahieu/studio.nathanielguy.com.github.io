class StudioController < ActionController::Base
 
  def reverse_filename(string) #clean up usage
    string.gsub(/_/,' ').downcase
  end
   def get_filename(string)
    string.gsub(/[^\w\.\-]/,'_').downcase
  end
  def about
  		@page_heading = 'About NathanielGuy Studio'
	 render(:layout => 'studio_1', :action => 'about_1')
  end
  
    def prints
  		@page_heading = 'Prints / Contact'
	  render(:layout => 'studio_1', :action => 'prints_1')
  end
  
  def browse
    @catagories_pictures = @pictures
    if params[:catagory] != nil
      @catagory_viewing = Catagory.find :first, :conditions => 'name = "' + params[:catagory] + '"'
      for catagory in @catagories
        if catagory[:name].downcase == params[:catagory].downcase
	  @catagories_pictures = Picture.find_by_sql 'SELECT * FROM pictures, catagories_pictures WHERE ((catagories_pictures.picture_id = pictures.id) AND (catagories_pictures.catagory_id = ' + catagory.id.to_s + '))'
        end
      end
    end
	@page_heading = 'Browse'
	 render(:layout => 'studio_1', :action => 'browse_1')
  end
  
  def index
    @page_heading = 'Welcome'
    render :layout => 'studio_1', :view => 'index'
  end
  
  def search
    @search_phrase = params[:phrase]
	@page_heading = 'Search "' + params[:phrase] + '"'
	render(:layout => 'studio_1', :action => 'search_1')
  end
  
  def view 
    requested_image = reverse_filename params[:title]
    
    @picture_requested = Picture.find :first, :conditions => 'title = "' + requested_image + '"'
    
    if @picture_requested != nil
      @filename = get_filename(@picture_requested.title)
      @picture_requested.update_attributes({ :views => @picture_requested.views += 1})
      @picture = @picture_requested
      
      @pic_next = @pictures.randomly_pick(1)[0]
      @pic_prev = @pictures.randomly_pick(1)[0]
	  @page_heading = @picture.title

      render(:layout => 'studio_1', :action => 'view_1')
	  
    else
	  params[:phrase] = requested_image
      headers["Status"] = "404 Not Found"
	  search
    end
  end
  
  def slideshow
    if params[:catagory] != nil
      @catagory_viewing = Catagory.find:first, :conditions => 'name = "' + params[:catagory] + '"'
      for catagory in @catagories
        if catagory[:name].downcase == params[:catagory].downcase
	  @pictures = Picture.find_by_sql 'SELECT * FROM pictures, catagories_pictures WHERE ((catagories_pictures.picture_id = pictures.id) AND (catagories_pictures.catagory_id = ' + catagory.id.to_s + '))'
        end
      end
    end
    @picture = @pictures.randomly_pick(2)
    render :layout => false
  end
  
#Ajax
  def get_photostream_pic
    @picture = @pictures.randomly_pick(1)[0]
    render :layout => false
    no_cache
  end
 
  def google_gadget_pic
    @picture = @pictures.randomly_pick(1)[0]
    render :layout => false
    no_cache
  end
  
  def google_gadget
    @pic = @pictures.randomly_pick(1)[0]
    render :layout => false
    no_cache
  end
  
  def get_slideshow_picture
    @picture = @pictures.randomly_pick(1)
    render :layout => false
    no_cache
  end

#xml
  def rss_xml
    render :layout => false, :template => 'studio/rss.rxml'
  end
  def sitemap
    headers["Content-Type"] = "application/xml; charset=utf-8"
    render :layout => false
  end
  
#Redirections
  def admin
    redirect_to :controller => 'admin/pictures'
  end

#Private!  
  private

  def initialize 
    @pictures = Picture.find(:all, :order => 'date_added asc')
    @catagories = Catagory.find(:all)
	
	search_terms = ['shadows', 'beautiful', 'interesting', 'color', 'contrast', 'guitar', 'spoon', 'wood', 'light', 'texture']
	
    @last_picture = @pictures[-1]
	@search_term = search_terms.randomly_pick(1)
    @photostream_pics = @pictures.randomly_pick(3)
	@random_pic = @pictures.randomly_pick(1)
	
  end
  
def no_cache
  headers['Cache-control'] = 'max-age=0'
  headers['Pragma'] = 'no-cache'
  headers['Expires'] = '-1'
end
  
end

class Array
  def randomly_pick(number)
     shuffle.slice(0...number)
  end
end
