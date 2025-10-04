class Admin::CatagoriesController < ApplicationController
  #before_filter :off_limits  
  def index
    list
    render :action => 'list'
  end

  def list
    @catagory_pages, @catagories = paginate :catagories, :per_page => 10
  end

  def show
    @catagory = Catagory.find(params[:id])
  end

  def new
    @catagory = Catagory.new
  end

  def create
    @catagory = Catagory.new(params[:catagory])
    if @catagory.save
      flash[:notice] = 'Catagory was successfully created.'
      redirect_to :action => 'list'
    else
      render :action => 'new'
    end
  end

  def edit
    @catagory = Catagory.find(params[:id])
  end

  def update
    @catagory = Catagory.find(params[:id])
    if @catagory.update_attributes(params[:catagory])
      flash[:notice] = 'Catagory was successfully updated.'
      redirect_to :action => 'show', :id => @catagory
    else
      render :action => 'edit'
    end
  end

  def destroy
    Catagory.find(params[:id]).destroy
    redirect_to :action => 'list'
  end
end
