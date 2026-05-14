class UsersController < ApplicationController
  skip_load_and_authorize_resource
  before_action :authenticate_user!

  def search
    query = params[:query].to_s.strip.downcase
    
    if query.length < 2
      render json: { users: [] }
      return
    end

    users = User.where("LOWER(email) LIKE ?", "%#{query}%")
                .where.not(id: current_user.id)
                .limit(10)
                .select(:id, :email)

    render json: { users: users }
  end

  def profile
    @user = current_user
  end

  def update_profile
    @user = current_user
    if @user.update(profile_params)
      redirect_to profile_path, notice: "Profile updated successfully."
    else
      render :profile, status: :unprocessable_entity
    end
  end

  private

  def profile_params
    params.require(:user).permit(:name, :email)
  end
end
