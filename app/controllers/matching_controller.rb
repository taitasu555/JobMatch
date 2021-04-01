class MatchingController < ApplicationController

  before_action :authenticate_user!

  def index
    got = Enrollment.where(to_user_id: current_user.id).all
    @match_users = Enrollment.where(to_user_id: got_enrollment_user_ids, from_user_id: current_user.id).map(&:to_user)
    @user = User.find(current_user.id)
  end


end
