class MatchingController < ApplicationController

  # ==========ここから追加する==========
  before_action :authenticate_user!

  def index
    got_enrollment_user_ids = Enrollment.where(to_user_id: current_user.id).pluck(:from_user_id)
    @match_users = Enrollment.where(to_user_id: got_enrollment_user_ids, from_user_id: current_user.id).map(&:to_user)
    @user = User.find(current_user.id)
  end
  # ==========ここまで追加する==========

end
