class UsersController < ApplicationController
    def index
        @users = User.all 
    end 
    def show
        @user = User.find(params[:id])
    end

    def new
        @user = User.new 
    end 
    def create
        user = User.create(user_params)
        
        if user.valid?
           redirect_to users_path
        else
            flash[:user_errors] = user.errors.full_messages
            redirect_to new_user_path
        end

    end
    
    def edit
        @user = User.find(user_params)
    end 
    
    def update 
    end

    def delete
    end 
    def login
        # KNOWS TO LINK TO login.html.erb BECAUSE login METHOD_NAME MATCHES login.html.erb
    end
    
    
    def handle_login
        # params is a hash, with keys provided by the form_tag
        # the values of params is coming from the user-input
    
        @user = User.find_by(name: params[:name])
    
        if @user && @user.authenticate(params[:password])
            redirect_to user_path(@user)
        else
            flash[:message] = "Incorrect Username or Password"
            redirect_to login_path
        end
    end

    private
    def user_params
        params.require(:user).permit(:name, :password, :age, :email, :borough, :phone_number)
    end 

end




