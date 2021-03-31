class HomeController < ApplicationController
  skip_before_action :authenticate_user!, :only => [:top]
  def top
    @jobs = Job.all.limit(4)
    @recent_jobs = Job.all.limit(4).order(created_at: :desc)
  end
end
