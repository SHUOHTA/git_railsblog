class BlogsController < ApplicationController
  
  before_action :move_to_index, except: :index
  
  def index
    #@blogs = Blog.all.order("created_at DESC").page(params[:page]).per(3)
    @blogs = Blog.all
  end
  
  def new
  end
  
  def create
    Blog.create(title: blog_params[:title] ,text: blog_params[:text], user_id: current_user.id)
    redirect_to action: :index
  end
  
  def show
    @blog = Blog.find(params[:id])
  end

  def destroy
    blog = Blog.find(params[:id])
    if blog.user_id == current_user.id
      blog.destroy
    end
  end
  
  private
  def blog_params
    params.permit(:title, :text)
  end
  
  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end
  
end
