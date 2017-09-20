class DashboardsController < ApplicationController
  def index
    @batches = Batch.all
  end

  def create_new_user
    if params[:user].present?
      @user = User.new(user_params)
      if @user.save
        redirect_to root_path
      else
        render :back
      end
    else
      @user = User.new
    end
  end

  def create_new_batch
  end

  private

  def user_params
    params.require(:user).permit(
      :user_name,
      :designation,
      :phone,
      :company_name,
      :role_id,
      :email,
      :password,
      :password_confirmation
    )
  end
end