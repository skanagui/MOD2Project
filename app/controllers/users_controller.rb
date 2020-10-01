class UsersController < ApplicationController
    skip_before_action :authorized, only: [:new, :create, :login, :handle_login]
    def index
        @current_user = User.find_by(id: session[:user])

        @users = User.all 
    end 
    def show
        @current_user = User.find_by(id: session[:user])

        @user = User.find(params[:id])
    end


    def new
        @current_user = User.find_by(id: session[:user])
        
        @user = User.new 

    end 
    def create
        @current_user = User.find_by(id: session[:user])

        user = User.create(user_params)
        
        if user.valid?
            session[:user] = @user.id
           redirect_to users_path
        else
            flash[:user_errors] = user.errors.full_messages
            redirect_to new_user_path
        end

    end
    
    def edit
        @current_user = User.find_by(id: session[:user])

        @user = User.find(user_params)
    end 
    
    def update 
        @current_user = User.find_by(id: session[:user])

    end

    def delete
        @current_user = User.find_by(id: session[:user])

    end 
    def login
        # KNOWS TO LINK TO login.html.erb BECAUSE login METHOD_NAME MATCHES login.html.erb
    end
    
    
    def handle_login
        # params is a hash, with keys provided by the form_tag
        # the values of params is coming from the user-input
    
        @user = User.find_by(name: params[:name])
    
        if @user && @user.authenticate(params[:password])
            session[:user] = @user.id
            redirect_to user_path(@user)                        # may want to consider a redirect? 
        else
            flash[:message] = "Incorrect Username or Password"
            redirect_to login_path
        end                 
    end

    # def logout
    #     session[:user] = nil
    #     redirect_to login_path
    # end

    private
    def user_params
        params.require(:user).permit(:name, :password, :age, :email, :borough, :phone_number, :password_confirmation)
    end                                                                         #added password_confirmation

end




