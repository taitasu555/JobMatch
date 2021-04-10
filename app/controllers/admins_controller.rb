class AdminsController < ApplicationController
  def index
    @jobs = Job.where(user_id: current_user.id).all
  end
end
