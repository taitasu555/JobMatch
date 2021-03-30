class HomeController < ApplicationController
  def top
    @jobs = Job.all.limit(4)
    @recent_jobs = Job.all.limit(4).order(created_at: :desc)
  end
end
