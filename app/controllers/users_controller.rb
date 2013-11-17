class UsersController < ApplicationController

  def resource_name
    :user
  end

  def resource
    @resource ||= User.new
  end
  
  def index
  end

  def create
    @user = User.new(user_params)
    @user.save
    redirect_to action: :show, id: @user.id
  end

  def new
  end

  def edit
  end

  def update
  end

  def show
  end

  def destroy
  end
  
  helper_method :resource, :resource_name, :devise_mapping
end
