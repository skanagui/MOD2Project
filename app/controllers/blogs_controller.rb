class BlogsController < ApplicationController

    before_action :find_blog, only: [:show, :edit, :update, :likes]

    def index
        @blogs = Blog.all
    end 

    def show
        @blog = Blog.find(params[:id])
    end 


    def new
        @blog = Blog.new 
    end 
    def create
        @blog = Blog.create(blog_params)

        if @blog.valid?
            redirect_to blog_path(blog)
        else
            flash[:my_errors] = @blog.errors.full_messages
            redirect_to new_blog_path
        end 
        #redirect_to blogs_path
    end


    def edit
        @blog = Blog.find(params[:id])
    end 
    def update
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
