class UsersController < ApplicationController
  
  def index
  end

  def new
    @user = User.new
    @title = "Sign up"
  end
  
  def create
    @user = User.new(params[:user])
    respond_to do |format|
      if @user.save
        session[:user] = @user
        flash[:success] = "Welcome to the Sample App!"
        format.html {redirect_to(@user, :notice => "Account Created")}
      else
        format.html {render :action => "new"}
      end
    end
  end
  
  def login
    if User.validate(params[:name], params[:password])
      session[:user] = User.find_by_name(params[:name])
      flash[:notice] = "Successful Login"
    else
      flash[:error] = "Incorrect credentials"
    end
    redirect_to :users

  end
  
  def logout
    session[:user] = nil
    flash[:notice] = "You are now Logged Out"
    redirect_to :users
  end
  
  def show
    @user = User.find(params[:id])
  end
  
end