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
end
