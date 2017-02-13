class PagesController < ApplicationController
  before_action :set_page, only: [:edit, :update, :destroy, :show]
  
  def homepage
    
  end
  
  def index
    @pages = Page.all
    
  end
  
  def destroy
   # @page = Page.find(params[:id])
    @page.destroy
    flash[:notice] = "The page titled #{@page.title} was deleted"
    redirect_to pages_path
  end
  
  def about
    
  end
  
  def new
    #@page = Article.new
    @page = Page.new
  end
  
  def create
    if @page.save
      flash[:notice] = "Page was succesfully created!"
      redirect_to page_path(@page)
    else
      render 'new'
     end 
  end
  
  def show
   # set_page
  end
  
  def edit
    #set_page  
  end
  
  def update
    #set_page
    if @page.update(page_params)
      flash[:notice] = "Update succesful"
      redirect_to page_path(@page)
    else
      render 'edit'
    end
    
  end
  
  private
  def page_params
    params.require(:page).permit(:title, :description)
  end
  
  def set_page
    @page = Page.find(params[:id])
  end
  
end