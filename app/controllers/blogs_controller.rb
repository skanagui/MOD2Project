class BlogsController < ApplicationController

    before_action :find_blog, only: [:show, :edit, :update, :likes]

    def index
        @current_user = User.find_by(id: session[:user])
        @blogs = Blog.all
    end 

    def show
        @current_user = User.find_by(id: session[:user])

        @blog = Blog.find(params[:id])
    end 


    def new
        @current_user = User.find_by(id: session[:user])

        @blog = Blog.new 
    end 
    def create
        #@current_user = User.find_by(id: session[:user])
        #@user = @current_user
        newblog= @current_user.blogs << Blog.create(blog_params)
        #byebug
        redirect_to blogs_path


        #@blog = Blog.create(blog_params)
        # if @current_user = current_user.id
        # if @blog.valid?
        #     redirect_to blogs_path
        # else
        #     flash[:my_errors] = @blog.errors.full_messages
        #     redirect_to new_blog_path
        # end 
        # end
        #redirect_to blogs_path
    end


    def edit
        @current_user = User.find_by(id: session[:user])

        @blog = Blog.find(params[:id])
    end 
    def update
        @current_user = User.find_by(id: session[:user])

        @blog = Blog.find(params[:id])
        
        @blog.update(blog_params)
        redirect_to blog_path(@blog)
    end 


    def likes
        @blog.likes += 1
        @blog.save
        redirect_to blog_path(@blog)
    end

    private 
    def find_blog
        @blog = Blog.find(params[:id])
    end    

    def blog_params
        params.require(:blog).permit(:title, :body, :date, :likes)
    end  

end
