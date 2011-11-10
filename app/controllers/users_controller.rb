class UsersController < ApplicationController
  
  def index
  end
  
  def login
    if User.authenticate(params[:name], params[:password])
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
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(params[:user])
    if @user.save
      sign_in @user
      flash[:success] = "Welcome to the Sample App!"
      redirect_to @user
    else
      @title = "Sign up"
      render 'new'
    end
  end

  
  def show
    @user = User.find(params[:id])
  end
  
  def edit
    @user = User.find(session[:user].id)
  end
  
  def update
    @user = User.find(params[:id])
    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html{redirect_to(@user, :notice => "Account Updated and Saved")}
      else
        format.html{render :action => :edit, :error => "Account Not Updated"}
      end
    end
  end
end
