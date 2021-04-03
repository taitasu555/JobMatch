class UsersController < ApplicationController
 
  
  before_action :set_user, only: [:edit, :update, :show]

  def index
    @q = User.ransack(params[:q])
    @users = @q.result(distinct: true)
  end

  def show
  end

  def edit
  end

  def update
    if @user.update(user_params)
      if current_user.has_role?(:admin)
        redirect_to root_path, notice: 'User roles were successfully updated.'
      else
        redirect_to root_path, notice: 'User roles were successfully updated.'
      end
      
    else
      render :edit
    end
  end

  private

    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit({role_ids: []}, :name, :company)
    end
end
