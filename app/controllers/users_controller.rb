class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @posts = current_user.posts
  end

  def update
    if @user.update(user_params)
      redirect_to controller: :users, action: :show
    else
      render :edit
    end
  end

  def user_params
    params.require(:user).permit(:name, :avatar)
  end
end
