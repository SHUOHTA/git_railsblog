class BlogsController < ApplicationController
  
  before_action :move_to_index, except: [:index, :show]
  
  def index
    @blogs = Blog.order("updated_at DESC").page(params[:page]).per(10)
  end
  
  def new
  end
  
  def create
    Blog.create(title: blog_params[:title] ,text: blog_params[:text], image: blog_params[:image], user_id: current_user.id)
    redirect_to action: :index
  end
  
  def show
    @blog = Blog.find(params[:id])
  end
  
  def edit
    @blog = Blog.find(params[:id])
  end

  def destroy
    blog = Blog.find(params[:id])
    if blog.user_id == current_user.id
      blog.destroy
    redirect_to action: :index
    end
  end
  
  def update
    blog = Blog.find(params[:id])
    if blog.user_id == current_user.id
      blog.update(blog_params)
    end
    redirect_to action: :index
  end
  
  private
  def blog_params
    params.permit(:title, :text, :image)
  end
  
  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end
  
end
