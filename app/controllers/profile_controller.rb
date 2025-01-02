class ProfileController < ApplicationController
  before_action :require_user_logged_in!

  def edit    
  end

  def update
    if Current.user.authenticate(params[:user][:old_password])
      if Current.user.update(password_params)
        redirect_to root_path, notice: "Password Updated!"
      else
        render :edit
      end
    else
      flash[:alert] = "old password is not correct"
      render :edit
    end
  end

  private

  def password_params
    params.require(:user).permit(:password, :password_confirmation)
  end

end
