require 'RMagick'
include Magick

class Admin::PicturesController < ApplicationController
  #before_filter :off_limits
  def index
    list
    render :action => 'list'
  end

  def list
    @picture_pages, @pictures = paginate :pictures, :per_page => 30
  end

  def show
    @picture = Picture.find(params[:id])
  end

  def new
    @picture = Picture.new
    @catagories = Catagory.find_all
  end

  def create
    @catagories = Catagory.find_all
    @picture = Picture.new(params[:picture])
    
    @picture.image_file= ImageList.new(@params[:picture_file].path)
    @picture.filename= get_filename @params[:picture][:title]
    
    @picture.catagories = Catagory.find(@params[:catagory_ids]) if @params[:catagory_ids]
    if @picture.save
      flash[:notice] = 'Picture was successfully created.'
      redirect_to :action => 'list'
    else
      render :action => 'new'
    end
  end

  def edit
    @picture = Picture.find(params[:id])
    @catagories = Catagory.find_all
  end

  def update #Must rename picture on update
    @params = params
    @picture = Picture.find(params[:id])
    @picture.catagories = Catagory.find(@params[:catagory_ids]) if @params[:catagory_ids]
    if @picture.update_attributes(params[:picture])
      flash[:notice] = 'Picture was successfully updated.'
      redirect_to :action => 'show', :id => @picture
    else
      render :action => 'edit'
    end
  end

  def destroy
    @picture = Picture.find(params[:id])
    @picture.filename= get_filename(@picture[:title])
    
    @picture.destroy
    redirect_to :action => 'list'
  end
  
  #private 
end
